import 'package:flutter_test/flutter_test.dart';
import 'package:parichit/core/utils/phone_normalizer.dart';

void main() {
  group('PhoneNormalizer.normalize', () {
    test('adds +91 to 10-digit Indian mobile numbers', () {
      expect(PhoneNormalizer.normalize('98290 12345'), '+919829012345');
      expect(PhoneNormalizer.normalize('98290-12345'), '+919829012345');
    });

    test('strips the 0 trunk prefix', () {
      expect(PhoneNormalizer.normalize('09829012345'), '+919829012345');
    });

    test('keeps explicit country codes', () {
      expect(PhoneNormalizer.normalize('+91 98290 12345'), '+919829012345');
      expect(PhoneNormalizer.normalize('919829012345'), '+919829012345');
      expect(PhoneNormalizer.normalize('+1 415 555 0100'), '+14155550100');
      expect(PhoneNormalizer.normalize('0044 20 7946 0000'), '+442079460000');
    });

    test('rejects input that is not a phone number', () {
      expect(PhoneNormalizer.normalize(''), isNull);
      expect(PhoneNormalizer.normalize('abc'), isNull);
      expect(PhoneNormalizer.normalize('12345'), isNull);
    });
  });
}
