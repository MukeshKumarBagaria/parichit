import 'package:kinship/kinship.dart';
import 'package:meta/meta.dart';

/// A date where only some parts may be known: "1955", "March 1955",
/// "12 March 1955", optionally approximate ("around 1955").
@immutable
final class PartialDate {
  const PartialDate({required this.year, this.month, this.day, this.approximate = false})
    : assert(month == null || (month >= 1 && month <= 12)),
      assert(day == null || (month != null && day >= 1 && day <= 31));

  final int year;
  final int? month;
  final int? day;
  final bool approximate;

  static PartialDate? of(int? year, int? month, int? day, {bool approximate = false}) => year == null
      ? null
      : PartialDate(year: year, month: month, day: month == null ? null : day, approximate: approximate);

  /// Age in whole years on [on] (approximate when month/day are unknown).
  int ageOn(DateTime on) {
    var age = on.year - year;
    if (month != null && (on.month < month! || (on.month == month! && (day ?? 1) > on.day))) age--;
    return age;
  }

  /// Next yearly occurrence on/after [from] (needs month and day).
  DateTime? nextAnniversary(DateTime from) {
    if (month == null || day == null) return null;
    final start = DateTime(from.year, from.month, from.day);
    var next = DateTime(from.year, month!, day!);
    if (next.isBefore(start)) next = DateTime(from.year + 1, month!, day!);
    return next;
  }

  @override
  bool operator ==(Object other) =>
      other is PartialDate &&
      other.year == year &&
      other.month == month &&
      other.day == day &&
      other.approximate == approximate;

  @override
  int get hashCode => Object.hash(year, month, day, approximate);
}

/// A person as the UI sees them. Independent of Drift/Supabase so screens and
/// business rules never depend on storage details.
@immutable
final class Person {
  const Person({
    required this.id,
    required this.fullName,
    required this.createdAt,
    required this.updatedAt,
    this.fullNameAlt,
    this.nickname,
    this.surname,
    this.gender = Gender.unknown,
    this.isLiving,
    this.birthDate,
    this.birthOrder,
    this.deathDate,
    this.gotra,
    this.occupation,
    this.organization,
    this.designation,
    this.education,
    this.notes,
    this.nativePlaceId,
    this.primaryPhone,
    this.isSelf = false,
    this.isPlaceholder = false,
    this.isFavorite = false,
    this.notifyBirthday = true,
    this.deletedAt,
  });

  final String id;
  final String fullName;

  /// The same name in the other script (हिंदी / English).
  final String? fullNameAlt;
  final String? nickname;
  final String? surname;
  final Gender gender;

  /// `null` means not known.
  final bool? isLiving;
  final PartialDate? birthDate;

  /// Position among siblings (1 = eldest), used when birth dates are unknown.
  final int? birthOrder;
  final PartialDate? deathDate;
  final String? gotra;
  final String? occupation;
  final String? organization;
  final String? designation;
  final String? education;
  final String? notes;

  /// Ancestral village (पैतृक गाँव).
  final String? nativePlaceId;

  /// Primary phone in E.164, if any.
  final String? primaryPhone;
  final bool isSelf;
  final bool isPlaceholder;
  final bool isFavorite;
  final bool notifyBirthday;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;

  bool get isDeceased => isLiving == false || deathDate != null;

  /// Editable copy of this person.
  PersonDraft toDraft() => PersonDraft(
    fullName: fullName,
    fullNameAlt: fullNameAlt,
    nickname: nickname,
    surname: surname,
    gender: gender,
    isLiving: isLiving,
    birthDate: birthDate,
    birthOrder: birthOrder,
    deathDate: deathDate,
    gotra: gotra,
    occupation: occupation,
    organization: organization,
    designation: designation,
    education: education,
    notes: notes,
    nativePlaceId: nativePlaceId,
    isFavorite: isFavorite,
    notifyBirthday: notifyBirthday,
  );

  @override
  bool operator ==(Object other) =>
      other is Person &&
      other.id == id &&
      other.updatedAt == updatedAt &&
      other.primaryPhone == primaryPhone &&
      other.deletedAt == deletedAt;

  @override
  int get hashCode => Object.hash(id, updatedAt, primaryPhone, deletedAt);
}

/// Every editable field of a person (full edit form).
@immutable
final class PersonDraft {
  const PersonDraft({
    required this.fullName,
    this.fullNameAlt,
    this.nickname,
    this.surname,
    this.gender = Gender.unknown,
    this.isLiving,
    this.birthDate,
    this.birthOrder,
    this.deathDate,
    this.gotra,
    this.occupation,
    this.organization,
    this.designation,
    this.education,
    this.notes,
    this.nativePlaceId,
    this.isFavorite = false,
    this.notifyBirthday = true,
  });

  final String fullName;
  final String? fullNameAlt;
  final String? nickname;
  final String? surname;
  final Gender gender;
  final bool? isLiving;
  final PartialDate? birthDate;
  final int? birthOrder;
  final PartialDate? deathDate;
  final String? gotra;
  final String? occupation;
  final String? organization;
  final String? designation;
  final String? education;
  final String? notes;
  final String? nativePlaceId;
  final bool isFavorite;
  final bool notifyBirthday;
}

/// Input for quick creation (Quick Add, onboarding, adding a relative).
@immutable
final class NewPerson {
  const NewPerson({
    required this.fullName,
    this.fullNameAlt,
    this.gender = Gender.unknown,
    this.phone,
    this.notes,
    this.nativePlaceId,
    this.isSelf = false,
  });

  final String fullName;
  final String? fullNameAlt;
  final Gender gender;
  final String? phone;
  final String? notes;
  final String? nativePlaceId;
  final bool isSelf;
}

/// A phone number, e-mail or other way to reach someone.
@immutable
final class ContactMethod {
  const ContactMethod({
    required this.kind,
    required this.value,
    this.id,
    this.label,
    this.isWhatsapp = false,
    this.isPrimary = false,
  });

  /// Null for a contact not saved yet.
  final String? id;

  /// `phone` | `email` | `website` | `social` | `other`
  final String kind;
  final String value;
  final String? label;
  final bool isWhatsapp;
  final bool isPrimary;

  ContactMethod copyWith({String? value, String? label, bool? isWhatsapp, bool? isPrimary}) => ContactMethod(
    id: id,
    kind: kind,
    value: value ?? this.value,
    label: label ?? this.label,
    isWhatsapp: isWhatsapp ?? this.isWhatsapp,
    isPrimary: isPrimary ?? this.isPrimary,
  );
}
