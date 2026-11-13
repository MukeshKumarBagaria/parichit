import 'package:drift/drift.dart';

import 'sync_columns.dart';

@DataClassName('TagRow')
class Tags extends Table with SyncColumns {
  TextColumn get name => text()();
  TextColumn get nameAlt => text().nullable()();
  TextColumn get color => text().nullable()();
  TextColumn get icon => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('PersonTagRow')
@TableIndex(name: 'person_tags_person_idx', columns: {#personId})
@TableIndex(name: 'person_tags_tag_idx', columns: {#tagId})
class PersonTags extends Table with SyncColumns {
  TextColumn get personId => text()();
  TextColumn get tagId => text()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('InteractionRow')
@TableIndex(name: 'interactions_date_idx', columns: {#occurredAt})
class Interactions extends Table with SyncColumns {
  TextColumn get title => text().nullable()();

  /// in_person | visit | phone_call | video_call | message | event | other
  TextColumn get interactionType => text().withDefault(const Constant('in_person'))();
  DateTimeColumn get occurredAt => dateTime()();
  IntColumn get durationMinutes => integer().nullable()();
  TextColumn get placeId => text().nullable()();
  TextColumn get locationText => text().nullable()();
  RealColumn get latitude => real().nullable()();
  RealColumn get longitude => real().nullable()();
  TextColumn get notes => text().nullable()();

  /// Stored as an ISO date (yyyy-MM-dd) to match the `date` column in Postgres.
  TextColumn get followUpOn => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('InteractionParticipantRow')
@TableIndex(name: 'participants_interaction_idx', columns: {#interactionId})
@TableIndex(name: 'participants_person_idx', columns: {#personId})
class InteractionParticipants extends Table with SyncColumns {
  TextColumn get interactionId => text()();
  TextColumn get personId => text()();
  TextColumn get role => text().withDefault(const Constant('participant'))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ReminderRow')
@TableIndex(name: 'reminders_due_idx', columns: {#dueAt})
class Reminders extends Table with SyncColumns {
  TextColumn get personId => text().nullable()();
  TextColumn get interactionId => text().nullable()();
  TextColumn get reminderType => text().withDefault(const Constant('follow_up'))();
  TextColumn get title => text()();
  DateTimeColumn get dueAt => dateTime()();
  TextColumn get recurrence => text().withDefault(const Constant('none'))();
  TextColumn get notes => text().nullable()();
  DateTimeColumn get completedAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('MediaRow')
@TableIndex(name: 'media_person_idx', columns: {#personId})
class Media extends Table with SyncColumns {
  TextColumn get personId => text().nullable()();
  TextColumn get interactionId => text().nullable()();

  /// profile_photo | photo | document | voice_note
  TextColumn get kind => text()();
  TextColumn get fileName => text()();
  TextColumn get mimeType => text()();
  IntColumn get sizeBytes => integer().nullable()();
  IntColumn get width => integer().nullable()();
  IntColumn get height => integer().nullable()();
  IntColumn get durationMs => integer().nullable()();
  TextColumn get sha256 => text().nullable()();
  TextColumn get caption => text().nullable()();
  DateTimeColumn get takenAt => dateTime().nullable()();

  @override
  String get tableName => 'media';

  @override
  Set<Column> get primaryKey => {id};
}
