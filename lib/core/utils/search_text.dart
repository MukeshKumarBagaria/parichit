import 'name_matching.dart';
import 'phone_normalizer.dart';

/// Builds the local `people.search_text` value: everything a user might type
/// to find a person, lower-cased and space-separated — including a Latin
/// transliteration of Hindi names and spelling-insensitive phonetic keys, so
/// "ramesh", "रमेश" and "Rammesh" all find the same person (blueprint §8).
abstract final class SearchText {
  static String build({
    required String fullName,
    String? fullNameAlt,
    String? nickname,
    String? occupation,
    Iterable<String> phones = const [],
    Iterable<String> extra = const [],
  }) {
    final names = <String>[fullName, ?fullNameAlt, ?nickname, ...extra];
    final parts = <String>[
      ...names,
      for (final n in names)
        if (NameMatching.hasDevanagari(n)) NameMatching.transliterate(n),
      for (final n in names) NameMatching.phoneticKey(n),
      ?occupation,
      for (final p in phones) PhoneNormalizer.digitsOnly(p),
    ];
    return parts.map(normalize).where((p) => p.isNotEmpty).toSet().join(' ');
  }

  /// Lower-cases and collapses whitespace. Devanagari has no case, so it is
  /// kept as typed.
  static String normalize(String input) => input.toLowerCase().replaceAll(RegExp(r'\s+'), ' ').trim();

  /// Variants of a query to match against `search_text`.
  static List<String> queryVariants(String query) {
    final q = normalize(query);
    if (q.isEmpty) return const [];
    return {
      q,
      if (NameMatching.hasDevanagari(q)) NameMatching.transliterate(q),
      if (q.length >= 3) NameMatching.phoneticKey(q),
    }.where((v) => v.isNotEmpty).toList();
  }
}
