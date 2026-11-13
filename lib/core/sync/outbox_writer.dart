import 'dart:convert';

import 'package:drift/drift.dart';

import '../database/app_database.dart';
import '../database/tables/sync_columns.dart';

/// Records a pending change in the sync outbox.
///
/// Must be called inside the same `db.transaction` as the write it describes,
/// so a record can never be saved without being queued for sync (and vice
/// versa). The payload is a full snapshot of the row keyed by cloud column
/// names; the sync engine (milestone 6) coalesces and pushes these in FIFO
/// order.
class OutboxWriter {
  OutboxWriter(this._db, {DateTime Function()? clock}) : _clock = clock ?? (() => DateTime.now().toUtc());

  final AppDatabase _db;
  final DateTime Function() _clock;

  Future<void> enqueue<D>(
    TableInfo<Table, D> table,
    String recordId,
    Insertable<D> row,
  ) async {
    final payload = toCloudJson(row);
    await _db
        .into(_db.syncOutbox)
        .insert(
          SyncOutboxCompanion.insert(
            entity: table.actualTableName,
            recordId: recordId,
            payload: jsonEncode(payload),
            createdAt: _clock(),
          ),
        );
  }

  /// Converts a Drift row into the JSON shape Supabase expects: snake_case
  /// column names, ISO-8601 UTC timestamps, local-only columns removed.
  static Map<String, Object?> toCloudJson(Insertable<Object?> row) {
    final columns = row.toColumns(false);
    return {
      for (final entry in columns.entries)
        if (!localOnlyColumns.contains(entry.key)) entry.key: _encode((entry.value as Variable<Object>).value),
    };
  }

  static Object? _encode(Object? value) => switch (value) {
    final DateTime d => d.toUtc().toIso8601String(),
    _ => value,
  };
}
