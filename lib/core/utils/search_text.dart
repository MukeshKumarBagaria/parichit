import 'phone_normalizer.dart';

/// Builds the local `people.search_text` value: everything a user might type
/// to find a person, lower-cased and space-separated.
///
/// Milestone 2 extends this with Devanagari → Latin transliteration and a
/// phonetic key (blueprint §8).
abstract final class SearchText {
  static String build({
    required String fullName,
    String? fullNameAlt,
    String? nickname,
    String? occupation,
    Iterable<String> phones = const [],
    Iterable<String> extra = const [],
  }) {
    final parts = <String>[
      fullName,
      ?fullNameAlt,
      ?nickname,
      ?occupation,
      for (final p in phones) PhoneNormalizer.digitsOnly(p),
      ...extra,
    ];
    return parts.map(normalize).where((p) => p.isNotEmpty).join(' ');
  }

  /// Lower-cases and collapses whitespace. Devanagari has no case, so it is
  /// kept as typed.
  static String normalize(String input) => input.toLowerCase().replaceAll(RegExp(r'\s+'), ' ').trim();
}
