/// Normalises phone numbers to E.164 (`+919876543210`) so the same number
/// typed differently ("098765 43210", "+91 98765-43210") matches for search
/// and duplicate detection. Defaults to India (+91) for local numbers.
abstract final class PhoneNormalizer {
  static const defaultCountryCode = '91';

  /// Returns the E.164 form, or `null` if [input] does not look like a phone
  /// number.
  static String? normalize(String input, {String countryCode = defaultCountryCode}) {
    final trimmed = input.trim();
    if (trimmed.isEmpty) return null;

    final hasPlus = trimmed.startsWith('+');
    var digits = trimmed.replaceAll(RegExp(r'\D'), '');
    if (digits.isEmpty) return null;

    if (hasPlus) {
      return _valid(digits) ? '+$digits' : null;
    }
    if (digits.startsWith('00')) {
      digits = digits.substring(2);
      return _valid(digits) ? '+$digits' : null;
    }
    // Indian trunk prefix: 0 + 10-digit number.
    if (digits.length == 11 && digits.startsWith('0')) {
      digits = digits.substring(1);
    }
    if (digits.length == 10) {
      return '+$countryCode$digits';
    }
    if (digits.length == 12 && digits.startsWith(countryCode)) {
      return '+$digits';
    }
    return _valid(digits) ? '+$digits' : null;
  }

  /// E.164 allows at most 15 digits; anything under 8 is not a usable number.
  static bool _valid(String digits) => digits.length >= 8 && digits.length <= 15;

  /// Digits only — used to build the local search index.
  static String digitsOnly(String input) => input.replaceAll(RegExp(r'\D'), '');
}
