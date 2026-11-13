import 'gender.dart';
import 'graph.dart';
import 'kin_path.dart';
import 'kin_step.dart';

/// Finds the most natural relation path between people (blueprint §4.4).
///
/// Weighted shortest path (Dijkstra) over raw hops. Blood hops cost 1, a
/// spouse hop costs slightly more so blood paths win ties, and social ties
/// cost 3 so they are only used when no family path is about as short.
/// Raw hops are then post-processed into readable steps: "up to a parent then
/// down to another child" becomes a single sibling step with seniority.
final class PathFinder {
  PathFinder(this.graph);

  final FamilyGraph graph;

  static const _bloodCost = 10;
  static const _spouseCost = 11;
  static const _socialCost = 30;

  /// Shortest readable path from [from] to [to]; `null` if not connected.
  /// [avoid] excludes intermediate people (used to find alternative paths).
  KinPath? find(String from, String to, {bool includeSocial = true, Set<String> avoid = const {}}) {
    if (!graph.contains(from) || !graph.contains(to)) return null;
    if (from == to) return const KinPath([]);
    final hops = _dijkstra(from, includeSocial: includeSocial, target: to, avoid: avoid).pathTo(to);
    return hops == null ? null : _readable(from, hops);
  }

  /// Up to [k] distinct paths, shortest first. Alternatives are found by
  /// excluding, one at a time, each person and each connection of the best
  /// path (so a direct tie still yields the longer family route).
  List<KinPath> findAll(String from, String to, {int k = 3, bool includeSocial = true}) {
    if (!graph.contains(from) || !graph.contains(to) || from == to) return const [];
    final raw = _dijkstra(from, includeSocial: includeSocial, target: to).pathTo(to);
    if (raw == null) return const [];
    final best = _readable(from, raw);
    final results = <String, KinPath>{_signature(best): best};

    final attempts = <({Set<String> nodes, Set<String> edges})>[
      for (final h in raw.take(raw.length - 1)) (nodes: {h.to}, edges: const {}),
      for (final h in raw) (nodes: const {}, edges: {_edgeKey(h.from, h.to)}),
    ];
    for (final a in attempts) {
      if (results.length >= k) break;
      final hops = _dijkstra(
        from,
        includeSocial: includeSocial,
        target: to,
        avoid: a.nodes,
        avoidEdges: a.edges,
      ).pathTo(to);
      if (hops == null) continue;
      final alt = _readable(from, hops);
      results.putIfAbsent(_signature(alt), () => alt);
    }
    final list = results.values.toList()..sort((a, b) => a.steps.length.compareTo(b.steps.length));
    return list.take(k).toList();
  }

  static String _edgeKey(String a, String b) => a.compareTo(b) < 0 ? '$a|$b' : '$b|$a';

  /// One pass from [from] to everyone reachable (used for "relation to me").
  Map<String, KinPath> findAllFrom(String from, {bool includeSocial = true}) {
    if (!graph.contains(from)) return const {};
    final tree = _dijkstra(from, includeSocial: includeSocial);
    return {
      for (final id in tree.reached)
        if (id != from) id: _readable(from, tree.pathTo(id)!),
    };
  }

  static String _signature(KinPath p) => p.steps.map((s) => s.toPersonId).join('>');

  // ------------------------------------------------------------ dijkstra

  _ShortestPathTree _dijkstra(
    String from, {
    required bool includeSocial,
    String? target,
    Set<String> avoid = const {},
    Set<String> avoidEdges = const {},
  }) {
    final dist = <String, int>{from: 0};
    final prev = <String, _RawHop>{};
    final heap = _MinHeap()..push(0, from);
    final done = <String>{};

    while (heap.isNotEmpty) {
      final (d, node) = heap.pop();
      if (!done.add(node)) continue;
      if (node == target) break;

      void relax(String next, int cost, _RawHop hop) {
        if (done.contains(next) || (avoid.contains(next) && next != target)) return;
        if (avoidEdges.isNotEmpty && avoidEdges.contains(_edgeKey(node, next))) return;
        final nd = d + cost;
        final old = dist[next];
        if (old == null || nd < old) {
          dist[next] = nd;
          prev[next] = hop;
          heap.push(nd, next);
        }
      }

      for (final e in graph.parentEdgesOf(node)) {
        relax(e.parentId, _bloodCost, _RawHop(_HopKind.up, node, e.parentId, parentKind: e.kind));
      }
      for (final e in graph.childEdgesOf(node)) {
        relax(e.childId, _bloodCost, _RawHop(_HopKind.down, node, e.childId, parentKind: e.kind));
      }
      for (final e in graph.partnerEdgesOf(node)) {
        final other = e.aId == node ? e.bId : e.aId;
        relax(other, e.active ? _spouseCost : _spouseCost + 5, _RawHop(_HopKind.spouse, node, other));
      }
      if (includeSocial) {
        for (final e in graph.socialEdgesOf(node)) {
          final other = e.aId == node ? e.bId : e.aId;
          relax(other, _socialCost, _RawHop(_HopKind.social, node, other, socialType: e.type));
        }
      }
    }
    return _ShortestPathTree(prev, done);
  }

  // ------------------------------------------------- raw hops → KinPath

  KinPath _readable(String from, List<_RawHop> hops) {
    final steps = <KinStep>[];
    var i = 0;
    while (i < hops.length) {
      final h = hops[i];
      // up to P, then down to a different child Q  ⇒  sibling step to Q.
      if (h.kind == _HopKind.up &&
          i + 1 < hops.length &&
          hops[i + 1].kind == _HopKind.down &&
          hops[i + 1].to != h.from &&
          h.parentKind != ParentKind.step &&
          hops[i + 1].parentKind != ParentKind.step) {
        final sibling = hops[i + 1].to;
        steps.add(
          KinStep(
            kind: StepKind.sibling,
            toPersonId: sibling,
            toGender: _gender(sibling),
            seniority: seniorityOf(sibling, comparedTo: h.from),
            half: graph.areHalfSiblings(h.from, sibling),
          ),
        );
        i += 2;
        continue;
      }
      steps.add(switch (h.kind) {
        _HopKind.up => KinStep(
          kind: StepKind.parent,
          toPersonId: h.to,
          toGender: _gender(h.to),
          step: h.parentKind == ParentKind.step,
        ),
        _HopKind.down => KinStep(
          kind: StepKind.child,
          toPersonId: h.to,
          toGender: _gender(h.to),
          step: h.parentKind == ParentKind.step,
        ),
        _HopKind.spouse => KinStep(kind: StepKind.spouse, toPersonId: h.to, toGender: _gender(h.to)),
        _HopKind.social => KinStep(
          kind: StepKind.social,
          toPersonId: h.to,
          toGender: _gender(h.to),
          socialType: h.socialType,
        ),
      });
      i++;
    }
    final commonAncestor = _commonAncestor(hops);
    return KinPath(steps, commonAncestorId: commonAncestor);
  }

  /// For pure blood paths (all ups, then all downs) the top-most person.
  static String? _commonAncestor(List<_RawHop> hops) {
    if (hops.isEmpty || hops.any((h) => h.kind == _HopKind.spouse || h.kind == _HopKind.social)) return null;
    var i = 0;
    while (i < hops.length && hops[i].kind == _HopKind.up) {
      i++;
    }
    if (i == 0) return hops.first.from; // straight descendant: the start person
    if (hops.skip(i).any((h) => h.kind != _HopKind.down)) return null;
    return hops[i - 1].to;
  }

  Gender _gender(String id) => graph.person(id)?.gender ?? Gender.unknown;

  /// Is [personId] elder or younger than [comparedTo]? Uses birth dates,
  /// falling back to `birthOrder` when both are known.
  Seniority seniorityOf(String personId, {required String comparedTo}) {
    final a = graph.person(personId);
    final b = graph.person(comparedTo);
    if (a == null || b == null) return Seniority.unknown;
    if (a.birthYear != null && b.birthYear != null) {
      final ka = (a.birthYear!, a.birthMonth ?? 0, a.birthDay ?? 0);
      final kb = (b.birthYear!, b.birthMonth ?? 0, b.birthDay ?? 0);
      final cmp = _compare(ka, kb);
      final precise = (a.birthMonth != null && b.birthMonth != null) || a.birthYear != b.birthYear;
      if (cmp != 0 && precise) return cmp < 0 ? Seniority.elder : Seniority.younger;
    }
    if (a.birthOrder != null && b.birthOrder != null && a.birthOrder != b.birthOrder) {
      return a.birthOrder! < b.birthOrder! ? Seniority.elder : Seniority.younger;
    }
    return Seniority.unknown;
  }

  static int _compare((int, int, int) a, (int, int, int) b) {
    if (a.$1 != b.$1) return a.$1.compareTo(b.$1);
    if (a.$2 != b.$2) return a.$2.compareTo(b.$2);
    return a.$3.compareTo(b.$3);
  }
}

enum _HopKind { up, down, spouse, social }

final class _RawHop {
  const _RawHop(this.kind, this.from, this.to, {this.parentKind, this.socialType});

  final _HopKind kind;
  final String from;
  final String to;
  final ParentKind? parentKind;
  final String? socialType;
}

final class _ShortestPathTree {
  _ShortestPathTree(this._prev, this.reached);

  final Map<String, _RawHop> _prev;
  final Set<String> reached;

  List<_RawHop>? pathTo(String id) {
    if (!reached.contains(id)) return null;
    final hops = <_RawHop>[];
    var cur = id;
    while (_prev.containsKey(cur)) {
      final h = _prev[cur]!;
      hops.add(h);
      cur = h.from;
    }
    return hops.reversed.toList();
  }
}

/// Minimal binary min-heap keyed by an int priority.
final class _MinHeap {
  final _items = <(int, String)>[];

  bool get isNotEmpty => _items.isNotEmpty;

  void push(int priority, String value) {
    _items.add((priority, value));
    var i = _items.length - 1;
    while (i > 0) {
      final parent = (i - 1) >> 1;
      if (_items[parent].$1 <= _items[i].$1) break;
      _swap(i, parent);
      i = parent;
    }
  }

  (int, String) pop() {
    final top = _items.first;
    final last = _items.removeLast();
    if (_items.isNotEmpty) {
      _items[0] = last;
      var i = 0;
      while (true) {
        final l = 2 * i + 1;
        final r = l + 1;
        var smallest = i;
        if (l < _items.length && _items[l].$1 < _items[smallest].$1) smallest = l;
        if (r < _items.length && _items[r].$1 < _items[smallest].$1) smallest = r;
        if (smallest == i) break;
        _swap(i, smallest);
        i = smallest;
      }
    }
    return top;
  }

  void _swap(int a, int b) {
    final t = _items[a];
    _items[a] = _items[b];
    _items[b] = t;
  }
}
