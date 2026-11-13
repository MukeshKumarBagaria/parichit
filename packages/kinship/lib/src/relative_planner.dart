import 'gender.dart';
import 'graph.dart';
import 'kin_path.dart';
import 'kin_step.dart';
import 'kin_terms.dart';
import 'path_finder.dart';
import 'relation_namer.dart';
import 'relation_side.dart';

/// One primitive hop of a compound relation, e.g. Mama = [mother, brother].
final class Hop {
  const Hop(this.kind, this.gender, {this.seniority = Seniority.unknown});

  final StepKind kind;
  final Gender gender;
  final Seniority seniority;

  /// Parses a relation key such as `M.B`, `F.eB.W` or `Sp.F` into hops.
  static List<Hop> parseKey(String key) => key.split('.').map(_parseToken).toList();

  static Hop _parseToken(String t) {
    var seniority = Seniority.unknown;
    var token = t;
    if (token.length == 2 && (token.startsWith('e') || token.startsWith('y'))) {
      seniority = token.startsWith('e') ? Seniority.elder : Seniority.younger;
      token = token.substring(1);
    }
    return switch (token) {
      'F' => const Hop(StepKind.parent, Gender.male),
      'M' => const Hop(StepKind.parent, Gender.female),
      'P' => const Hop(StepKind.parent, Gender.unknown),
      'S' => const Hop(StepKind.child, Gender.male),
      'D' => const Hop(StepKind.child, Gender.female),
      'C' => const Hop(StepKind.child, Gender.unknown),
      'H' => const Hop(StepKind.spouse, Gender.male),
      'W' => const Hop(StepKind.spouse, Gender.female),
      'Sp' => const Hop(StepKind.spouse, Gender.unknown),
      'B' => Hop(StepKind.sibling, Gender.male, seniority: seniority),
      'Z' => Hop(StepKind.sibling, Gender.female, seniority: seniority),
      'Sb' => Hop(StepKind.sibling, Gender.unknown, seniority: seniority),
      _ => throw ArgumentError.value(t, 'token', 'unknown relation token'),
    };
  }
}

/// A relation the user can add from a profile ("Add Mama").
final class RelationTemplate {
  RelationTemplate(this.key, this.group) : hops = Hop.parseKey(key);

  final String key;
  final RelationGroup group;
  final List<Hop> hops;

  KinTerm get term => kinTerms[key]!;

  /// Gender of the person being added.
  Gender get targetGender => hops.last.gender;

  bool get isDirect => hops.length == 1;
}

enum RelationGroup { direct, paternal, maternal, children, siblings, inLaws }

/// Relations offered in the "Add relative" sheet, in display order.
final relationTemplates = <RelationTemplate>[
  for (final k in ['F', 'M', 'H', 'W', 'S', 'D', 'B', 'Z']) RelationTemplate(k, RelationGroup.direct),
  for (final k in [
    'F.F',
    'F.M',
    'F.eB',
    'F.eB.W',
    'F.yB',
    'F.yB.W',
    'F.Z',
    'F.Z.H',
    'F.B.S',
    'F.B.D',
    'F.Z.S',
    'F.Z.D',
  ])
    RelationTemplate(k, RelationGroup.paternal),
  for (final k in ['M.F', 'M.M', 'M.B', 'M.B.W', 'M.Z', 'M.Z.H', 'M.B.S', 'M.B.D', 'M.Z.S', 'M.Z.D'])
    RelationTemplate(k, RelationGroup.maternal),
  for (final k in ['S.W', 'D.H', 'S.S', 'S.D', 'D.S', 'D.D', 'S.W.F', 'S.W.M', 'D.H.F', 'D.H.M'])
    RelationTemplate(k, RelationGroup.children),
  for (final k in ['B.W', 'Z.H', 'B.S', 'B.D', 'Z.S', 'Z.D']) RelationTemplate(k, RelationGroup.siblings),
  for (final k in [
    'Sp.F',
    'Sp.M',
    'W.B',
    'W.B.W',
    'W.Z',
    'W.Z.H',
    'H.eB',
    'H.eB.W',
    'H.yB',
    'H.yB.W',
    'H.Z',
    'H.Z.H',
  ])
    RelationTemplate(k, RelationGroup.inLaws),
];

RelationTemplate? templateFor(String key) {
  for (final t in relationTemplates) {
    if (t.key == key) return t;
  }
  return null;
}

// --------------------------------------------------------------- plan ops

/// Reference to a person in a plan: an existing id, a placeholder created by
/// the plan, or the person being added.
sealed class NodeRef {
  const NodeRef();
}

final class ExistingRef extends NodeRef {
  const ExistingRef(this.id);
  final String id;

  @override
  bool operator ==(Object other) => other is ExistingRef && other.id == id;
  @override
  int get hashCode => id.hashCode;
  @override
  String toString() => 'Existing($id)';
}

final class PlaceholderRef extends NodeRef {
  const PlaceholderRef(this.index);
  final int index;

  @override
  bool operator ==(Object other) => other is PlaceholderRef && other.index == index;
  @override
  int get hashCode => index.hashCode;
  @override
  String toString() => 'Placeholder#$index';
}

final class TargetRef extends NodeRef {
  const TargetRef();
  @override
  bool operator ==(Object other) => other is TargetRef;
  @override
  int get hashCode => 0;
  @override
  String toString() => 'Target';
}

sealed class PlanOp {
  const PlanOp();
}

/// Create a placeholder person. [relationKey] is their relation to the
/// anchor (e.g. `M` → "Rahul's mother"), used to name them.
final class CreatePlaceholder extends PlanOp {
  const CreatePlaceholder(this.ref, this.gender, this.relationKey);
  final PlaceholderRef ref;
  final Gender gender;
  final String relationKey;
  @override
  String toString() => 'CreatePlaceholder($ref, ${gender.name}, $relationKey)';
}

final class LinkParent extends PlanOp {
  const LinkParent({required this.parent, required this.child});
  final NodeRef parent;
  final NodeRef child;
  @override
  String toString() => 'LinkParent($parent → $child)';
}

final class LinkPartners extends PlanOp {
  const LinkPartners(this.a, this.b);
  final NodeRef a;
  final NodeRef b;
  @override
  String toString() => 'LinkPartners($a ↔ $b)';
}

/// Record that [elder] was born before [younger] (only applied when neither
/// has a birth order yet). Makes Tau vs Chacha, Jeth vs Devar resolvable.
final class SetSeniority extends PlanOp {
  const SetSeniority({required this.elder, required this.younger});
  final NodeRef elder;
  final NodeRef younger;
  @override
  String toString() => 'SetSeniority($elder > $younger)';
}

sealed class PlanResult {
  const PlanResult();
}

/// The user must pick which existing person a hop goes through (e.g. which
/// of two brothers). Answer by adding `choices[hopIndex] = id` (or `null`
/// for "someone not in the list" → a placeholder) and planning again.
final class NeedsChoice extends PlanResult {
  const NeedsChoice({required this.hopIndex, required this.fromRef, required this.viaKey, required this.candidates});
  final int hopIndex;
  final NodeRef fromRef;

  /// Relation of the candidates to the anchor, e.g. `F.B` ("which chacha?").
  final String viaKey;
  final List<String> candidates;
}

final class RelativePlan extends PlanResult {
  const RelativePlan(this.ops);
  final List<PlanOp> ops;

  Iterable<CreatePlaceholder> get placeholders => ops.whereType<CreatePlaceholder>();
}

/// Turns a compound relation into primitive edge operations (blueprint §4.3).
///
/// For each intermediate hop it reuses the single matching existing person,
/// asks when there are several, and creates a placeholder when there are
/// none. The final hop links the target person.
final class RelativePlanner {
  RelativePlanner(this.graph);

  final FamilyGraph graph;

  PlanResult plan({
    required String anchorId,
    required RelationTemplate template,
    Map<int, String?> choices = const {},
  }) {
    final ops = <PlanOp>[];
    var placeholderCount = 0;
    NodeRef current = ExistingRef(anchorId);
    final hops = template.hops;
    final keyTokens = template.key.split('.');

    PlaceholderRef newPlaceholder(Gender g, int hopIndex) {
      final ref = PlaceholderRef(placeholderCount++);
      ops.add(CreatePlaceholder(ref, g, keyTokens.take(hopIndex + 1).join('.')));
      return ref;
    }

    // Parents of a node, existing or created earlier in this plan.
    List<NodeRef> parentsOf(NodeRef node) {
      final planned = [
        for (final op in ops.whereType<LinkParent>())
          if (op.child == node) op.parent,
      ];
      if (node is ExistingRef) return [...graph.parentsOf(node.id).map(ExistingRef.new), ...planned];
      return planned;
    }

    /// Links [target] as a sibling of [node]: child of all of node's parents
    /// (creating one placeholder parent if none are known).
    void linkAsSibling(NodeRef node, NodeRef target, int hopIndex) {
      var parents = parentsOf(node);
      if (parents.isEmpty) {
        final p = PlaceholderRef(placeholderCount++);
        final siblingKey = keyTokens.take(hopIndex).join('.');
        ops
          ..add(CreatePlaceholder(p, Gender.unknown, siblingKey.isEmpty ? 'P' : '$siblingKey.P'))
          ..add(LinkParent(parent: p, child: node));
        parents = [p];
      }
      for (final p in parents) {
        ops.add(LinkParent(parent: p, child: target));
      }
    }

    void linkHop(Hop hop, NodeRef from, NodeRef to, int hopIndex) {
      switch (hop.kind) {
        case StepKind.parent:
          ops.add(LinkParent(parent: to, child: from));
        case StepKind.child:
          ops.add(LinkParent(parent: from, child: to));
        case StepKind.spouse:
          ops.add(LinkPartners(from, to));
        case StepKind.sibling:
          linkAsSibling(from, to, hopIndex);
          if (hop.seniority == Seniority.elder) ops.add(SetSeniority(elder: to, younger: from));
          if (hop.seniority == Seniority.younger) ops.add(SetSeniority(elder: from, younger: to));
        case StepKind.social:
          throw ArgumentError('social hops cannot be planned');
      }
    }

    for (var i = 0; i < hops.length; i++) {
      final hop = hops[i];
      final isLast = i == hops.length - 1;
      if (isLast) {
        linkHop(hop, current, const TargetRef(), i);
        break;
      }

      final candidates = current is ExistingRef ? _candidates(current.id, hop) : const <String>[];
      if (choices.containsKey(i)) {
        final chosen = choices[i];
        if (chosen != null) {
          current = ExistingRef(chosen);
          continue;
        }
      } else if (candidates.length == 1) {
        current = ExistingRef(candidates.single);
        continue;
      } else if (candidates.length > 1) {
        return NeedsChoice(
          hopIndex: i,
          fromRef: current,
          viaKey: keyTokens.take(i + 1).join('.'),
          candidates: candidates,
        );
      }
      // No suitable existing person (or the user chose "someone else").
      final placeholder = newPlaceholder(hop.gender, i);
      linkHop(hop, current, placeholder, i);
      current = placeholder;
    }
    return RelativePlan(ops);
  }

  /// Existing people one [hop] away from [fromId] that match its gender
  /// (unknown gender always matches) and seniority (unknown matches).
  List<String> _candidates(String fromId, Hop hop) {
    final ids = switch (hop.kind) {
      StepKind.parent => graph.parentsOf(fromId),
      StepKind.child => graph.childrenOf(fromId),
      StepKind.spouse => graph.spousesOf(fromId),
      StepKind.sibling => graph.siblingsOf(fromId),
      StepKind.social => const <String>[],
    };
    final finder = PathFinder(graph);
    return ids.where((id) {
      final g = graph.person(id)?.gender ?? Gender.unknown;
      final genderOk = hop.gender == Gender.unknown || g == Gender.unknown || g == hop.gender;
      if (!genderOk) return false;
      if (hop.kind == StepKind.sibling && hop.seniority != Seniority.unknown) {
        final s = finder.seniorityOf(id, comparedTo: fromId);
        return s == Seniority.unknown || s == hop.seniority;
      }
      return true;
    }).toList();
  }
}

/// Names a relation key without a concrete path, e.g. for placeholders
/// ("Rahul's mother") and the add-relative sheet.
RelationName nameForKey(String key) {
  final steps = [
    for (final (i, hop) in Hop.parseKey(key).indexed)
      KinStep(kind: hop.kind, toPersonId: '#$i', toGender: hop.gender, seniority: hop.seniority),
  ];
  final name = RelationNamer.name(KinPath(steps));
  return name;
}

/// Side of the family a template belongs to, for colouring the sheet.
RelationSide sideForKey(String key) => nameForKey(key).side;
