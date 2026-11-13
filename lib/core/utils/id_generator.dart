import 'package:uuid/uuid.dart';

/// Generates record ids. Abstracted so tests can produce predictable ids.
abstract interface class IdGenerator {
  String newId();
}

/// UUID v7: globally unique (safe to create offline on any device) and
/// time-ordered, which keeps database indexes compact.
final class UuidV7Generator implements IdGenerator {
  const UuidV7Generator();

  static const _uuid = Uuid();

  @override
  String newId() => _uuid.v7();
}
