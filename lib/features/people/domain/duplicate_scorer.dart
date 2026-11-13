import '../../../core/utils/name_matching.dart';

/// Scores how likely two records describe the same person (blueprint §8).
/// A total of [threshold] or more is shown as a possible duplicate.
abstract final class DuplicateScorer {
  static const threshold = 50;

  static int score({
    required String nameA,
    required String nameB,
    String? nameAltA,
    String? nameAltB,
    bool samePhone = false,
    bool sameNativePlace = false,
    bool sameParentOrSpouse = false,
    int? birthYearA,
    int? birthYearB,
  }) {
    var score = 0;
    if (samePhone) score += 70;

    final keysA = {NameMatching.phoneticKey(nameA), if (nameAltA != null) NameMatching.phoneticKey(nameAltA)};
    final keysB = {NameMatching.phoneticKey(nameB), if (nameAltB != null) NameMatching.phoneticKey(nameAltB)};
    keysA.remove('');
    keysB.remove('');
    if (keysA.intersection(keysB).isNotEmpty) {
      score += 30;
    }
    var bestSimilarity = 0.0;
    for (final a in keysA) {
      for (final b in keysB) {
        final s = NameMatching.jaroWinkler(a, b);
        if (s > bestSimilarity) bestSimilarity = s;
      }
    }
    if (bestSimilarity >= 0.9) score += 20;
    if (sameNativePlace) score += 15;
    if (sameParentOrSpouse) score += 25;
    if (birthYearA != null && birthYearB != null && (birthYearA - birthYearB).abs() > 5) score -= 40;
    return score;
  }
}
