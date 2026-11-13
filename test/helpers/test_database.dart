import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:parichit/core/database/app_database.dart';
import 'package:parichit/core/utils/id_generator.dart';

/// Fresh in-memory database per test (unencrypted; encryption is a
/// connection concern covered by the app, not by repository tests).
AppDatabase createTestDatabase() {
  driftRuntimeOptions.dontWarnAboutMultipleDatabases = true;
  return AppDatabase(NativeDatabase.memory());
}

/// Predictable ids: `id-1`, `id-2`, …
class SequentialIds implements IdGenerator {
  int _next = 0;

  @override
  String newId() => 'id-${++_next}';
}

/// A clock that advances one second per call, so timestamps are distinct.
DateTime Function() steppingClock([DateTime? start]) {
  var current = start ?? DateTime.utc(2026, 11, 13, 9);
  return () => current = current.add(const Duration(seconds: 1));
}
