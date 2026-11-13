import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinship/kinship.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/theme/relation_colors.dart';
import '../../people/domain/person.dart';
import '../data/graph_repository.dart';
import 'person_picker_sheet.dart';
import 'relation_text.dart';
import 'relationship_providers.dart';

/// "Add relative" (blueprint §10, screen 4):
/// pick a relation → pick/create the person → resolve ambiguities →
/// validate → save → offer smart follow-ups (§4.7).
Future<void> showAddRelativeFlow(BuildContext context, WidgetRef ref, Person anchor) async {
  final template = await showModalBottomSheet<RelationTemplate>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => _RelationPicker(anchorName: anchor.fullName),
  );
  if (template == null || !context.mounted) return;

  final l10n = context.l10n;
  final relation = context.termLabel(template.term);
  final picked = await showPersonPicker(
    context,
    title: l10n.pickPersonTitle(anchor.fullName, relation, template.targetGender == Gender.female ? 'female' : 'other'),
    excludeIds: {anchor.id},
    suggestedGender: template.targetGender,
  );
  if (picked == null || !context.mounted) return;

  final repo = ref.read(graphRepositoryProvider);
  final graph = await repo.loadGraph();
  final people = await ref.read(peopleByIdProvider.future);
  if (!context.mounted) return;

  // Resolve "which brother?"-style ambiguities interactively.
  final planner = RelativePlanner(graph);
  final choices = <int, String?>{};
  RelativePlan? plan;
  while (plan == null) {
    switch (planner.plan(anchorId: anchor.id, template: template, choices: choices)) {
      case final RelativePlan p:
        plan = p;
      case final NeedsChoice c:
        final chosen = await _askWhich(context, c, people);
        if (chosen == null || !context.mounted) return; // dismissed
        choices[c.hopIndex] = chosen.id;
    }
  }

  final target = switch (picked) {
    PickedExisting(:final person) => ExistingTarget(person.id) as RelativeTarget,
    PickedNew(:final person) => NewTarget(person),
  };
  final targetName = switch (picked) {
    PickedExisting(:final person) => person.fullName,
    PickedNew(:final person) => person.fullName.trim(),
  };

  final PreparedPlan prepared;
  try {
    prepared = await repo.prepare(anchorId: anchor.id, plan: plan, target: target);
  } on GraphRuleException catch (e) {
    if (context.mounted) await showViolations(context, e.violations, blocking: true);
    return;
  }
  if (!context.mounted) return;
  if (prepared.warnings.isNotEmpty && !await showViolations(context, prepared.warnings, blocking: false)) return;

  final targetId = await repo.commit(prepared);
  await HapticFeedback.lightImpact();
  if (!context.mounted) return;
  ScaffoldMessenger.of(
    context,
  ).showSnackBar(SnackBar(content: Text(l10n.relativeAdded(targetName, relation, anchor.fullName))));

  await _offerFollowUps(context, ref, anchor: anchor, template: template, targetId: targetId, targetName: targetName);
}

/// Shows blocking errors (OK) or warnings (Add anyway / Cancel). Returns
/// true when the user chose to continue.
Future<bool> showViolations(BuildContext context, List<GraphViolation> violations, {required bool blocking}) async {
  final l10n = context.l10n;
  final result = await showDialog<bool>(
    context: context,
    builder: (ctx) => AlertDialog(
      icon: Icon(blocking ? Icons.block : Icons.warning_amber_rounded),
      title: Text(blocking ? l10n.cannotAddTitle : l10n.warningTitle),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [for (final v in violations) Text('• ${ctx.violationMessage(v)}')],
      ),
      actions: blocking
          ? [FilledButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.actionOk))]
          : [
              TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.actionCancel)),
              FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.actionAddAnyway)),
            ],
    ),
  );
  return result ?? false;
}

/// "Which Chacha?" — returns the chosen person, `(id: null)` for "someone
/// not in this list", or null if dismissed.
Future<({String? id})?> _askWhich(BuildContext context, NeedsChoice c, Map<String, Person> people) {
  final l10n = context.l10n;
  final relation = context.relationLabel(nameForKey(c.viaKey));
  return showDialog<({String? id})>(
    context: context,
    builder: (ctx) => SimpleDialog(
      title: Text(l10n.choosePersonTitle(relation)),
      children: [
        for (final id in c.candidates)
          SimpleDialogOption(
            onPressed: () => Navigator.pop(ctx, (id: id)),
            child: Text(people[id]?.fullName ?? id),
          ),
        SimpleDialogOption(
          onPressed: () => Navigator.pop(ctx, (id: null)),
          child: Text(l10n.someoneNotListed, style: const TextStyle(fontStyle: FontStyle.italic)),
        ),
      ],
    ),
  );
}

Future<bool> _confirm(BuildContext context, String message) async {
  final l10n = context.l10n;
  return await showDialog<bool>(
        context: context,
        builder: (ctx) => AlertDialog(
          title: Text(l10n.suggestTitle),
          content: Text(message),
          actions: [
            TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.actionNotNow)),
            FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.actionYes)),
          ],
        ),
      ) ??
      false;
}

/// Smart suggestions after adding a relative (always require confirmation).
Future<void> _offerFollowUps(
  BuildContext context,
  WidgetRef ref, {
  required Person anchor,
  required RelationTemplate template,
  required String targetId,
  required String targetName,
}) async {
  final repo = ref.read(graphRepositoryProvider);
  final graph = await repo.loadGraph();
  final people = await ref.read(peopleByIdProvider.future);
  if (!context.mounted) return;
  final l10n = context.l10n;
  String name(String id) => people[id]?.fullName ?? '';
  Gender gender(String id) => graph.person(id)?.gender ?? Gender.unknown;

  Future<void> tryLink(String parentId, String childId) async {
    final violations = GraphValidator.parentEdge(graph, parentId: parentId, childId: childId);
    if (violations.any((v) => v.blocks)) return;
    await repo.addParentEdge(parentId: parentId, childId: childId, validated: true);
  }

  switch (template.key) {
    // Added a child: is my partner the other parent?
    case 'S' || 'D':
      final partners = graph.spousesOf(anchor.id);
      final existingParents = graph.parentsOf(targetId);
      if (partners.length == 1 && !existingParents.contains(partners.single)) {
        final partner = partners.single;
        final slotTaken = existingParents.any((p) => p != anchor.id && gender(p) == gender(partner));
        if (!slotTaken && await _confirm(context, l10n.suggestAlsoParent(name(partner), targetName))) {
          await tryLink(partner, targetId);
        }
      }
    // Added a parent: is this also my siblings' parent?
    case 'F' || 'M':
      final siblings = graph
          .siblingsOf(anchor.id)
          .where((s) => !graph.parentsOf(s).any((p) => gender(p) == gender(targetId)))
          .toList();
      if (siblings.isNotEmpty &&
          await _confirm(context, l10n.suggestParentOfSiblings(targetName, siblings.map(name).join(', ')))) {
        for (final s in siblings) {
          await tryLink(targetId, s);
        }
      }
    // Added a partner: are they the parent of my children?
    case 'H' || 'W':
      final children = graph
          .childrenOf(anchor.id)
          .where((c) => !graph.parentsOf(c).any((p) => p != anchor.id && gender(p) == gender(targetId)))
          .toList();
      if (children.isNotEmpty &&
          await _confirm(context, l10n.suggestParentOfSiblings(targetName, children.map(name).join(', ')))) {
        for (final c in children) {
          await tryLink(targetId, c);
        }
      }
  }
}

/// Grid of direct relations plus a searchable list of compound ones.
class _RelationPicker extends StatefulWidget {
  const _RelationPicker({required this.anchorName});

  final String anchorName;

  @override
  State<_RelationPicker> createState() => _RelationPickerState();
}

class _RelationPickerState extends State<_RelationPicker> {
  String _q = '';

  bool _matches(RelationTemplate t) {
    if (_q.isEmpty) return true;
    final q = _q.toLowerCase();
    final term = t.term;
    return term.en.toLowerCase().contains(q) || term.hi.contains(q) || (term.roman?.toLowerCase().contains(q) ?? false);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final direct = relationTemplates.where((t) => t.isDirect).toList();
    final compound = relationTemplates.where((t) => !t.isDirect && _matches(t)).toList();

    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.8,
      maxChildSize: 0.95,
      builder: (context, scroll) => ListView(
        controller: scroll,
        padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.xl),
        children: [
          Text(l10n.addRelativeTitle(widget.anchorName), style: theme.textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              for (final t in direct)
                ActionChip(
                  avatar: Icon(_iconFor(t), size: 18),
                  label: Text(context.termLabel(t.term)),
                  onPressed: () => Navigator.pop(context, t),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(l10n.moreRelations, style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.xs),
          TextField(
            decoration: InputDecoration(hintText: l10n.searchRelationsHint, prefixIcon: const Icon(Icons.search)),
            onChanged: (v) => setState(() => _q = v.trim()),
          ),
          for (final group in RelationGroup.values.where((g) => g != RelationGroup.direct)) ...[
            if (compound.any((t) => t.group == group)) ...[
              Padding(
                padding: const EdgeInsets.only(top: AppSpacing.md, bottom: AppSpacing.xxs),
                child: Text(
                  context.relationGroupLabel(group),
                  style: theme.textTheme.labelLarge?.copyWith(color: theme.colorScheme.primary),
                ),
              ),
              for (final t in compound.where((t) => t.group == group))
                ListTile(
                  dense: true,
                  contentPadding: EdgeInsets.zero,
                  leading: CircleAvatar(
                    radius: 6,
                    backgroundColor: context.relationColors.of(sideForKey(t.key)).foreground,
                  ),
                  title: Text(context.termLabel(t.term)),
                  subtitle: Text(context.isHindi ? (t.term.roman ?? t.term.en) : t.term.en),
                  onTap: () => Navigator.pop(context, t),
                ),
            ],
          ],
        ],
      ),
    );
  }

  static IconData _iconFor(RelationTemplate t) => switch (t.key) {
    'F' || 'M' => Icons.elderly_outlined,
    'H' || 'W' => Icons.favorite_border,
    'S' || 'D' => Icons.child_care_outlined,
    _ => Icons.people_outline,
  };
}
