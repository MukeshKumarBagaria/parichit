import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../database/app_database.dart';
import '../sync/outbox_writer.dart';
import '../utils/id_generator.dart';

/// Core dependencies, wired once and overridable in tests.
///
/// [appDatabaseProvider] has no default: `bootstrap()` opens the database
/// and injects it with `overrideWithValue`, and tests inject an in-memory one.
final appDatabaseProvider = Provider<AppDatabase>(
  (ref) => throw UnimplementedError('appDatabaseProvider must be overridden in bootstrap()'),
);

/// Current time in UTC. Override in tests for deterministic timestamps.
final clockProvider = Provider<DateTime Function()>(
  (ref) =>
      () => DateTime.now().toUtc(),
);

final idGeneratorProvider = Provider<IdGenerator>((ref) => const UuidV7Generator());

final outboxWriterProvider = Provider<OutboxWriter>(
  (ref) => OutboxWriter(ref.watch(appDatabaseProvider), clock: ref.watch(clockProvider)),
);
