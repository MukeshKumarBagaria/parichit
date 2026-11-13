import 'package:drift/drift.dart';

import '../database/app_database.dart';

/// One synced table: its cloud name and the local Drift table.
class SyncTableSpec {
  const SyncTableSpec(this.table, {this.isEdge = false});

  final TableInfo<Table, Object?> table;

  /// Edge tables have partial unique indexes on the server; a unique violation
  /// there means the same edge already exists in the cloud.
  final bool isEdge;

  String get name => table.actualTableName;
}

/// Every synced table, parents before children (the order used for pulling).
List<SyncTableSpec> syncTables(AppDatabase db) => [
  SyncTableSpec(db.places),
  SyncTableSpec(db.people),
  SyncTableSpec(db.personNames),
  SyncTableSpec(db.personContacts),
  SyncTableSpec(db.personAddresses),
  SyncTableSpec(db.personAttributes),
  SyncTableSpec(db.tags),
  SyncTableSpec(db.familyGroups),
  SyncTableSpec(db.parentChild, isEdge: true),
  SyncTableSpec(db.partnerships, isEdge: true),
  SyncTableSpec(db.socialConnections, isEdge: true),
  SyncTableSpec(db.familyGroupMembers, isEdge: true),
  SyncTableSpec(db.personTags, isEdge: true),
  SyncTableSpec(db.interactions),
  SyncTableSpec(db.interactionParticipants, isEdge: true),
  SyncTableSpec(db.reminders),
  SyncTableSpec(db.media),
  SyncTableSpec(db.personMerges),
];
