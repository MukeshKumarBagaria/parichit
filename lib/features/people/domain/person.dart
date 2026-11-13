import 'package:kinship/kinship.dart';
import 'package:meta/meta.dart';

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
    this.gender = Gender.unknown,
    this.isLiving,
    this.occupation,
    this.notes,
    this.primaryPhone,
    this.isSelf = false,
    this.isPlaceholder = false,
    this.isFavorite = false,
  });

  final String id;
  final String fullName;

  /// The same name in the other script (हिंदी / English).
  final String? fullNameAlt;
  final String? nickname;
  final Gender gender;

  /// `null` means not known.
  final bool? isLiving;
  final String? occupation;
  final String? notes;

  /// Primary phone in E.164, if any.
  final String? primaryPhone;
  final bool isSelf;
  final bool isPlaceholder;
  final bool isFavorite;
  final DateTime createdAt;
  final DateTime updatedAt;

  bool get isDeceased => isLiving == false;

  @override
  bool operator ==(Object other) =>
      other is Person && other.id == id && other.updatedAt == updatedAt && other.primaryPhone == primaryPhone;

  @override
  int get hashCode => Object.hash(id, updatedAt, primaryPhone);
}

/// Input for creating a person (Quick Add, onboarding).
@immutable
final class NewPerson {
  const NewPerson({
    required this.fullName,
    this.fullNameAlt,
    this.gender = Gender.unknown,
    this.phone,
    this.notes,
    this.isSelf = false,
  });

  final String fullName;
  final String? fullNameAlt;
  final Gender gender;
  final String? phone;
  final String? notes;
  final bool isSelf;
}
