import 'gender.dart';

/// How a parent → child edge came about (`parent_child.kind`).
enum ParentKind {
  biological('biological'),
  adoptive('adoptive'),
  step('step'),
  foster('foster'),
  guardian('guardian');

  const ParentKind(this.dbValue);

  final String dbValue;

  static ParentKind fromDb(String? value) =>
      ParentKind.values.firstWhere((k) => k.dbValue == value, orElse: () => ParentKind.biological);
}

/// The minimum the engine needs to know about a person.
final class KinPerson {
  const KinPerson({
    required this.id,
    this.gender = Gender.unknown,
    this.birthYear,
    this.birthMonth,
    this.birthDay,
    this.birthOrder,
    this.isPlaceholder = false,
  });

  final String id;
  final Gender gender;
  final int? birthYear;
  final int? birthMonth;
  final int? birthDay;

  /// Position among siblings, used when birth dates are unknown.
  final int? birthOrder;
  final bool isPlaceholder;

  KinPerson copyWith({Gender? gender, int? birthOrder}) => KinPerson(
    id: id,
    gender: gender ?? this.gender,
    birthYear: birthYear,
    birthMonth: birthMonth,
    birthDay: birthDay,
    birthOrder: birthOrder ?? this.birthOrder,
    isPlaceholder: isPlaceholder,
  );
}

final class ParentEdge {
  const ParentEdge({required this.parentId, required this.childId, this.kind = ParentKind.biological});

  final String parentId;
  final String childId;
  final ParentKind kind;
}

final class PartnerEdge {
  const PartnerEdge({required this.aId, required this.bId, this.active = true});

  final String aId;
  final String bId;

  /// False for divorced / separated partnerships. Widowed stays true: the
  /// relation (and the in-laws) remain.
  final bool active;
}

final class SocialEdge {
  const SocialEdge({required this.aId, required this.bId, required this.type});

  final String aId;
  final String bId;

  /// `social_connections.connection_type`, e.g. `friend`.
  final String type;
}

/// Immutable, indexed view of the family graph. Built once per change of the
/// underlying tables and shared by every engine operation.
final class FamilyGraph {
  FamilyGraph({
    required Iterable<KinPerson> people,
    Iterable<ParentEdge> parentEdges = const [],
    Iterable<PartnerEdge> partnerships = const [],
    Iterable<SocialEdge> social = const [],
  }) {
    for (final p in people) {
      _people[p.id] = p;
    }
    for (final e in parentEdges) {
      if (!_people.containsKey(e.parentId) || !_people.containsKey(e.childId)) continue;
      _allParentEdges.add(e);
      (_parents[e.childId] ??= []).add(e);
      (_children[e.parentId] ??= []).add(e);
    }
    for (final e in partnerships) {
      if (!_people.containsKey(e.aId) || !_people.containsKey(e.bId)) continue;
      _allPartnerEdges.add(e);
      (_partners[e.aId] ??= []).add(e);
      (_partners[e.bId] ??= []).add(e);
    }
    for (final e in social) {
      if (!_people.containsKey(e.aId) || !_people.containsKey(e.bId)) continue;
      _allSocialEdges.add(e);
      (_social[e.aId] ??= []).add(e);
      (_social[e.bId] ??= []).add(e);
    }
  }

  /// A copy of this graph with extra people and edges (used to validate a
  /// multi-step plan before anything is written).
  FamilyGraph extendedWith({
    Iterable<KinPerson> people = const [],
    Iterable<ParentEdge> parentEdges = const [],
    Iterable<PartnerEdge> partnerships = const [],
  }) => FamilyGraph(
    people: [..._people.values, ...people],
    parentEdges: [..._allParentEdges, ...parentEdges],
    partnerships: [..._allPartnerEdges, ...partnerships],
    social: _allSocialEdges,
  );

  final _allParentEdges = <ParentEdge>[];
  final _allPartnerEdges = <PartnerEdge>[];
  final _allSocialEdges = <SocialEdge>[];

  List<ParentEdge> get allParentEdges => List.unmodifiable(_allParentEdges);
  List<PartnerEdge> get allPartnerEdges => List.unmodifiable(_allPartnerEdges);
  List<SocialEdge> get allSocialEdges => List.unmodifiable(_allSocialEdges);

  final _people = <String, KinPerson>{};
  final _parents = <String, List<ParentEdge>>{};
  final _children = <String, List<ParentEdge>>{};
  final _partners = <String, List<PartnerEdge>>{};
  final _social = <String, List<SocialEdge>>{};

  static final empty = FamilyGraph(people: const []);

  Iterable<KinPerson> get people => _people.values;
  int get size => _people.length;

  KinPerson? person(String id) => _people[id];
  bool contains(String id) => _people.containsKey(id);

  List<ParentEdge> parentEdgesOf(String id) => _parents[id] ?? const [];
  List<ParentEdge> childEdgesOf(String id) => _children[id] ?? const [];
  List<PartnerEdge> partnerEdgesOf(String id) => _partners[id] ?? const [];
  List<SocialEdge> socialEdgesOf(String id) => _social[id] ?? const [];

  List<String> parentsOf(String id) => [for (final e in parentEdgesOf(id)) e.parentId];
  List<String> childrenOf(String id) => [for (final e in childEdgesOf(id)) e.childId];

  /// Current partners (excludes divorced/separated unless [includeFormer]).
  List<String> spousesOf(String id, {bool includeFormer = false}) => [
    for (final e in partnerEdgesOf(id))
      if (includeFormer || e.active) e.aId == id ? e.bId : e.aId,
  ];

  /// Siblings: other children of any of this person's parents.
  List<String> siblingsOf(String id) {
    final result = <String>{};
    for (final p in parentsOf(id)) {
      for (final c in childrenOf(p)) {
        if (c != id) result.add(c);
      }
    }
    return result.toList();
  }

  /// True when both people have exactly two known parents and share exactly
  /// one of them.
  bool areHalfSiblings(String a, String b) {
    final pa = parentsOf(a).toSet();
    final pb = parentsOf(b).toSet();
    return pa.length == 2 && pb.length == 2 && pa.intersection(pb).length == 1;
  }

  /// Every ancestor of [id] (excluding [id]).
  Set<String> ancestorsOf(String id) {
    final seen = <String>{};
    final stack = [...parentsOf(id)];
    while (stack.isNotEmpty) {
      final next = stack.removeLast();
      if (seen.add(next)) stack.addAll(parentsOf(next));
    }
    return seen;
  }

  /// People connected to [id] through family edges (parent/child/partner) —
  /// i.e. the "family cluster". Social ties are not followed.
  Set<String> familyClusterOf(String id) {
    final seen = <String>{id};
    final queue = [id];
    while (queue.isNotEmpty) {
      final cur = queue.removeLast();
      for (final n in [...parentsOf(cur), ...childrenOf(cur), ...spousesOf(cur, includeFormer: true)]) {
        if (seen.add(n)) queue.add(n);
      }
    }
    return seen;
  }

  /// All family clusters with at least [minSize] people, largest first.
  List<Set<String>> familyClusters({int minSize = 2}) {
    final assigned = <String>{};
    final clusters = <Set<String>>[];
    for (final id in _people.keys) {
      if (assigned.contains(id)) continue;
      final c = familyClusterOf(id);
      assigned.addAll(c);
      if (c.length >= minSize) clusters.add(c);
    }
    clusters.sort((a, b) => b.length.compareTo(a.length));
    return clusters;
  }
}
