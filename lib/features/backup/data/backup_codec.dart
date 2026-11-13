import 'dart:convert';
import 'dart:math';
import 'dart:typed_data';

import 'package:cryptography/cryptography.dart';

/// Wrong passphrase or a corrupted/foreign file.
class BackupFormatException implements Exception {
  const BackupFormatException(this.message);

  final String message;

  @override
  String toString() => 'BackupFormatException($message)';
}

/// Encrypted backup file format (blueprint §13):
///
///   "PRCH1" | salt (16) | nonce (12) | AES-256-GCM ciphertext | MAC (16)
///
/// The key is derived from the user's passphrase with PBKDF2-HMAC-SHA256.
/// The plaintext is UTF-8 JSON: `{format, version, exportedAt, tables}`.
abstract final class BackupCodec {
  static const _magic = 'PRCH1';
  static const _iterations = 120000;
  static final _aes = AesGcm.with256bits();

  static Future<Uint8List> encode(Map<String, List<Map<String, Object?>>> tables, String passphrase) async {
    final plain = utf8.encode(
      jsonEncode({
        'format': 'parichit-backup',
        'version': 1,
        'exportedAt': DateTime.now().toUtc().toIso8601String(),
        'tables': tables,
      }),
    );
    final random = Random.secure();
    final salt = List<int>.generate(16, (_) => random.nextInt(256));
    final key = await _deriveKey(passphrase, salt);
    final box = await _aes.encrypt(plain, secretKey: key);
    return Uint8List.fromList([...ascii.encode(_magic), ...salt, ...box.nonce, ...box.cipherText, ...box.mac.bytes]);
  }

  static Future<Map<String, List<Map<String, dynamic>>>> decode(Uint8List bytes, String passphrase) async {
    const headerLen = 5 + 16 + 12;
    if (bytes.length < headerLen + 16 || ascii.decode(bytes.sublist(0, 5), allowInvalid: true) != _magic) {
      throw const BackupFormatException('Not a Parichit backup file');
    }
    final salt = bytes.sublist(5, 21);
    final nonce = bytes.sublist(21, 33);
    final cipherText = bytes.sublist(33, bytes.length - 16);
    final mac = Mac(bytes.sublist(bytes.length - 16));
    final key = await _deriveKey(passphrase, salt);
    final List<int> plain;
    try {
      plain = await _aes.decrypt(
        SecretBox(cipherText, nonce: nonce, mac: mac),
        secretKey: key,
      );
    } on SecretBoxAuthenticationError {
      throw const BackupFormatException('Wrong passphrase or damaged file');
    }
    final json = jsonDecode(utf8.decode(plain)) as Map<String, dynamic>;
    if (json['format'] != 'parichit-backup') throw const BackupFormatException('Unknown backup format');
    final tables = json['tables'] as Map<String, dynamic>;
    return {
      for (final e in tables.entries) e.key: (e.value as List<dynamic>).cast<Map<String, dynamic>>(),
    };
  }

  static Future<SecretKey> _deriveKey(String passphrase, List<int> salt) => Pbkdf2(
    macAlgorithm: Hmac.sha256(),
    iterations: _iterations,
    bits: 256,
  ).deriveKeyFromPassword(password: passphrase, nonce: salt);
}
