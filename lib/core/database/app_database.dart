import 'package:drift/drift.dart';

import 'tables/graph_tables.dart';
import 'tables/local_tables.dart';
import 'tables/network_tables.dart';
import 'tables/people_tables.dart';

part 'app_database.g.dart';

/// The on-device database — the single source of truth for the UI.
///
/// Tables mirror the Supabase schema (`supabase/migrations`) plus local-only
/// tables for sync, caching and settings. Bump [schemaVersion] and add a step
/// to [migration] for every schema change; never edit a shipped step.
@DriftDatabase(
  tables: [
    // People & places
    Places,
    People,
    PersonNames,
    PersonContacts,
    PersonAddresses,
    PersonAttributes,
    // Family graph
    ParentChild,
    Partnerships,
    SocialConnections,
    FamilyGroups,
    FamilyGroupMembers,
    PersonMerges,
    // Network
    Tags,
    PersonTags,
    Interactions,
    InteractionParticipants,
    Reminders,
    Media,
    // Local only
    SyncOutbox,
    SyncCursors,
    SyncIssues,
    MediaFiles,
    RelationCache,
    KvSettings,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.executor);

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration => MigrationStrategy(
    onCreate: (m) => m.createAll(),
    // onUpgrade: stepByStep(from1To2: (m, schema) async { … }),
  );
}
