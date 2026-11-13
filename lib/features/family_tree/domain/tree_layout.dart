import 'dart:math' as math;

import 'package:kinship/kinship.dart';
import 'package:meta/meta.dart';

enum TreeRole { focus, spouse, ancestor, descendant, sibling }

/// A positioned person card. Coordinates are the card's top-left corner.
@immutable
final class TreeNode {
  const TreeNode({
    required this.personId,
    required this.x,
    required this.y,
    required this.role,
    this.hasMoreAbove = false,
    this.hasMoreBelow = false,
  });

  final String personId;
  final double x;
  final double y;
  final TreeRole role;

  /// Ancestors/descendants exist beyond the shown generations.
  final bool hasMoreAbove;
  final bool hasMoreBelow;
}

/// A straight connector line.
@immutable
final class TreeLine {
  const TreeLine(this.x1, this.y1, this.x2, this.y2, {this.isMarriage = false});

  final double x1;
  final double y1;
  final double x2;
  final double y2;
  final bool isMarriage;
}

@immutable
final class TreeLayout {
  const TreeLayout({required this.nodes, required this.lines, required this.width, required this.height});

  final List<TreeNode> nodes;
  final List<TreeLine> lines;
  final double width;
  final double height;

  TreeNode? nodeFor(String id) => nodes.where((n) => n.personId == id).firstOrNull;
}

/// Hourglass layout around a focus person (blueprint §4 / §10 screen 7):
/// ancestors above as a binary tree, descendants below with spouses side by
/// side, and siblings in the focus row (elder left, younger right).
final class TreeLayoutEngine {
  TreeLayoutEngine(
    this.graph, {
    this.nodeWidth = 132,
    this.nodeHeight = 76,
    this.hGap = 20,
    this.vGap = 56,
    this.spouseGap = 10,
    this.padding = 40,
  });

  final FamilyGraph graph;
  final double nodeWidth;
  final double nodeHeight;
  final double hGap;
  final double vGap;
  final double spouseGap;
  final double padding;

  double get _rowHeight => nodeHeight + vGap;

  TreeLayout layout(String focusId, {int generationsUp = 2, int generationsDown = 2, bool showSiblings = true}) {
    if (!graph.contains(focusId)) return const TreeLayout(nodes: [], lines: [], width: 0, height: 0);
    final nodes = <TreeNode>[];
    final lines = <TreeLine>[];

    // ---------------------------------------------------- descendants
    final widthCache = <String, double>{};
    final visitedDown = <String>{};

    List<String> coupleOf(String id) => [
      id,
      ...graph.spousesOf(id, includeFormer: true).where((s) => !visitedDown.contains(s)),
    ];
    double coupleWidth(int n) => n * nodeWidth + (n - 1) * spouseGap;

    double measureDown(String id, int depth) {
      final cached = widthCache[id];
      if (cached != null) return cached;
      final couple = coupleOf(id);
      final cw = coupleWidth(couple.length);
      if (depth >= generationsDown) return widthCache[id] = cw;
      final kids = graph.childrenOf(id).where((k) => k != id).toList();
      if (kids.isEmpty) return widthCache[id] = cw;
      final kw = kids.fold<double>(0, (s, k) => s + measureDown(k, depth + 1)) + (kids.length - 1) * hGap;
      return widthCache[id] = math.max(cw, kw);
    }

    void placeDown(String id, double left, int depth, TreeRole role) {
      if (!visitedDown.add(id)) return;
      final w = measureDown(id, depth);
      final couple = coupleOf(id);
      for (final s in couple.skip(1)) {
        visitedDown.add(s);
      }
      final cw = coupleWidth(couple.length);
      final y = depth * _rowHeight;
      var x = left + (w - cw) / 2;
      final kids = depth < generationsDown ? graph.childrenOf(id) : const <String>[];
      for (final (i, pid) in couple.indexed) {
        final r = i == 0 ? role : TreeRole.spouse;
        nodes.add(
          TreeNode(
            personId: pid,
            x: x,
            y: y,
            role: r,
            hasMoreBelow: i == 0 && depth >= generationsDown && graph.childrenOf(pid).isNotEmpty,
            hasMoreAbove: r == TreeRole.spouse && graph.parentsOf(pid).isNotEmpty,
          ),
        );
        if (i > 0) {
          final my = y + nodeHeight / 2;
          lines.add(TreeLine(x - spouseGap, my, x, my, isMarriage: true));
        }
        x += nodeWidth + spouseGap;
      }
      if (kids.isEmpty) return;

      final parentCx = left + (w - cw) / 2 + (couple.length == 1 ? nodeWidth / 2 : nodeWidth + spouseGap / 2);
      final busY = y + nodeHeight + vGap / 2;
      lines.add(TreeLine(parentCx, y + nodeHeight, parentCx, busY));

      final kw = kids.fold<double>(0, (s, k) => s + measureDown(k, depth + 1)) + (kids.length - 1) * hGap;
      var kx = left + (w - kw) / 2;
      final centers = <double>[];
      for (final k in kids) {
        final kWidth = measureDown(k, depth + 1);
        final kCouple = coupleWidth(coupleOf(k).length);
        final kCenter = kx + (kWidth - kCouple) / 2 + nodeWidth / 2;
        centers.add(kCenter);
        lines.add(TreeLine(kCenter, busY, kCenter, busY + vGap / 2));
        placeDown(k, kx, depth + 1, TreeRole.descendant);
        kx += kWidth + hGap;
      }
      lines.add(
        TreeLine(
          math.min(parentCx, centers.reduce(math.min)),
          busY,
          math.max(parentCx, centers.reduce(math.max)),
          busY,
        ),
      );
    }

    final focusWidth = measureDown(focusId, 0);
    placeDown(focusId, 0, 0, TreeRole.focus);
    final focusNode = nodes.firstWhere((n) => n.personId == focusId);
    final focusCx = focusNode.x + nodeWidth / 2;

    // ------------------------------------------------------ siblings
    final siblingCenters = <double>[];
    if (showSiblings && generationsUp > 0) {
      final finder = PathFinder(graph);
      final siblings = graph.siblingsOf(focusId).where((s) => !visitedDown.contains(s)).toList();
      final elder = siblings.where((s) => finder.seniorityOf(s, comparedTo: focusId) == Seniority.elder).toList()
        ..sort((a, b) => -_birthKey(a).compareTo(_birthKey(b)));
      final younger = siblings.where((s) => !elder.contains(s)).toList()
        ..sort((a, b) => _birthKey(a).compareTo(_birthKey(b)));
      var lx = -hGap - nodeWidth;
      for (final s in elder) {
        nodes.add(
          TreeNode(personId: s, x: lx, y: 0, role: TreeRole.sibling, hasMoreBelow: graph.childrenOf(s).isNotEmpty),
        );
        siblingCenters.add(lx + nodeWidth / 2);
        lx -= nodeWidth + hGap;
      }
      var rx = focusWidth + hGap;
      for (final s in younger) {
        nodes.add(
          TreeNode(personId: s, x: rx, y: 0, role: TreeRole.sibling, hasMoreBelow: graph.childrenOf(s).isNotEmpty),
        );
        siblingCenters.add(rx + nodeWidth / 2);
        rx += nodeWidth + hGap;
      }
    }

    // ----------------------------------------------------- ancestors
    final upCache = <String, double>{};
    final visitedUp = <String>{focusId};

    double measureUp(String id, int depth) {
      final cached = upCache[id];
      if (cached != null) return cached;
      final parents = graph.parentsOf(id);
      if (depth >= generationsUp || parents.isEmpty) return upCache[id] = nodeWidth;
      final pw = parents.fold<double>(0, (s, p) => s + measureUp(p, depth + 1)) + (parents.length - 1) * hGap;
      return upCache[id] = math.max(nodeWidth, pw);
    }

    void placeUp(String id, double centerX, int depth, {List<double> extraChildren = const []}) {
      if (depth >= generationsUp) return;
      final parents = _orderedParents(id);
      if (parents.isEmpty) return;
      final y = -(depth + 1) * _rowHeight;
      final childTop = -depth * _rowHeight;
      final busY = childTop - vGap / 2;
      final total = parents.fold<double>(0, (s, p) => s + measureUp(p, depth + 1)) + (parents.length - 1) * hGap;
      var x = centerX - total / 2;
      final centers = <double>[];
      for (final p in parents) {
        final pw = measureUp(p, depth + 1);
        final pcx = x + pw / 2;
        centers.add(pcx);
        if (visitedUp.add(p)) {
          nodes.add(
            TreeNode(
              personId: p,
              x: pcx - nodeWidth / 2,
              y: y,
              role: TreeRole.ancestor,
              hasMoreAbove: depth + 1 >= generationsUp && graph.parentsOf(p).isNotEmpty,
            ),
          );
          lines.add(TreeLine(pcx, y + nodeHeight, pcx, busY));
          placeUp(p, pcx, depth + 1);
        }
        x += pw + hGap;
      }
      if (parents.length == 2) {
        final my = y + nodeHeight / 2;
        lines.add(TreeLine(centers[0] + nodeWidth / 2, my, centers[1] - nodeWidth / 2, my, isMarriage: true));
      }
      final childXs = [centerX, ...extraChildren];
      for (final cx in childXs) {
        lines.add(TreeLine(cx, busY, cx, childTop));
      }
      final allX = [...centers, ...childXs];
      lines.add(TreeLine(allX.reduce(math.min), busY, allX.reduce(math.max), busY));
    }

    placeUp(focusId, focusCx, 0, extraChildren: siblingCenters);

    // -------------------------------------------------- normalise
    var minX = double.infinity, minY = double.infinity, maxX = -double.infinity, maxY = -double.infinity;
    for (final n in nodes) {
      minX = math.min(minX, n.x);
      minY = math.min(minY, n.y);
      maxX = math.max(maxX, n.x + nodeWidth);
      maxY = math.max(maxY, n.y + nodeHeight);
    }
    final dx = padding - minX;
    final dy = padding - minY;
    return TreeLayout(
      nodes: [
        for (final n in nodes)
          TreeNode(
            personId: n.personId,
            x: n.x + dx,
            y: n.y + dy,
            role: n.role,
            hasMoreAbove: n.hasMoreAbove,
            hasMoreBelow: n.hasMoreBelow,
          ),
      ],
      lines: [for (final l in lines) TreeLine(l.x1 + dx, l.y1 + dy, l.x2 + dx, l.y2 + dy, isMarriage: l.isMarriage)],
      width: maxX - minX + 2 * padding,
      height: maxY - minY + 2 * padding,
    );
  }

  /// Father first (left), mother second, unknown last.
  List<String> _orderedParents(String id) {
    int rank(String p) => switch (graph.person(p)?.gender) {
      Gender.male => 0,
      Gender.female => 1,
      _ => 2,
    };
    return graph.parentsOf(id)..sort((a, b) => rank(a).compareTo(rank(b)));
  }

  int _birthKey(String id) {
    final p = graph.person(id);
    if (p?.birthYear != null) return p!.birthYear! * 10000 + (p.birthMonth ?? 0) * 100 + (p.birthDay ?? 0);
    return (p?.birthOrder ?? 99) * 1;
  }
}
