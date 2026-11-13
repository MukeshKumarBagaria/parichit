import 'gender.dart';
import 'kin_path.dart';
import 'kin_step.dart';
import 'kin_terms.dart';
import 'relation_side.dart';

/// A relation, named in both languages.
final class RelationName {
  const RelationName({
    required this.en,
    required this.hi,
    required this.side,
    required this.generation,
    required this.isNamed,
    this.roman,
  });

  /// English description ("Father's younger brother").
  final String en;

  /// Hindi in Devanagari ("चाचा").
  final String hi;

  /// Hindi term in Latin script ("Chacha"), when one exists.
  final String? roman;
  final RelationSide side;
  final int generation;

  /// True when the whole path matched a dictionary term (vs. described).
  final bool isNamed;

  /// Short label for chips: the Hindi term in Hindi UI; in English UI the
  /// familiar romanised term when there is one, else the English description.
  String label({required bool hindi}) => hindi ? hi : (roman ?? en);

  @override
  String toString() => 'RelationName($en | $hi)';
}

/// Turns a [KinPath] into a [RelationName] (blueprint §4.5).
abstract final class RelationNamer {
  static RelationName name(KinPath path) {
    final side = path.side;
    final generation = path.generation;
    RelationName named(KinTerm t, {bool isNamed = true}) =>
        RelationName(en: t.en, hi: t.hi, roman: t.roman, side: side, generation: generation, isNamed: isNamed);

    if (path.isEmpty) {
      return RelationName(en: 'You', hi: 'आप', side: side, generation: 0, isNamed: true);
    }

    // Single-step special cases: half-siblings and step edges.
    if (path.steps.length == 1) {
      final s = path.steps.single;
      if (s.kind == StepKind.sibling && s.half) {
        return named(s.toGender.pickTerm(_halfBrother, _halfSister, _halfSibling));
      }
      if (s.step && s.kind == StepKind.parent) {
        return named(kinTerms[s.toGender.pick('M.H', 'F.W', 'P')] ?? kinTerms['P']!);
      }
      if (s.step && s.kind == StepKind.child) {
        return named(kinTerms[s.toGender.pick('W.S', 'W.D', 'C')] ?? kinTerms['C']!);
      }
    }

    final exact = kinTerms[path.key] ?? kinTerms[path.plainKey];
    if (exact != null) return named(exact);

    final described = _describe(path.steps);
    return RelationName(
      en: described.en,
      hi: described.hi,
      side: side,
      generation: generation,
      isNamed: false,
    );
  }

  static const _halfBrother = KinTerm('Half-brother', 'सौतेला भाई', 'Sautela bhai');
  static const _halfSister = KinTerm('Half-sister', 'सौतेली बहन', 'Sauteli behen');
  static const _halfSibling = KinTerm('Half-sibling', 'सौतेले भाई-बहन');

  /// Describes a path with no dictionary term: the longest named prefix,
  /// followed by one possessive per remaining step.
  ///   M.B.S.W → "Mamera bhai's wife" / "ममेरे भाई की पत्नी"
  static ({String en, String hi}) _describe(List<KinStep> steps) {
    // Longest prefix (≥ 2 steps) that has a usable dictionary term.
    var prefixLen = 0;
    KinTerm? prefix;
    for (var n = steps.length - 1; n >= 2; n--) {
      final sub = KinPath(steps.sublist(0, n));
      final t = kinTerms[sub.key] ?? kinTerms[sub.plainKey];
      if (t != null && !t.hi.contains('/') && !t.en.contains('/')) {
        prefix = t;
        prefixLen = n;
        break;
      }
    }

    final en = <String>[];
    final hiNouns = <HindiNoun>[];
    if (prefix != null) {
      en.add(prefix.roman ?? prefix.en);
      final feminine = _isFeminine(steps[prefixLen - 1]);
      hiNouns.add(HindiNoun(prefix.hi, feminine: feminine, oblique: feminine ? prefix.hi : _obliqueOf(prefix.hi)));
    }
    for (final s in steps.skip(prefixLen)) {
      en.add(_nounEn(s));
      hiNouns.add(_nounHi(s));
    }

    // English possessive chain: "Mama's son's wife".
    final words = [en.first[0].toUpperCase() + en.first.substring(1), ...en.skip(1)];
    return (en: words.join("'s "), hi: _hindiPossessive(hiNouns));
  }

  /// "पिता की बहन के पति का भाई": the postposition agrees with the noun that
  /// follows it — की before a feminine noun, के before a masculine noun that
  /// is itself followed by a postposition, का before the final masculine noun.
  static String _hindiPossessive(List<HindiNoun> nouns) {
    final buf = StringBuffer();
    for (var i = 0; i < nouns.length; i++) {
      final isLast = i == nouns.length - 1;
      buf.write(isLast ? nouns[i].direct : nouns[i].oblique);
      if (!isLast) {
        final next = nouns[i + 1];
        final nextIsLast = i + 1 == nouns.length - 1;
        buf.write(next.feminine ? ' की ' : (nextIsLast ? ' का ' : ' के '));
      }
    }
    return buf.toString();
  }

  static bool _isFeminine(KinStep s) => s.toGender.pick('m', 'f', 'm') == 'f';

  static String _nounEn(KinStep s) {
    if (s.kind == StepKind.social) return (kinTerms[s.token]?.en ?? 'acquaintance').toLowerCase();
    final base = stepNounsEn[s.token] ?? stepNounsEn[s.plainToken] ?? 'relative';
    return s.half && s.kind == StepKind.sibling ? 'half-$base' : base;
  }

  static HindiNoun _nounHi(KinStep s) {
    if (s.kind == StepKind.social) return HindiNoun(kinTerms[s.token]?.hi ?? 'परिचित', feminine: false);
    return stepNounsHi[s.token] ?? stepNounsHi[s.plainToken] ?? const HindiNoun('रिश्तेदार', feminine: false);
  }

  /// Masculine oblique: बेटा → बेटे, चचेरा भाई → चचेरे भाई. Kinship nouns like
  /// मामा, चाचा, दादा keep their form.
  static String _obliqueOf(String hi) => hi
      .split(' ')
      .map((w) => w.endsWith('ा') && !_invariant.contains(w) ? '${w.substring(0, w.length - 1)}े' : w)
      .join(' ');

  static const _invariant = {
    'मामा',
    'चाचा',
    'दादा',
    'नाना',
    'परदादा',
    'परनाना',
    'पिता',
    'फूफा',
    'मौसा',
    'जीजा',
    'माता',
  };
}

extension on Gender {
  KinTerm pickTerm(KinTerm male, KinTerm female, KinTerm neutral) => switch (this) {
    Gender.male => male,
    Gender.female => female,
    Gender.other || Gender.unknown => neutral,
  };
}
