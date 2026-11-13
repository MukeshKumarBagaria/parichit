import 'package:drift/drift.dart';

// Tables that exist only on the device and are never synced.

/// Pending changes waiting to be pushed, replayed in strict FIFO order.
@DataClassName('OutboxEntry')
class SyncOutbox extends Table {
  IntColumn get seq => integer().autoIncrement()();

  /// Cloud table name, e.g. `people`.
  TextColumn get entity => text()();
  TextColumn get recordId => text()();

  /// JSON snapshot of the full row, keyed by cloud column names.
  TextColumn get payload => text()();
  DateTimeColumn get createdAt => dateTime()();
  IntColumn get attempts => integer().withDefault(const Constant(0))();
  DateTimeColumn get nextAttemptAt => dateTime().nullable()();
  TextColumn get lastError => text().nullable()();

  @override
  String get tableName => 'sync_outbox';
}

/// Pull position per cloud table.
@DataClassName('SyncCursorRow')
class SyncCursors extends Table {
  TextColumn get entity => text()();
  IntColumn get lastServerSeq => integer().withDefault(const Constant(0))();
  DateTimeColumn get lastPulledAt => dateTime().nullable()();

  @override
  Set<Column> get primaryKey => {entity};
}

/// Changes the server rejected; shown in Settings → Sync issues.
@DataClassName('SyncIssueRow')
class SyncIssues extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get entity => text()();
  TextColumn get recordId => text()();
  TextColumn get payload => text()();
  TextColumn get errorCode => text().nullable()();
  TextColumn get message => text().nullable()();
  DateTimeColumn get createdAt => dateTime()();
  DateTimeColumn get resolvedAt => dateTime().nullable()();
}

/// Local copies of photos and their upload/download state.
@DataClassName('MediaFileRow')
class MediaFiles extends Table {
  TextColumn get mediaId => text()();
  TextColumn get localPath => text().nullable()();
  TextColumn get thumbPath => text().nullable()();

  /// pending | uploading | done | failed
  TextColumn get uploadState => text().withDefault(const Constant('pending'))();
  TextColumn get downloadState => text().withDefault(const Constant('none'))();

  @override
  Set<Column> get primaryKey => {mediaId};
}

/// Cached "relation to me" for every reachable person (blueprint §4.6).
@DataClassName('RelationCacheRow')
class RelationCache extends Table {
  TextColumn get personId => text()();
  TextColumn get pathKey => text()();
  TextColumn get termEn => text()();
  TextColumn get termHi => text()();
  TextColumn get side => text()();
  IntColumn get distance => integer()();
  IntColumn get generation => integer()();

  /// JSON array of person ids along the path.
  TextColumn get viaIds => text()();
  IntColumn get graphVersion => integer()();

  @override
  String get tableName => 'relation_cache';

  @override
  Set<Column> get primaryKey => {personId};
}

/// Small key/value store for device settings (language, theme, …).
@DataClassName('KvSettingRow')
class KvSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}
