import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/person_avatar.dart';
import '../../../shared/widgets/section_card.dart';
import '../../people/domain/person.dart';
import '../../people/presentation/people_providers.dart';
import '../../relationships/presentation/relationship_providers.dart';

/// Family tab hub: tree, relationship finder and family clusters.
class FamilyScreen extends ConsumerWidget {
  const FamilyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final graph = ref.watch(familyGraphProvider).value;
    final people = ref.watch(peopleByIdProvider).value ?? const <String, Person>{};
    final selfId = ref.watch(selfPersonProvider).value?.id;
    final clusters = graph?.familyClusters() ?? const <Set<String>>[];

    Widget action(IconData icon, String title, String body, VoidCallback onTap) => Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.xs),
        leading: CircleAvatar(
          backgroundColor: theme.colorScheme.primary.withValues(alpha: 0.12),
          child: Icon(icon, color: theme.colorScheme.primary),
        ),
        title: Text(title, style: theme.textTheme.titleMedium),
        subtitle: Text(body),
        trailing: const Icon(Icons.chevron_right),
        onTap: onTap,
      ),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navFamily)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          action(
            Icons.account_tree_outlined,
            l10n.familyTreeTitle,
            l10n.familyHubTreeBody,
            () => context.push(Routes.tree()),
          ),
          const SizedBox(height: AppSpacing.sm),
          action(
            Icons.route_outlined,
            l10n.relationFinderTitle,
            l10n.familyHubFinderBody,
            () => context.push(Routes.finder()),
          ),
          const SizedBox(height: AppSpacing.lg),
          if (clusters.isNotEmpty)
            SectionCard(
              title: l10n.familyClustersTitle,
              child: Column(
                children: [
                  for (final c in clusters.take(30)) _ClusterTile(cluster: c, people: people, selfId: selfId),
                ],
              ),
            ),
        ],
      ),
    );
  }
}

class _ClusterTile extends StatelessWidget {
  const _ClusterTile({required this.cluster, required this.people, required this.selfId});

  final Set<String> cluster;
  final Map<String, Person> people;
  final String? selfId;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final members = cluster.map((id) => people[id]).whereType<Person>().where((p) => !p.isPlaceholder).toList();
    if (members.isEmpty) return const SizedBox.shrink();
    // Name the cluster after you if you are in it, else its most common surname/oldest member.
    final anchor = members.firstWhere((p) => p.id == selfId, orElse: () => members.first);
    final title = anchor.id == selfId ? l10n.familyClusterYours : l10n.familyClusterOf(anchor.fullName);
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: SizedBox(
        width: 56,
        child: Stack(
          children: [
            for (final (i, p) in members.take(3).indexed)
              Positioned(
                left: i * 14.0,
                child: PersonAvatar(personId: p.id, name: p.fullName, radius: 16),
              ),
          ],
        ),
      ),
      title: Text(title),
      subtitle: Text(l10n.peopleCount(members.length)),
      trailing: const Icon(Icons.chevron_right),
      onTap: () => context.push(Routes.tree(focus: anchor.id)),
    );
  }
}
