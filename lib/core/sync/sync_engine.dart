import 'dart:convert';

import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../utils/search_text.dart';
import 'sync_remote.dart';
import 'sync_tables.dart';

/// Result of one sync run.
class SyncReport {
  const SyncReport({this.pushed = 0, this.pulled = 0, this.rejected = 0, this.error});

  final int pushed;
  final int pulled;

  /// Changes the server refused; they were moved to `sync_issues`.
  final int rejected;

  /// Set when the run stopped early because of network/server trouble.
  final SyncRemoteException? error;

  bool get ok => error == null;
}

/// Two-way sync between the local Drift database and Supabase
/// (blueprint §7): push the outbox in FIFO order, then pull changes by
/// `server_seq` cursor. Local data is never lost: a failed push leaves the
/// outbox untouched, and rejected changes are kept in `sync_issues`.
class SyncEngine {
  SyncEngine({required this._db, required this._remote, DateTime Function()? clock, this._pageSize = 1000})
    : _clock = clock ?? (() => DateTime.now().toUtc()),
      _specs = syncTables(_db);

  final AppDatabase _db;
  final SyncRemote _remote;
  final DateTime Function() _clock;
  final int _pageSize;
  final List<SyncTableSpec> _specs;

  static const _pushBatch = 200;

  Future<SyncReport>? _running;

  /// Runs a full push + pull. Concurrent callers share the run in progress.
  Future<SyncReport> sync() => _running ??= _run().whenComplete(() => _running = null);

  Future<SyncReport> _run() async {
    var pushed = 0;
    var rejected = 0;
    var pulled = 0;
    try {
      final push = await _push();
      pushed = push.pushed;
      rejected = push.rejected;
      pulled = await _pull();
    } on SyncRemoteException catch (e) {
      await _noteError(e);
      return SyncReport(pushed: pushed, pulled: pulled, rejected: rejected, error: e);
    }
    return SyncReport(pushed: pushed, pulled: pulled, rejected: rejected);
  }

  // ------------------------------------------------------------------ push

  Future<({int pushed, int rejected})> _push() async {
    var pushed = 0;
    var rejected = 0;
    final byName = {for (final s in _specs) s.name: s};

    while (true) {
      final entries =
          await (_db.select(_db.syncOutbox)
                ..orderBy([(t) => OrderingTerm.asc(t.seq)])
                ..limit(500))
              .get();
      if (entries.isEmpty) break;

      // Coalesce edits to the same record: latest snapshot, earliest position.
      final ops = <String, _Op>{};
      for (final e in entries) {
        final key = '${e.entity}|${e.recordId}';
        final payload = Map<String, Object?>.from(jsonDecode(e.payload) as Map);
        final op = ops[key];
        if (op == null) {
          ops[key] = _Op(e.entity, e.recordId, payload, [e.seq]);
        } else {
          op
            ..payload = payload
            ..seqs.add(e.seq);
        }
      }

      // Consecutive operations on the same table go out as one batch.
      final groups = <List<_Op>>[];
      for (final op in ops.values) {
        if (groups.isNotEmpty && groups.last.first.entity == op.entity && groups.last.length < _pushBatch) {
          groups.last.add(op);
        } else {
          groups.add([op]);
        }
      }

      for (final group in groups) {
        final spec = byName[group.first.entity];
        if (spec == null) {
          // Unknown table (e.g. from a future app version): park it, don't block the queue.
          for (final op in group) {
            await _reject(null, op, const SyncRemoteException(transient: false, code: 'unknown_table'));
            rejected++;
          }
          continue;
        }
        final r = await _pushGroup(spec, group);
        pushed += r.pushed;
        rejected += r.rejected;
      }
    }
    return (pushed: pushed, rejected: rejected);
  }

  Future<({int pushed, int rejected})> _pushGroup(SyncTableSpec spec, List<_Op> ops) async {
    try {
      await _remote.upsert(spec.name, [for (final op in ops) op.payload]);
      await _clear(ops);
      return (pushed: ops.length, rejected: 0);
    } on SyncRemoteException catch (e) {
      if (e.transient) rethrow;
      if (ops.length > 1) {
        // Find the offending record: retry one by one.
        var pushed = 0;
        var rejected = 0;
        for (final op in ops) {
          final r = await _pushGroup(spec, [op]);
          pushed += r.pushed;
          rejected += r.rejected;
        }
        return (pushed: pushed, rejected: rejected);
      }
      final op = ops.single;
      if (e.isUniqueViolation && spec.isEdge) {
        // The same edge already exists in the cloud (made on another device):
        // drop our duplicate; the pull brings the server's copy.
        await _db.customUpdate(
          'UPDATE "${spec.name}" SET deleted_at = ? WHERE id = ?',
          variables: [Variable.withDateTime(_clock()), Variable.withString(op.recordId)],
          updates: {spec.table},
        );
        await _clear(ops);
        return (pushed: 0, rejected: 0);
      }
      await _reject(spec, op, e);
      return (pushed: 0, rejected: 1);
    }
  }

  Future<void> _clear(List<_Op> ops) {
    final seqs = [for (final op in ops) ...op.seqs];
    return (_db.delete(_db.syncOutbox)..where((t) => t.seq.isIn(seqs))).go();
  }

  Future<void> _reject(SyncTableSpec? spec, _Op op, SyncRemoteException e) => _db.transaction(() async {
    await _db
        .into(_db.syncIssues)
        .insert(
          SyncIssuesCompanion.insert(
            entity: op.entity,
            recordId: op.recordId,
            payload: jsonEncode(op.payload),
            errorCode: Value(e.code),
            message: Value(e.message),
            createdAt: _clock(),
          ),
        );
    await _clear([op]);
  });

  Future<void> _noteError(SyncRemoteException e) async {
    final first =
        await (_db.select(_db.syncOutbox)
              ..orderBy([(t) => OrderingTerm.asc(t.seq)])
              ..limit(1))
            .getSingleOrNull();
    if (first == null) return;
    await (_db.update(_db.syncOutbox)..where((t) => t.seq.equals(first.seq))).write(
      SyncOutboxCompanion(attempts: Value(first.attempts + 1), lastError: Value(e.message ?? e.code)),
    );
  }

  // ------------------------------------------------------------------ pull

  Future<int> _pull() async {
    var total = 0;
    for (final spec in _specs) {
      while (true) {
        final cursor = await (_db.select(_db.syncCursors)..where((c) => c.entity.equals(spec.name))).getSingleOrNull();
        final after = cursor?.lastServerSeq ?? 0;
        final rows = await _remote.fetchChanges(spec.name, after, _pageSize);
        if (rows.isEmpty) break;
        total += await _applyPage(spec, rows);
        if (rows.length < _pageSize) break;
      }
    }
    return total;
  }

  Future<int> _applyPage(SyncTableSpec spec, List<Map<String, Object?>> rows) => _db.transaction(() async {
    // Records with a pending local change win: the push (and the server's
    // last-write-wins) decides, so a pull must not overwrite them.
    final pendingRows = await (_db.select(_db.syncOutbox)..where((t) => t.entity.equals(spec.name))).get();
    final pending = {for (final p in pendingRows) p.recordId};

    var applied = 0;
    var maxSeq = 0;
    final touchedPeople = <String>{};

    for (final row in rows) {
      final seq = (row['server_seq'] as num?)?.toInt() ?? 0;
      if (seq > maxSeq) maxSeq = seq;

      final id = row['id'] as String;
      if (pending.contains(id)) continue;

      final remoteUpdated = DateTime.parse(row['updated_at'] as String);
      final localUpdated = await _localUpdatedAt(spec, id);
      if (localUpdated != null && remoteUpdated.isBefore(localUpdated)) continue;

      await _upsertLocal(spec, row);
      applied++;
      switch (spec.name) {
        case 'people':
          touchedPeople.add(id);
        case 'person_contacts' || 'person_names':
          final personId = row['person_id'];
          if (personId is String) touchedPeople.add(personId);
      }
    }

    for (final personId in touchedPeople) {
      await _rebuildSearchText(personId);
    }

    await _db
        .into(_db.syncCursors)
        .insertOnConflictUpdate(
          SyncCursorsCompanion(
            entity: Value(spec.name),
            lastServerSeq: Value(maxSeq),
            lastPulledAt: Value(_clock()),
          ),
        );
    return applied;
  });

  Future<DateTime?> _localUpdatedAt(SyncTableSpec spec, String id) async {
    final row = await _db
        .customSelect(
          'SELECT updated_at FROM "${spec.name}" WHERE id = ?',
          variables: [Variable.withString(id)],
          readsFrom: {spec.table},
        )
        .getSingleOrNull();
    return row?.read<DateTime>('updated_at');
  }

  /// Inserts or updates one row, touching only the columns the cloud sent so
  /// device-only columns (e.g. `people.search_text`) survive.
  Future<void> _upsertLocal(SyncTableSpec spec, Map<String, Object?> row) async {
    final columns = spec.table.$columns.where((c) => row.containsKey(c.$name)).toList();
    final names = columns.map((c) => '"${c.$name}"').join(', ');
    final marks = List.filled(columns.length, '?').join(', ');
    final updates = columns.where((c) => c.$name != 'id').map((c) => '"${c.$name}" = excluded."${c.$name}"').join(', ');
    await _db.customInsert(
      'INSERT INTO "${spec.name}" ($names) VALUES ($marks) ON CONFLICT(id) DO UPDATE SET $updates',
      variables: [for (final c in columns) _variable(c, row[c.$name])],
      updates: {spec.table},
    );
  }

  static Variable<Object> _variable(GeneratedColumn<Object> column, Object? value) {
    if (value == null) return const Variable<Object>(null);
    final type = column.type;
    if (type == DriftSqlType.bool) return Variable.withBool(value as bool);
    if (type == DriftSqlType.int) return Variable.withInt((value as num).toInt());
    if (type == DriftSqlType.double) return Variable.withReal((value as num).toDouble());
    if (type == DriftSqlType.dateTime) return Variable.withDateTime(DateTime.parse(value as String));
    return Variable.withString(value.toString());
  }

  Future<void> _rebuildSearchText(String personId) async {
    final person = await (_db.select(_db.people)..where((p) => p.id.equals(personId))).getSingleOrNull();
    if (person == null) return;
    final contacts = await (_db.select(
      _db.personContacts,
    )..where((c) => c.personId.equals(personId) & c.deletedAt.isNull())).get();
    final names = await (_db.select(
      _db.personNames,
    )..where((n) => n.personId.equals(personId) & n.deletedAt.isNull())).get();
    final text = SearchText.build(
      fullName: person.fullName,
      fullNameAlt: person.fullNameAlt,
      nickname: person.nickname,
      occupation: person.occupation,
      phones: [
        for (final c in contacts)
          if (c.kind == 'phone') c.value,
      ],
      extra: [for (final n in names) n.name],
    );
    await (_db.update(_db.people)..where((p) => p.id.equals(personId))).write(PeopleCompanion(searchText: Value(text)));
  }
}

class _Op {
  _Op(this.entity, this.recordId, this.payload, this.seqs);

  final String entity;
  final String recordId;
  Map<String, Object?> payload;
  final List<int> seqs;
}
