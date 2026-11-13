import 'dart:math' as math;

/// Offline helpers that let Hindi and English spellings of a name match.
abstract final class NameMatching {
  static final _devanagari = RegExp('[ऀ-ॿ]');

  static bool hasDevanagari(String s) => _devanagari.hasMatch(s);

  /// Rule-based Devanagari → Latin transliteration, tuned for names:
  /// रमेश → ramesh, सुनीता → suneetaa, क्षितिज → kshitij.
  static String transliterate(String input) {
    final out = StringBuffer();
    final chars = input.runes.map(String.fromCharCode).toList();
    for (var i = 0; i < chars.length; i++) {
      final c = chars[i];
      final consonant = _consonants[c];
      if (consonant != null) {
        out.write(consonant);
        var j = i + 1;
        if (j < chars.length && chars[j] == '़') j++; // nukta
        final next = j < chars.length ? chars[j] : null;
        if (next != null && _matras.containsKey(next)) {
          out.write(_matras[next]);
          i = j;
        } else if (next == '्') {
          i = j; // virama: no inherent vowel
        } else {
          // Inherent "a" — dropped at the end of a word (schwa deletion).
          final atWordEnd = next == null || !_devanagari.hasMatch(next);
          if (!atWordEnd) out.write('a');
          i = j - 1;
        }
        continue;
      }
      final vowel = _vowels[c] ?? _signs[c];
      if (vowel != null) {
        out.write(vowel);
      } else if (c != '़') {
        out.write(c);
      }
    }
    return out.toString();
  }

  /// Spelling-insensitive key: Shrivastava, Srivastav and श्रीवास्तव all
  /// become "srivastav".
  static String phoneticKey(String input) {
    var s = (hasDevanagari(input) ? transliterate(input) : input).toLowerCase();
    s = s.replaceAll(RegExp('[^a-z ]'), '');
    const rules = [
      ('chh', 'c'),
      ('ch', 'c'),
      ('sh', 's'),
      ('ph', 'f'),
      ('kh', 'k'),
      ('gh', 'g'),
      ('th', 't'),
      ('dh', 'd'),
      ('bh', 'b'),
      ('jh', 'j'),
      ('aa', 'a'),
      ('ee', 'i'),
      ('ii', 'i'),
      ('oo', 'u'),
      ('uu', 'u'),
      ('w', 'v'),
      ('z', 'j'),
      ('q', 'k'),
      ('ck', 'k'),
    ];
    for (final (from, to) in rules) {
      s = s.replaceAll(from, to);
    }
    s = s.replaceAllMapped(RegExp(r'([a-z])\1+'), (m) => m[1]!); // doubled letters
    return s
        .split(' ')
        .where((w) => w.isNotEmpty)
        .map((w) => w.length > 2 && (w.endsWith('a') || w.endsWith('h')) ? w.substring(0, w.length - 1) : w)
        .join(' ');
  }

  /// Jaro-Winkler similarity in [0, 1].
  static double jaroWinkler(String a, String b) {
    if (a == b) return 1;
    if (a.isEmpty || b.isEmpty) return 0;
    final window = math.max(0, math.max(a.length, b.length) ~/ 2 - 1);
    final aMatch = List.filled(a.length, false);
    final bMatch = List.filled(b.length, false);
    var matches = 0;
    for (var i = 0; i < a.length; i++) {
      final lo = math.max(0, i - window);
      final hi = math.min(b.length - 1, i + window);
      for (var j = lo; j <= hi; j++) {
        if (bMatch[j] || a[i] != b[j]) continue;
        aMatch[i] = bMatch[j] = true;
        matches++;
        break;
      }
    }
    if (matches == 0) return 0;
    var t = 0;
    var k = 0;
    for (var i = 0; i < a.length; i++) {
      if (!aMatch[i]) continue;
      while (!bMatch[k]) {
        k++;
      }
      if (a[i] != b[k]) t++;
      k++;
    }
    final m = matches.toDouble();
    final jaro = (m / a.length + m / b.length + (m - t / 2) / m) / 3;
    var prefix = 0;
    while (prefix < 4 && prefix < a.length && prefix < b.length && a[prefix] == b[prefix]) {
      prefix++;
    }
    return jaro + prefix * 0.1 * (1 - jaro);
  }

  static const _consonants = {
    'क': 'k', 'ख': 'kh', 'ग': 'g', 'घ': 'gh', 'ङ': 'n', //
    'च': 'ch', 'छ': 'chh', 'ज': 'j', 'झ': 'jh', 'ञ': 'n',
    'ट': 't', 'ठ': 'th', 'ड': 'd', 'ढ': 'dh', 'ण': 'n',
    'त': 't', 'थ': 'th', 'द': 'd', 'ध': 'dh', 'न': 'n',
    'प': 'p', 'फ': 'ph', 'ब': 'b', 'भ': 'bh', 'म': 'm',
    'य': 'y', 'र': 'r', 'ल': 'l', 'व': 'v', 'श': 'sh',
    'ष': 'sh', 'स': 's', 'ह': 'h', 'ळ': 'l',
    'क़': 'q', 'ख़': 'kh', 'ग़': 'g', 'ज़': 'z', 'ड़': 'r', 'ढ़': 'rh', 'फ़': 'f',
  };

  static const _vowels = {
    'अ': 'a', 'आ': 'aa', 'इ': 'i', 'ई': 'ee', 'उ': 'u', 'ऊ': 'oo', //
    'ऋ': 'ri', 'ए': 'e', 'ऐ': 'ai', 'ओ': 'o', 'औ': 'au',
  };

  static const _matras = {
    'ा': 'aa', 'ि': 'i', 'ी': 'ee', 'ु': 'u', 'ू': 'oo', 'ृ': 'ri', //
    'े': 'e', 'ै': 'ai', 'ो': 'o', 'ौ': 'au', 'ॉ': 'o',
  };

  static const _signs = {'ं': 'n', 'ँ': 'n', 'ः': 'h', '।': '.'};
}
