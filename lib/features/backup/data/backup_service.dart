import 'dart:convert';
import 'dart:io';

import 'package:drift/drift.dart';
import 'package:path_provider/path_provider.dart';

import '../../../core/database/app_database.dart';
import '../../../core/sync/row_applier.dart';
import '../../../core/sync/sync_engine.dart';
import 'backup_codec.dart';
import 'exporters.dart';

/// Creates export/backup files and restores backups.
class BackupService {
  BackupService(this._db, {this.onPeopleChanged});

  final AppDatabase _db;
  final Future<void> Function(Set<String> personIds)? onPeopleChanged;

  // ------------------------------------------------------------- backup

  /// All synced tables (including soft-deleted rows, so restores are exact).
  Future<Map<String, List<Map<String, Object?>>>> snapshot() async {
    final out = <String, List<Map<String, Object?>>>{};
    for (final name in SyncEngine.tables) {
      final info = _db.allTables.firstWhere((t) => t.actualTableName == name);
      final rows = await _db.select(info).get();
      out[name] = [
        for (final r in rows)
          {
            for (final e in (r as Insertable<Object?>).toColumns(false).entries)
              if (e.key != 'search_text') e.key: _json((e.value as Variable<Object>).value),
          },
      ];
    }
    return out;
  }

  Future<File> createEncryptedBackup(String passphrase) async {
    final bytes = await BackupCodec.encode(await snapshot(), passphrase);
    return _write('parichit-${_stamp()}.parichit', bytes);
  }

  /// Restores a backup, keeping whichever version of each row is newer.
  /// Returns the number of rows applied.
  Future<int> restore(Uint8List bytes, String passphrase) async {
    final tables = await BackupCodec.decode(bytes, passphrase);
    final applier = RowApplier(_db);
    var applied = 0;
    final people = <String>{};
    await _db.transaction(() async {
      for (final name in SyncEngine.tables) {
        final rows = tables[name];
        if (rows == null) continue;
        final info = _db.allTables.firstWhere((t) => t.actualTableName == name);
        for (final row in rows) {
          if (await applier.apply(info, row)) {
            applied++;
            if (name == 'people') people.add(row['id']! as String);
          }
        }
      }
    });
    if (people.isNotEmpty) await onPeopleChanged?.call(people);
    return applied;
  }

  // ------------------------------------------------------------- exports

  Future<File> exportCsv({required Map<String, String> relationToMe}) async {
    final people =
        await (_db.select(_db.people)
              ..where(
                (p) => p.deletedAt.isNull() & p.mergedIntoId.isNull() & p.isPlaceholder.equals(false),
              )
              ..orderBy([(p) => OrderingTerm.asc(p.fullName)]))
            .get();
    final contacts = await (_db.select(
      _db.personContacts,
    )..where((c) => c.deletedAt.isNull() & c.kind.equals('phone'))).get();
    final places = await (_db.select(_db.places)..where((p) => p.deletedAt.isNull())).get();
    final tags = await (_db.select(_db.tags)..where((t) => t.deletedAt.isNull())).get();
    final personTags = await (_db.select(_db.personTags)..where((t) => t.deletedAt.isNull())).get();
    final tagName = {for (final t in tags) t.id: t.name};
    final phones = <String, List<String>>{};
    for (final c in contacts) {
      (phones[c.personId] ??= []).add(c.value);
    }
    final tagMap = <String, List<String>>{};
    for (final pt in personTags) {
      if (tagName[pt.tagId] case final n?) (tagMap[pt.personId] ??= []).add(n);
    }
    final csv = CsvExporter.people(
      people: people,
      phones: phones,
      places: {for (final p in places) p.id: p.name},
      relationToMe: relationToMe,
      tags: tagMap,
    );
    return _write('parichit-people-${_stamp()}.csv', utf8.encode(csv));
  }

  Future<File> exportGedcom() async {
    final people =
        await (_db.select(_db.people)..where(
              (p) => p.deletedAt.isNull() & p.mergedIntoId.isNull() & p.isPlaceholder.equals(false),
            ))
            .get();
    final edges = await (_db.select(_db.parentChild)..where((e) => e.deletedAt.isNull())).get();
    final partners = await (_db.select(_db.partnerships)..where((e) => e.deletedAt.isNull())).get();
    final ged = GedcomExporter.export(people: people, parentEdges: edges, partnerships: partners);
    return _write('parichit-family-${_stamp()}.ged', utf8.encode(ged));
  }

  // ------------------------------------------------------------- helpers

  Future<File> _write(String name, List<int> bytes) async {
    final dir = await getTemporaryDirectory();
    final file = File('${dir.path}${Platform.pathSeparator}$name');
    await file.writeAsBytes(bytes, flush: true);
    return file;
  }

  static String _stamp() {
    final n = DateTime.now();
    String two(int v) => v.toString().padLeft(2, '0');
    return '${n.year}${two(n.month)}${two(n.day)}-${two(n.hour)}${two(n.minute)}';
  }

  static Object? _json(Object? v) => v is DateTime ? v.toUtc().toIso8601String() : v;
}
