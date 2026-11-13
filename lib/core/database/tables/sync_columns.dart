import 'package:drift/drift.dart';

/// Columns shared by every table that syncs with Supabase.
///
/// `owner_id` and `server_updated_at` exist only in the cloud: the server
/// fills them in from the session, so they are deliberately absent here.
///
/// Every table using this mixin must also declare
/// `@override Set<Column> get primaryKey => {id};`.
mixin SyncColumns on Table {
  /// UUID v7, generated on the device so records can be created offline.
  TextColumn get id => text()();
  DateTimeColumn get createdAt => dateTime()();

  /// Edit time on the device; the server uses it for last-write-wins.
  DateTimeColumn get updatedAt => dateTime()();

  /// Soft delete / tombstone. Rows are never hard-deleted by the app.
  DateTimeColumn get deletedAt => dateTime().nullable()();

  /// Server-assigned cursor; 0 until the row has been pulled from the cloud.
  IntColumn get serverSeq => integer().withDefault(const Constant(0))();
}

/// Column names that exist only on the device and must never be pushed.
const localOnlyColumns = {'server_seq', 'search_text'};
