import 'dart:math';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';

/// Provides the encryption key for the local database.
///
/// On first launch a random 256-bit key is generated and stored in the
/// platform keystore (Android Keystore / iOS Keychain). The key never leaves
/// the device and is not part of backups — the cloud copy is protected by
/// Supabase auth + RLS, and exported backups use their own passphrase.
class DatabaseKeyStore {
  DatabaseKeyStore({FlutterSecureStorage? storage}) : _storage = storage ?? const FlutterSecureStorage();

  final FlutterSecureStorage _storage;

  static const _storageKey = 'parichit.db_key.v1';

  /// Returns the existing key, creating and persisting one if needed.
  Future<String> obtainKey() async {
    final existing = await _storage.read(key: _storageKey);
    if (existing != null && existing.isNotEmpty) return existing;

    final key = generateKey();
    await _storage.write(key: _storageKey, value: key);
    return key;
  }

  /// 32 random bytes from a cryptographically secure source, hex-encoded.
  static String generateKey() {
    final random = Random.secure();
    return List.generate(32, (_) => random.nextInt(256).toRadixString(16).padLeft(2, '0')).join();
  }
}
