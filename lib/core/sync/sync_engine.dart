import 'dart:convert';

import 'package:drift/drift.dart';

import '../database/app_database.dart';
import 'row_applier.dart';

/// Transport to the cloud. Implemented with Supabase in production and by an
/// in-memory fake in tests.
abstract interface class SyncRemote {
  /// Upserts rows (by `id`). Throws [SyncRejected] when the server refuses
  /// the data, or any other exception for network problems.
  Future<void> upsert(String table, List<Map<String, Object?>> rows);

  /// Rows of [table] with `server_seq > afterSeq`, ordered by `server_seq`.
  Future<List<Map<String, dynamic>>> pull(String table, int afterSeq, int limit);
}

/// The server rejected the data (constraint, trigger or RLS), as opposed to
/// a network failure. Retrying will not help.
class SyncRejected implements Exception {
  const SyncRejected(this.code, this.message);

  final String code;
  final String message;

  @override
  String toString() => 'SyncRejected($code: $message)';
}

final class SyncReport {
  const SyncReport({required this.pushed, required this.pulled, required this.rejected});

  final int pushed;
  final int pulled;
  final int rejected;
}

/// Offline-first two-way sync (blueprint §7).
///
/// Push: outbox in FIFO order (which satisfies foreign keys), coalescing
/// repeated edits of a record, batched per table. A rejected batch is
/// retried row by row so one bad row cannot block the queue; rejected rows
/// move to `sync_issues`.
///
/// Pull: per table, rows with `server_seq` above the stored cursor. A row
/// with a pending local change is skipped — the push decides (server-side
/// last-write-wins) and the next pull brings the winner.
class SyncEngine {
  SyncEngine(this._db, this._remote, {DateTime Function()? clock, this.onPeopleChanged, this.batchSize = 200})
    : _clock = clock ?? (() => DateTime.now().toUtc());

  final AppDatabase _db;
  final SyncRemote _remote;
  final DateTime Function() _clock;
  final int batchSize;
  late final _applier = RowApplier(_db);

  /// Called with ids of people changed by a pull (to rebuild local search).
  final Future<void> Function(Set<String> personIds)? onPeopleChanged;

  /// Synced tables in dependency order.
  static const tables = [
    'places',
    'people',
    'person_names',
    'person_contacts',
    'person_addresses',
    'person_attributes',
    'parent_child',
    'partnerships',
    'social_connections',
    'family_groups',
    'family_group_members',
    'tags',
    'person_tags',
    'interactions',
    'interaction_participants',
    'reminders',
    'media',
    'person_merges',
  ];

  Future<SyncReport> syncOnce() async {
    final (pushed, rejected) = await push();
    final pulled = await pull();
    return SyncReport(pushed: pushed, pulled: pulled, rejected: rejected);
  }

  // ------------------------------------------------------------------ push

  Future<(int, int)> push() async {
    var pushed = 0;
    var rejected = 0;
    while (true) {
      final entries =
          await (_db.select(_db.syncOutbox)
                ..orderBy([(o) => OrderingTerm.asc(o.seq)])
                ..limit(batchSize))
              .get();
      if (entries.isEmpty) break;

      // Consecutive entries for the same table form one batch.
      final entity = entries.first.entity;
      final batch = entries.takeWhile((e) => e.entity == entity).toList();
      // Coalesce: latest payload per record, keeping first-seen order.
      final latest = <String, OutboxEntry>{};
      for (final e in batch) {
        latest.remove(e.recordId);
        latest[e.recordId] = e;
      }
      final rows = [for (final e in latest.values) jsonDecode(e.payload) as Map<String, Object?>];

      try {
        await _remote.upsert(entity, rows);
        pushed += rows.length;
      } on SyncRejected {
        // Isolate the bad row(s).
        for (final e in latest.values) {
          try {
            await _remote.upsert(entity, [jsonDecode(e.payload) as Map<String, Object?>]);
            pushed++;
          } on SyncRejected catch (err) {
            rejected++;
            await _db
                .into(_db.syncIssues)
                .insert(
                  SyncIssuesCompanion.insert(
                    entity: entity,
                    recordId: e.recordId,
                    payload: e.payload,
                    errorCode: Value(err.code),
                    message: Value(err.message),
                    createdAt: _clock(),
                  ),
                );
          }
        }
      }
      final seqs = batch.map((e) => e.seq).toList();
      await (_db.delete(_db.syncOutbox)..where((o) => o.seq.isIn(seqs))).go();
    }
    return (pushed, rejected);
  }

  // ------------------------------------------------------------------ pull

  Future<int> pull({int pageSize = 500}) async {
    var total = 0;
    for (final table in tables) {
      final info = _tableInfo(table);
      var cursor = await _cursor(table);
      while (true) {
        final rows = await _remote.pull(table, cursor, pageSize);
        if (rows.isEmpty) break;
        final changedPeople = <String>{};
        await _db.transaction(() async {
          for (final row in rows) {
            if (await _applier.apply(info, row) && table == 'people') changedPeople.add(row['id']! as String);
            final seq = (row['server_seq'] as num?)?.toInt() ?? cursor;
            if (seq > cursor) cursor = seq;
          }
          await _db
              .into(_db.syncCursors)
              .insertOnConflictUpdate(
                SyncCursorsCompanion.insert(
                  entity: table,
                  lastServerSeq: Value(cursor),
                  lastPulledAt: Value(_clock()),
                ),
              );
        });
        total += rows.length;
        if (changedPeople.isNotEmpty) await onPeopleChanged?.call(changedPeople);
        if (rows.length < pageSize) break;
      }
    }
    return total;
  }

  Future<int> _cursor(String table) async {
    final row = await (_db.select(_db.syncCursors)..where((c) => c.entity.equals(table))).getSingleOrNull();
    return row?.lastServerSeq ?? 0;
  }

  TableInfo<Table, Object?> _tableInfo(String name) => _db.allTables.firstWhere((t) => t.actualTableName == name);

  // ---------------------------------------------------------------- status

  Stream<int> watchPendingCount() {
    final count = _db.syncOutbox.seq.count();
    return (_db.selectOnly(_db.syncOutbox)..addColumns([count])).map((r) => r.read(count) ?? 0).watchSingle();
  }

  Stream<List<SyncIssueRow>> watchIssues() => (_db.select(_db.syncIssues)..where((i) => i.resolvedAt.isNull())).watch();

  Future<void> dismissIssue(int id) => (_db.update(
    _db.syncIssues,
  )..where((i) => i.id.equals(id))).write(SyncIssuesCompanion(resolvedAt: Value(_clock())));

  /// Re-queues every live local row (used after first sign-in so data
  /// created before having an account is uploaded).
  Future<void> enqueueEverything() => _db.transaction(() async {
    for (final table in tables) {
      final info = _tableInfo(table);
      final rows = await _db.select(info).get();
      for (final row in rows) {
        final ins = row as Insertable<Object?>;
        final cols = ins.toColumns(false);
        final id = (cols['id']! as Variable<String>).value!;
        final payload = {
          for (final e in cols.entries)
            if (e.key != 'server_seq' && e.key != 'search_text') e.key: _jsonValue((e.value as Variable<Object>).value),
        };
        await _db
            .into(_db.syncOutbox)
            .insert(
              SyncOutboxCompanion.insert(
                entity: table,
                recordId: id,
                payload: jsonEncode(payload),
                createdAt: _clock(),
              ),
            );
      }
    }
  });

  static Object? _jsonValue(Object? v) => v is DateTime ? v.toUtc().toIso8601String() : v;
}
