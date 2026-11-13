import 'gender.dart';
import 'graph.dart';
import 'path_finder.dart';

enum ViolationSeverity { block, warn }

/// A rule the proposed edge breaks. [code] is stable (used for localisation);
/// the same codes are raised by the database triggers.
final class GraphViolation {
  const GraphViolation(this.code, this.severity);

  final String code;
  final ViolationSeverity severity;

  bool get blocks => severity == ViolationSeverity.block;

  static const selfRelation = 'SELF_RELATION';
  static const cycle = 'GENEALOGY_CYCLE';
  static const duplicateEdge = 'DUPLICATE_EDGE';
  static const tooManyBioParents = 'TOO_MANY_BIO_PARENTS';
  static const duplicateBioParentGender = 'DUPLICATE_BIO_PARENT_GENDER';
  static const parentTooYoung = 'PARENT_TOO_YOUNG';
  static const closeBloodMarriage = 'CLOSE_BLOOD_MARRIAGE';
  static const partnerIsAncestor = 'PARTNER_IS_ANCESTOR';

  @override
  String toString() => 'GraphViolation($code, ${severity.name})';
}

/// Validates new edges against the graph (blueprint §4.8). The app runs this
/// before every write so errors appear instantly, even offline.
abstract final class GraphValidator {
  static List<GraphViolation> parentEdge(
    FamilyGraph g, {
    required String parentId,
    required String childId,
    ParentKind kind = ParentKind.biological,
  }) {
    if (parentId == childId) return const [GraphViolation(GraphViolation.selfRelation, ViolationSeverity.block)];
    final out = <GraphViolation>[];
    if (g.parentsOf(childId).contains(parentId)) {
      out.add(const GraphViolation(GraphViolation.duplicateEdge, ViolationSeverity.block));
    }
    if (g.ancestorsOf(parentId).contains(childId)) {
      out.add(const GraphViolation(GraphViolation.cycle, ViolationSeverity.block));
    }
    if (kind == ParentKind.biological) {
      final bio = g.parentEdgesOf(childId).where((e) => e.kind == ParentKind.biological && e.parentId != parentId);
      if (bio.length >= 2) {
        out.add(const GraphViolation(GraphViolation.tooManyBioParents, ViolationSeverity.block));
      }
      final gender = g.person(parentId)?.gender ?? Gender.unknown;
      if ((gender == Gender.male || gender == Gender.female) &&
          bio.any((e) => g.person(e.parentId)?.gender == gender)) {
        out.add(const GraphViolation(GraphViolation.duplicateBioParentGender, ViolationSeverity.block));
      }
    }
    final py = g.person(parentId)?.birthYear;
    final cy = g.person(childId)?.birthYear;
    if (py != null && cy != null && cy - py < 12) {
      out.add(const GraphViolation(GraphViolation.parentTooYoung, ViolationSeverity.warn));
    }
    return out;
  }

  static List<GraphViolation> partnership(FamilyGraph g, {required String aId, required String bId}) {
    if (aId == bId) return const [GraphViolation(GraphViolation.selfRelation, ViolationSeverity.block)];
    final out = <GraphViolation>[];
    if (g.spousesOf(aId, includeFormer: true).contains(bId)) {
      out.add(const GraphViolation(GraphViolation.duplicateEdge, ViolationSeverity.block));
    }
    if (g.ancestorsOf(aId).contains(bId) || g.ancestorsOf(bId).contains(aId)) {
      out.add(const GraphViolation(GraphViolation.partnerIsAncestor, ViolationSeverity.block));
    } else {
      final path = PathFinder(g).find(aId, bId, includeSocial: false);
      if (path != null && path.isBlood && path.steps.length <= 2) {
        out.add(const GraphViolation(GraphViolation.closeBloodMarriage, ViolationSeverity.warn));
      }
    }
    return out;
  }
}
