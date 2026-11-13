import 'kin_step.dart';
import 'relation_side.dart';

/// A readable path from one person to another, e.g. father → younger
/// brother → daughter (`F.yB.D`, चचेरी बहन).
final class KinPath {
  const KinPath(this.steps);

  final List<KinStep> steps;

  bool get isEmpty => steps.isEmpty;

  /// Dictionary key, e.g. `F.yB.D`.
  String get key => steps.map((s) => s.token).join('.');

  /// Key with seniority removed, e.g. `F.B.D`; used when the exact key is not
  /// in the dictionary or ages are unknown.
  String get plainKey => steps.map((s) => s.plainToken).join('.');

  /// Generation difference: +1 per parent hop, −1 per child hop.
  int get generation => steps.fold(0, (sum, s) {
    return switch (s.kind) {
      StepKind.parent => sum + 1,
      StepKind.child => sum - 1,
      _ => sum,
    };
  });

  /// Side of the family the relation is reached through.
  RelationSide get side {
    if (steps.isEmpty) return RelationSide.direct;
    if (steps.any((s) => s.kind == StepKind.social)) return RelationSide.social;
    final first = steps.first;
    final isDirect =
        steps.length == 1 || steps.every((s) => s.kind == StepKind.child || (s.kind == StepKind.sibling && s == first));
    if (isDirect) return RelationSide.direct;
    return switch (first.kind) {
      StepKind.spouse => RelationSide.inLaws,
      StepKind.parent => first.token == 'M' ? RelationSide.maternal : RelationSide.paternal,
      _ => RelationSide.direct,
    };
  }

  @override
  String toString() => 'KinPath($key)';
}
