/// Gender as stored in `people.gender`.
enum Gender {
  male('male'),
  female('female'),
  other('other'),
  unknown('unknown');

  const Gender(this.dbValue);

  /// Value persisted in the database (matches the SQL CHECK constraint).
  final String dbValue;

  static Gender fromDb(String? value) => Gender.values.firstWhere(
    (g) => g.dbValue == value,
    orElse: () => Gender.unknown,
  );

  /// Picks the gendered variant of a token; `other` and `unknown` use the
  /// neutral form because kinship terms are binary in Hindi.
  String pick(String male, String female, String neutral) => switch (this) {
    Gender.male => male,
    Gender.female => female,
    Gender.other || Gender.unknown => neutral,
  };
}
