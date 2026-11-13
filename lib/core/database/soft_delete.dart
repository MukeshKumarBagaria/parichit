import 'package:drift/drift.dart';

import '../sync/outbox_writer.dart';
import 'app_database.dart';

/// Soft-deletes (or restores) rows of any synced table and queues each
/// changed row in the sync outbox. Must run inside `db.transaction`.
class SoftDeleter {
  SoftDeleter(this._db, this._outbox);

  final AppDatabase _db;
  final OutboxWriter _outbox;

  /// Marks every live row matching [where] as deleted at [at].
  Future<int> delete<T extends Table, D>(
    TableInfo<T, D> table,
    Expression<bool> Function(T t) where, {
    required DateTime at,
  }) => _set(table, (t) => where(t) & _deletedAt(table).isNull(), deletedAt: at, at: at);

  /// Restores rows matching [where] that were deleted exactly at
  /// [deletedAt] — i.e. together with the parent record, not before.
  Future<int> restore<T extends Table, D>(
    TableInfo<T, D> table,
    Expression<bool> Function(T t) where, {
    required DateTime deletedAt,
    required DateTime at,
  }) => _set(table, (t) => where(t) & _deletedAt(table).equals(deletedAt), deletedAt: null, at: at);

  Future<int> _set<T extends Table, D>(
    TableInfo<T, D> table,
    Expression<bool> Function(T t) where, {
    required DateTime? deletedAt,
    required DateTime at,
  }) async {
    final idCol = table.columnsByName['id']! as GeneratedColumn<String>;
    final ids =
        await (_db.selectOnly(table)
              ..addColumns([idCol])
              ..where(where(table.asDslTable)))
            .map((r) => r.read(idCol)!)
            .get();
    if (ids.isEmpty) return 0;

    await (_db.update(table)..where((t) => idCol.isIn(ids))).write(
      RawValuesInsertable<D>({
        'deleted_at': Variable<DateTime>(deletedAt),
        'updated_at': Variable<DateTime>(at),
      }),
    );
    final rows = await (_db.select(table)..where((t) => idCol.isIn(ids))).get();
    for (final row in rows) {
      final insertable = row as Insertable<D>;
      final id = (insertable.toColumns(false)['id']! as Variable<String>).value!;
      await _outbox.enqueue(table, id, insertable);
    }
    return rows.length;
  }

  static GeneratedColumn<DateTime> _deletedAt(TableInfo<Table, Object?> table) =>
      table.columnsByName['deleted_at']! as GeneratedColumn<DateTime>;
}

/// Applies an operation to one table while keeping its exact row type (Drift
/// validates that inserted/updated values match the table's data class).
typedef _TableOp = Future<int> Function<T extends Table, D>(
  TableInfo<T, D> table,
  Expression<bool> Function(T t) where,
);

/// Everything that references a person, for cascading soft deletes.
extension PersonCascade on SoftDeleter {
  Future<void> deletePersonDependents(AppDatabase db, String personId, DateTime at) => _forEachDependent(
    db,
    personId,
    <T extends Table, D>(TableInfo<T, D> table, Expression<bool> Function(T t) where) =>
        delete<T, D>(table, where, at: at),
  );

  Future<void> restorePersonDependents(AppDatabase db, String personId, DateTime deletedAt, DateTime at) =>
      _forEachDependent(
        db,
        personId,
        <T extends Table, D>(TableInfo<T, D> table, Expression<bool> Function(T t) where) =>
            restore<T, D>(table, where, deletedAt: deletedAt, at: at),
      );

  static Future<void> _forEachDependent(AppDatabase db, String id, _TableOp on) async {
    await on(db.personContacts, (t) => t.personId.equals(id));
    await on(db.personNames, (t) => t.personId.equals(id));
    await on(db.personAddresses, (t) => t.personId.equals(id));
    await on(db.personAttributes, (t) => t.personId.equals(id));
    await on(db.personTags, (t) => t.personId.equals(id));
    await on(db.parentChild, (t) => t.parentId.equals(id) | t.childId.equals(id));
    await on(db.partnerships, (t) => t.personAId.equals(id) | t.personBId.equals(id));
    await on(db.socialConnections, (t) => t.personId.equals(id) | t.otherPersonId.equals(id));
    await on(db.familyGroupMembers, (t) => t.personId.equals(id));
    await on(db.interactionParticipants, (t) => t.personId.equals(id));
    await on(db.media, (t) => t.personId.equals(id));
  }
}
