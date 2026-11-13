import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kinship/kinship.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/theme/relation_colors.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/person_avatar.dart';
import '../../people/domain/person.dart';
import '../../people/presentation/people_providers.dart';
import '../../relationships/presentation/person_picker_sheet.dart';
import '../../relationships/presentation/relation_text.dart';
import '../../relationships/presentation/relationship_providers.dart';
import '../domain/tree_layout.dart';

/// Family tree explorer (blueprint §10, screen 7).
class FamilyTreeScreen extends ConsumerStatefulWidget {
  const FamilyTreeScreen({this.focusId, super.key});

  final String? focusId;

  @override
  ConsumerState<FamilyTreeScreen> createState() => _FamilyTreeScreenState();
}

class _FamilyTreeScreenState extends ConsumerState<FamilyTreeScreen> {
  late String? _focus = widget.focusId;
  int _up = 2;
  int _down = 2;
  bool _listMode = false;
  final _transform = TransformationController();

  @override
  void dispose() {
    _transform.dispose();
    super.dispose();
  }

  void _refocus(String id) => setState(() {
    _focus = id;
    _transform.value = Matrix4.identity();
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final graph = ref.watch(familyGraphProvider).value;
    final people = ref.watch(peopleByIdProvider).value ?? const <String, Person>{};
    final selfId = ref.watch(selfPersonProvider).value?.id;
    final focus = _focus ?? selfId;

    return Scaffold(
      appBar: AppBar(
        title: Text(focus == null ? l10n.familyTreeTitle : (people[focus]?.fullName ?? l10n.familyTreeTitle)),
        actions: [
          IconButton(
            tooltip: l10n.treeChoosePerson,
            icon: const Icon(Icons.person_search),
            onPressed: () async {
              final picked = await showPersonPicker(context, title: l10n.treeChoosePerson, allowCreate: false);
              if (picked case PickedExisting(:final person)) _refocus(person.id);
            },
          ),
          if (selfId != null)
            IconButton(
              tooltip: l10n.treeCenterOnMe,
              icon: const Icon(Icons.my_location),
              onPressed: () => _refocus(selfId),
            ),
          IconButton(
            tooltip: _listMode ? l10n.treeModeTree : l10n.treeModeList,
            icon: Icon(_listMode ? Icons.account_tree_outlined : Icons.format_list_bulleted),
            onPressed: () => setState(() => _listMode = !_listMode),
          ),
        ],
      ),
      body: graph == null || focus == null
          ? const Center(child: CircularProgressIndicator())
          : !graph.contains(focus)
          ? EmptyState(icon: Icons.account_tree_outlined, title: l10n.personNotFound)
          : _listMode
          ? _TreeList(graph: graph, focusId: focus, people: people, onFocus: _refocus)
          : Column(
              children: [
                _GenerationControls(
                  up: _up,
                  down: _down,
                  onChanged: (u, d) => setState(() {
                    _up = u;
                    _down = d;
                  }),
                ),
                Expanded(child: _treeCanvas(context, graph, focus, people)),
              ],
            ),
    );
  }

  Widget _treeCanvas(BuildContext context, FamilyGraph graph, String focus, Map<String, Person> people) {
    final engine = TreeLayoutEngine(graph);
    final layout = engine.layout(focus, generationsUp: _up, generationsDown: _down);
    final lineColor = Theme.of(context).colorScheme.outline;

    return InteractiveViewer(
      transformationController: _transform,
      constrained: false,
      minScale: 0.3,
      maxScale: 2.5,
      boundaryMargin: const EdgeInsets.all(400),
      child: SizedBox(
        width: layout.width,
        height: layout.height,
        child: Stack(
          children: [
            Positioned.fill(child: CustomPaint(painter: _LinesPainter(layout.lines, lineColor))),
            for (final n in layout.nodes)
              Positioned(
                left: n.x,
                top: n.y,
                width: engine.nodeWidth,
                height: engine.nodeHeight,
                child: _PersonCard(
                  node: n,
                  person: people[n.personId],
                  onTap: () =>
                      n.role == TreeRole.focus ? context.push(Routes.person(n.personId)) : _refocus(n.personId),
                  onLongPress: () => context.push(Routes.person(n.personId)),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _GenerationControls extends StatelessWidget {
  const _GenerationControls({required this.up, required this.down, required this.onChanged});

  final int up;
  final int down;
  final void Function(int up, int down) onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    Widget stepper(String label, int value, ValueChanged<int> set) => Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.remove),
          onPressed: value > 0 ? () => set(value - 1) : null,
        ),
        Text('$value'),
        IconButton(
          visualDensity: VisualDensity.compact,
          icon: const Icon(Icons.add),
          onPressed: value < 6 ? () => set(value + 1) : null,
        ),
      ],
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: AppSpacing.xs),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        children: [
          stepper(l10n.treeGenerationsUp, up, (v) => onChanged(v, down)),
          stepper(l10n.treeGenerationsDown, down, (v) => onChanged(up, v)),
        ],
      ),
    );
  }
}

class _PersonCard extends ConsumerWidget {
  const _PersonCard({required this.node, required this.person, required this.onTap, required this.onLongPress});

  final TreeNode node;
  final Person? person;
  final VoidCallback onTap;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final rel = ref.watch(relationToMeProvider(node.personId));
    final isFocus = node.role == TreeRole.focus;
    final name = person?.fullName ?? '?';
    final relColor = rel == null ? scheme.primary : context.relationColors.of(rel.name.side).foreground;

    return Material(
      color: isFocus ? scheme.primary.withValues(alpha: 0.10) : scheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        side: BorderSide(
          color: isFocus ? scheme.primary : scheme.outline,
          width: isFocus ? 2 : 1,
          style: (person?.isPlaceholder ?? false) ? BorderStyle.none : BorderStyle.solid,
        ),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.input),
        onTap: onTap,
        onLongPress: onLongPress,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.xs),
          child: Row(
            children: [
              PersonAvatar(
                personId: node.personId,
                name: name,
                radius: 16,
                isPlaceholder: person?.isPlaceholder ?? false,
                isDeceased: person?.isDeceased ?? false,
              ),
              const SizedBox(width: AppSpacing.xs),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, maxLines: 2, overflow: TextOverflow.ellipsis, style: theme.textTheme.labelLarge),
                    if (rel != null)
                      Text(
                        context.relationLabel(rel.name),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: theme.textTheme.labelSmall?.copyWith(color: relColor),
                      )
                    else if (person?.isSelf ?? false)
                      Text(context.l10n.relationYou, style: theme.textTheme.labelSmall?.copyWith(color: relColor)),
                  ],
                ),
              ),
              if (node.hasMoreAbove || node.hasMoreBelow)
                Icon(Icons.unfold_more, size: 16, color: scheme.onSurfaceVariant),
            ],
          ),
        ),
      ),
    );
  }
}

class _LinesPainter extends CustomPainter {
  _LinesPainter(this.lines, this.color);

  final List<TreeLine> lines;
  final Color color;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;
    final marriage = Paint()
      ..color = color
      ..strokeWidth = 3;
    for (final l in lines) {
      canvas.drawLine(Offset(l.x1, l.y1), Offset(l.x2, l.y2), l.isMarriage ? marriage : paint);
    }
  }

  @override
  bool shouldRepaint(_LinesPainter old) => old.lines != lines || old.color != color;
}

/// Indented list view: parents above, then descendants with spouses —
/// easier to read than a wide tree on a small screen.
class _TreeList extends StatelessWidget {
  const _TreeList({required this.graph, required this.focusId, required this.people, required this.onFocus});

  final FamilyGraph graph;
  final String focusId;
  final Map<String, Person> people;
  final ValueChanged<String> onFocus;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final rows = <Widget>[];
    void addDescendants(String id, int depth, Set<String> seen) {
      if (!seen.add(id) || depth > 8) return;
      final spouses = graph.spousesOf(id, includeFormer: true).map((s) => people[s]?.fullName).whereType<String>();
      rows.add(
        ListTile(
          contentPadding: EdgeInsets.only(left: AppSpacing.md + depth * 20.0, right: AppSpacing.md),
          dense: true,
          leading: PersonAvatar(personId: id, name: people[id]?.fullName ?? '?', radius: 16),
          title: Text(people[id]?.fullName ?? '?'),
          subtitle: spouses.isEmpty ? null : Text('⚭ ${spouses.join(', ')}'),
          onTap: () => onFocus(id),
          onLongPress: () => context.push(Routes.person(id)),
        ),
      );
      for (final c in graph.childrenOf(id)) {
        addDescendants(c, depth + 1, seen);
      }
    }

    final parents = graph.parentsOf(focusId);
    return ListView(
      children: [
        if (parents.isNotEmpty) ...[
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, 0),
            child: Text(l10n.familyParents, style: Theme.of(context).textTheme.titleSmall),
          ),
          for (final p in parents)
            ListTile(
              dense: true,
              leading: PersonAvatar(personId: p, name: people[p]?.fullName ?? '?', radius: 16),
              title: Text(people[p]?.fullName ?? '?'),
              trailing: const Icon(Icons.north),
              onTap: () => onFocus(p),
            ),
          const Divider(),
        ],
        ...(() {
          addDescendants(focusId, 0, {});
          return rows;
        })(),
      ],
    );
  }
}
