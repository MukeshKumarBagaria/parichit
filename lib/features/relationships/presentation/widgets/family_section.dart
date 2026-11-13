import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kinship/kinship.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../shared/widgets/person_avatar.dart';
import '../../../../shared/widgets/relation_chip.dart';
import '../../../../shared/widgets/section_card.dart';
import '../../../people/domain/person.dart';
import '../../data/graph_repository.dart';
import '../add_relative_flow.dart';
import '../person_picker_sheet.dart';
import '../relation_text.dart';
import '../relationship_providers.dart';

/// Family card on a profile: immediate family grouped by role, plus an
/// expandable extended family (blueprint §10, screen 3).
class FamilySection extends ConsumerWidget {
  const FamilySection({required this.person, super.key});

  final Person person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final family = ref.watch(immediateFamilyProvider(person.id));
    final extended = ref.watch(extendedFamilyProvider(person.id));

    return SectionCard(
      title: l10n.personSectionFamily,
      trailing: TextButton.icon(
        onPressed: () => showAddRelativeFlow(context, ref, person),
        icon: const Icon(Icons.add, size: 18),
        label: Text(l10n.addRelative),
      ),
      child: family == null || family.isEmpty
          ? Text(l10n.familyEmpty, style: Theme.of(context).textTheme.bodyMedium)
          : Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _Group(label: l10n.familyParents, anchorId: person.id, ids: family.parents),
                _Group(label: l10n.familySpouse, anchorId: person.id, ids: family.partners),
                _Group(label: l10n.familyFormerSpouse, anchorId: person.id, ids: family.formerPartners),
                _Group(label: l10n.familySiblings, anchorId: person.id, ids: family.siblings),
                _Group(label: l10n.familyChildren, anchorId: person.id, ids: family.children),
                if (extended.isNotEmpty) _Extended(anchorId: person.id, relatives: extended),
              ],
            ),
    );
  }
}

class _Group extends StatelessWidget {
  const _Group({required this.label, required this.anchorId, required this.ids});

  final String label;
  final String anchorId;
  final List<String> ids;

  @override
  Widget build(BuildContext context) {
    if (ids.isEmpty) return const SizedBox.shrink();
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(top: AppSpacing.xs),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: theme.textTheme.labelMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
          for (final id in ids) RelativeRow(anchorId: anchorId, personId: id),
        ],
      ),
    );
  }
}

/// One relative: avatar, name, and how they relate to the profile's person.
class RelativeRow extends ConsumerWidget {
  const RelativeRow({required this.anchorId, required this.personId, super.key});

  final String anchorId;
  final String personId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final person = ref.watch(peopleByIdProvider).value?[personId];
    if (person == null) return const SizedBox.shrink();
    final relation = ref.watch(relationBetweenProvider((from: anchorId, to: personId)));
    final l10n = context.l10n;

    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      leading: PersonAvatar(
        personId: person.id,
        name: person.fullName,
        radius: 18,
        isPlaceholder: person.isPlaceholder,
        isDeceased: person.isDeceased,
      ),
      title: Text(person.isDeceased ? '${l10n.personLatePrefix} ${person.fullName}' : person.fullName),
      subtitle: person.isPlaceholder ? Text(l10n.placeholderBadge) : null,
      trailing: relation == null
          ? null
          : RelationChip(label: context.relationLabel(relation.name), side: relation.name.side),
      onTap: () => context.push(Routes.person(person.id)),
      onLongPress: () => _showLinkActions(context, ref, person),
    );
  }

  Future<void> _showLinkActions(BuildContext context, WidgetRef ref, Person other) async {
    final l10n = context.l10n;
    final graph = ref.read(familyGraphProvider).value;
    final isPartner = graph?.spousesOf(anchorId, includeFormer: true).contains(other.id) ?? false;
    final action = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: const Icon(Icons.person_outline),
              title: Text(l10n.openProfile),
              onTap: () => Navigator.pop(ctx, 'open'),
            ),
            if (isPartner)
              ListTile(
                leading: const Icon(Icons.heart_broken_outlined),
                title: Text(l10n.markDivorced),
                onTap: () => Navigator.pop(ctx, 'divorced'),
              ),
            ListTile(
              leading: const Icon(Icons.link_off),
              title: Text(l10n.removeLink),
              onTap: () => Navigator.pop(ctx, 'remove'),
            ),
          ],
        ),
      ),
    );
    if (!context.mounted || action == null) return;
    final repo = ref.read(graphRepositoryProvider);
    switch (action) {
      case 'open':
        await context.push(Routes.person(other.id));
      case 'divorced':
        await repo.setPartnershipStatus(anchorId, other.id, 'divorced');
      case 'remove':
        await repo.removeLink(anchorId, other.id);
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.linkRemoved)));
        }
    }
  }
}

class _Extended extends StatelessWidget {
  const _Extended({required this.anchorId, required this.relatives});

  final String anchorId;
  final List<(String, RelationInfo)> relatives;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final bySide = <RelationSide, List<String>>{};
    for (final (id, info) in relatives) {
      (bySide[info.name.side] ??= []).add(id);
    }
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.zero,
        childrenPadding: EdgeInsets.zero,
        title: Text(l10n.familyExtended(relatives.length)),
        children: [
          for (final side in RelationSide.values)
            if (bySide[side] case final ids?) _Group(label: _sideLabel(context, side), anchorId: anchorId, ids: ids),
        ],
      ),
    );
  }

  static String _sideLabel(BuildContext context, RelationSide side) {
    final l = context.l10n;
    return switch (side) {
      RelationSide.direct => l.relationGroupDirect,
      RelationSide.paternal => l.relationGroupPaternal,
      RelationSide.maternal => l.relationGroupMaternal,
      RelationSide.inLaws => l.relationGroupInLaws,
      RelationSide.social => l.networkTitle,
    };
  }
}

/// Friends, colleagues and other non-family ties of a person.
class NetworkSection extends ConsumerWidget {
  const NetworkSection({required this.person, super.key});

  final Person person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final ties = ref.watch(socialTiesProvider(person.id));
    final people = ref.watch(peopleByIdProvider).value ?? const {};
    return SectionCard(
      title: l10n.networkTitle,
      trailing: TextButton.icon(
        onPressed: () => _addConnection(context, ref),
        icon: const Icon(Icons.add, size: 18),
        label: Text(l10n.addConnection),
      ),
      child: ties.isEmpty
          ? Text(l10n.networkEmpty, style: Theme.of(context).textTheme.bodyMedium)
          : Column(
              children: [
                for (final (id, type) in ties)
                  if (people[id] case final other?)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                      leading: PersonAvatar(personId: other.id, name: other.fullName, radius: 18),
                      title: Text(other.fullName),
                      trailing: RelationChip(label: context.connectionTypeLabel(type), side: RelationSide.social),
                      onTap: () => context.push(Routes.person(other.id)),
                      onLongPress: () async {
                        await ref.read(graphRepositoryProvider).removeLink(person.id, other.id);
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.linkRemoved)));
                        }
                      },
                    ),
              ],
            ),
    );
  }

  Future<void> _addConnection(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    final type = await showModalBottomSheet<String>(
      context: context,
      builder: (ctx) => SafeArea(
        child: Wrap(
          spacing: AppSpacing.xs,
          runSpacing: AppSpacing.xs,
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text(l10n.connectionTypeTitle, style: Theme.of(ctx).textTheme.titleMedium),
            ),
            for (final t in connectionTypes)
              Padding(
                padding: const EdgeInsets.only(left: AppSpacing.md),
                child: ActionChip(label: Text(ctx.connectionTypeLabel(t)), onPressed: () => Navigator.pop(ctx, t)),
              ),
            const SizedBox(height: AppSpacing.xl, width: double.infinity),
          ],
        ),
      ),
    );
    if (type == null || !context.mounted) return;
    final picked = await showPersonPicker(
      context,
      title: context.connectionTypeLabel(type),
      excludeIds: {person.id},
    );
    if (picked == null || !context.mounted) return;
    final repo = ref.read(graphRepositoryProvider);
    try {
      final otherId = switch (picked) {
        PickedExisting(:final person) => person.id,
        PickedNew(:final person) => await repo.createPerson(person),
      };
      await repo.addSocialConnection(personId: person.id, otherPersonId: otherId, type: type);
    } on GraphRuleException catch (e) {
      if (context.mounted) await showViolations(context, e.violations, blocking: true);
    }
  }
}
