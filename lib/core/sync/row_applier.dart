import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../logging/app_logger.dart';

/// Applies rows coming from outside the device (cloud pull or backup
/// restore) with last-write-wins, never overwriting a pending local change.
class RowApplier {
  RowApplier(this._db);

  final AppDatabase _db;

  /// Applies one remote row. Returns true when the local copy changed.
  Future<bool> apply(TableInfo<Table, Object?> info, Map<String, dynamic> remote) async {
    final id = remote['id'] as String?;
    if (id == null) return false;

    final pending =
        await (_db.select(_db.syncOutbox)
              ..where((o) => o.entity.equals(info.actualTableName) & o.recordId.equals(id))
              ..limit(1))
            .getSingleOrNull();
    if (pending != null) return false;

    final idCol = info.columnsByName['id']! as GeneratedColumn<String>;
    final local = await (_db.select(info)..where((_) => idCol.equals(id))).getSingleOrNull();
    final localCols = local == null ? null : (local as Insertable<Object?>).toColumns(false);
    final remoteUpdated = DateTime.tryParse(remote['updated_at'] as String? ?? '');
    if (localCols != null && remoteUpdated != null) {
      final localUpdated = (localCols['updated_at'] as Variable<DateTime>?)?.value;
      if (localUpdated != null && remoteUpdated.isBefore(localUpdated)) return false;
    }

    final data = <String, Object?>{};
    for (final column in info.$columns) {
      final name = column.name;
      Object? value = remote.containsKey(name) ? remote[name] : (localCols?[name] as Variable<Object>?)?.value;
      if (!remote.containsKey(name) && localCols == null && !column.$nullable) {
        // Local-only, non-nullable column without a local row (e.g. search_text).
        value = column.type == DriftSqlType.string ? '' : 0;
      }
      data[name] = toSql(column.type, value);
    }
    try {
      final row = info.map(data);
      await _db.into(info).insertOnConflictUpdate(row as Insertable<Object?>);
      return true;
    } on Object catch (e, st) {
      AppLogger.error('Could not apply pulled ${info.actualTableName} row $id', error: e, stackTrace: st);
      return false;
    }
  }

  /// Converts JSON values into the raw form Drift reads from SQLite.
  static Object? toSql(Object type, Object? value) {
    if (value == null) return null;
    return switch (type) {
      DriftSqlType.bool => value is bool ? (value ? 1 : 0) : value,
      DriftSqlType.dateTime => switch (value) {
        final DateTime d => d.toUtc().toIso8601String(),
        final String s => DateTime.tryParse(s)?.toUtc().toIso8601String() ?? s,
        _ => value,
      },
      DriftSqlType.double => value is num ? value.toDouble() : value,
      DriftSqlType.int || DriftSqlType.bigInt => value is num ? value.toInt() : value,
      _ => value,
    };
  }
}
