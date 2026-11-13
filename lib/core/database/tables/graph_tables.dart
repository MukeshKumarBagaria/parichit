import 'package:drift/drift.dart';

import 'sync_columns.dart';

/// Family edge: parent → child. Inverse relations are never stored.
@DataClassName('ParentChildRow')
@TableIndex(name: 'parent_child_parent_idx', columns: {#parentId})
@TableIndex(name: 'parent_child_child_idx', columns: {#childId})
class ParentChild extends Table with SyncColumns {
  TextColumn get parentId => text()();
  TextColumn get childId => text()();

  /// biological | adoptive | step | foster | guardian
  TextColumn get kind => text().withDefault(const Constant('biological'))();

  /// confirmed | probable | unverified
  TextColumn get certainty => text().withDefault(const Constant('confirmed'))();
  TextColumn get notes => text().nullable()();

  @override
  String get tableName => 'parent_child';

  @override
  Set<Column> get primaryKey => {id};
}

/// Family edge: partner ↔ partner. `personAId` is always the smaller UUID.
@DataClassName('PartnershipRow')
@TableIndex(name: 'partnerships_a_idx', columns: {#personAId})
@TableIndex(name: 'partnerships_b_idx', columns: {#personBId})
class Partnerships extends Table with SyncColumns {
  TextColumn get personAId => text()();
  TextColumn get personBId => text()();
  TextColumn get kind => text().withDefault(const Constant('marriage'))();
  TextColumn get status => text().withDefault(const Constant('active'))();
  IntColumn get startYear => integer().nullable()();
  IntColumn get startMonth => integer().nullable()();
  IntColumn get startDay => integer().nullable()();
  BoolColumn get startDateApprox => boolean().withDefault(const Constant(false))();
  IntColumn get endYear => integer().nullable()();
  TextColumn get placeId => text().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

/// Social edge (friend, colleague, introduced-by …).
@DataClassName('SocialConnectionRow')
@TableIndex(name: 'social_person_idx', columns: {#personId})
@TableIndex(name: 'social_other_idx', columns: {#otherPersonId})
class SocialConnections extends Table with SyncColumns {
  TextColumn get personId => text()();
  TextColumn get otherPersonId => text()();
  TextColumn get connectionType => text()();
  TextColumn get description => text().nullable()();
  IntColumn get sinceYear => integer().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('FamilyGroupRow')
class FamilyGroups extends Table with SyncColumns {
  TextColumn get name => text()();
  TextColumn get nameAlt => text().nullable()();
  TextColumn get gotra => text().nullable()();
  TextColumn get kuldevta => text().nullable()();
  TextColumn get nativePlaceId => text().nullable()();
  TextColumn get headPersonId => text().nullable()();
  TextColumn get notes => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('FamilyGroupMemberRow')
@TableIndex(name: 'family_members_group_idx', columns: {#familyGroupId})
@TableIndex(name: 'family_members_person_idx', columns: {#personId})
class FamilyGroupMembers extends Table with SyncColumns {
  TextColumn get familyGroupId => text()();
  TextColumn get personId => text()();
  TextColumn get role => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PersonMergeRow')
class PersonMerges extends Table with SyncColumns {
  TextColumn get survivorId => text()();
  TextColumn get mergedId => text()();

  /// JSON snapshot of the merged person and moved edge ids (for undo).
  TextColumn get snapshot => text()();

  @override
  Set<Column> get primaryKey => {id};
}
