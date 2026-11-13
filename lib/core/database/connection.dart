import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';

/// Opens the encrypted on-device database (SQLite3MultipleCiphers, selected
/// via `hooks.user_defines` in pubspec.yaml).
///
/// [encryptionKey] must be hex only (see `DatabaseKeyStore`), so it can be
/// embedded in the PRAGMA without escaping.
QueryExecutor openAppDatabase({required String encryptionKey}) {
  if (!RegExp(r'^[0-9a-f]{64}$').hasMatch(encryptionKey)) {
    throw ArgumentError('encryptionKey must be 64 lowercase hex characters');
  }
  return driftDatabase(
    name: 'parichit',
    native: DriftNativeOptions(
      shareAcrossIsolates: true,
      setup: (db) {
        db.execute("PRAGMA key = '$encryptionKey';");
        // Fails immediately (instead of on first query) if the key is wrong
        // or the library was built without encryption support.
        db.execute('SELECT count(*) FROM sqlite_master;');
      },
    ),
  );
}
