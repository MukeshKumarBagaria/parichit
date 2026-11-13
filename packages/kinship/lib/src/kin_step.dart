import 'gender.dart';

/// The kind of hop taken between two people in the family graph.
enum StepKind { parent, child, spouse, sibling, social }

/// Relative age of a sibling compared to the person before them in the path.
enum Seniority {
  elder('e'),
  younger('y'),
  unknown('');

  const Seniority(this.prefix);

  /// Prefix used in relation keys, e.g. `eB` = elder brother.
  final String prefix;
}

/// One hop in a relation path, described from the perspective of the person
/// we arrive at.
final class KinStep {
  const KinStep({
    required this.kind,
    required this.toPersonId,
    required this.toGender,
    this.seniority = Seniority.unknown,
    this.half = false,
    this.step = false,
  });

  final StepKind kind;
  final String toPersonId;
  final Gender toGender;

  /// Only meaningful for [StepKind.sibling].
  final Seniority seniority;

  /// Half-sibling (shares exactly one parent).
  final bool half;

  /// Step-parent / step-child edge (`parent_child.kind = 'step'`).
  final bool step;

  /// Compact token used to build dictionary keys, e.g. `F`, `M`, `eB`, `W`.
  String get token => switch (kind) {
    StepKind.parent => toGender.pick('F', 'M', 'P'),
    StepKind.child => toGender.pick('S', 'D', 'C'),
    StepKind.spouse => toGender.pick('H', 'W', 'Sp'),
    StepKind.sibling => '${seniority.prefix}${toGender.pick('B', 'Z', 'Sb')}',
    StepKind.social => 'Fr',
  };

  /// Token without elder/younger information, used as a lookup fallback.
  String get plainToken => switch (kind) {
    StepKind.sibling => toGender.pick('B', 'Z', 'Sb'),
    _ => token,
  };

  @override
  bool operator ==(Object other) =>
      other is KinStep &&
      other.kind == kind &&
      other.toPersonId == toPersonId &&
      other.toGender == toGender &&
      other.seniority == seniority &&
      other.half == half &&
      other.step == step;

  @override
  int get hashCode => Object.hash(kind, toPersonId, toGender, seniority, half, step);

  @override
  String toString() => 'KinStep($token → $toPersonId)';
}
