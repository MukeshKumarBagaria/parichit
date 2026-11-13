import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/formatters.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/section_card.dart';
import '../../interactions/presentation/interaction_widgets.dart';
import '../../network/presentation/network_providers.dart';
import '../../people/presentation/people_providers.dart';
import '../../people/presentation/widgets/person_tile.dart';
import '../../sync/presentation/sync_pill.dart';

/// Home dashboard (blueprint §10, screen 1): calm, not overloaded with stats.
class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final self = ref.watch(selfPersonProvider).value;
    final count = ref.watch(peopleCountProvider).value ?? 0;
    final recent = ref.watch(recentPeopleProvider).value ?? const [];
    final agenda = ref.watch(agendaProvider(7));
    final reconnect = ref.watch(reconnectProvider(90));

    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push(Routes.addPerson),
        icon: const Icon(Icons.person_add_alt_1),
        label: Text(l10n.homeQuickAdd),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.lg, AppSpacing.md, 96),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    l10n.homeGreeting(self?.fullName.split(' ').first ?? ''),
                    style: theme.textTheme.headlineSmall,
                  ),
                ),
                const SyncPill(),
              ],
            ),
            const SizedBox(height: AppSpacing.xxs),
            Text(
              l10n.homePeopleCount(count),
              style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
            const SizedBox(height: AppSpacing.md),
            SearchBar(
              hintText: l10n.homeSearchHint,
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
              onTap: () => context.go(Routes.people),
            ),
            const SizedBox(height: AppSpacing.lg),
            const _QuickActions(),
            const SizedBox(height: AppSpacing.lg),
            if (agenda.isNotEmpty) ...[
              SectionCard(
                title: l10n.homeToday,
                trailing: TextButton(onPressed: () => context.go(Routes.meetings), child: Text(l10n.actionSeeAll)),
                child: const AgendaList(days: 7, limit: 5),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
            if (reconnect.isNotEmpty) ...[
              SectionCard(
                title: l10n.homeReconnect,
                child: Column(
                  children: [
                    for (final (p, last) in reconnect.take(3))
                      PersonTile(
                        person: p,
                        trailing: Text(context.formatDate(last), style: theme.textTheme.bodySmall),
                        onTap: () => context.push(Routes.person(p.id)),
                      ),
                  ],
                ),
              ),
              const SizedBox(height: AppSpacing.md),
            ],
            if (recent.isEmpty)
              EmptyState(icon: Icons.diversity_3_outlined, title: l10n.homeEmptyTitle, message: l10n.homeEmptyBody)
            else
              SectionCard(
                title: l10n.homeRecentlyAdded,
                child: Column(
                  children: [
                    for (final p in recent) PersonTile(person: p, onTap: () => context.push(Routes.person(p.id))),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _QuickActions extends StatelessWidget {
  const _QuickActions();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final actions = [
      (Icons.person_add_alt_1_outlined, l10n.homeQuickAdd, () => context.push(Routes.addPerson)),
      (Icons.event_note_outlined, l10n.homeLogMeeting, () => context.push(Routes.logMeeting())),
      (Icons.route_outlined, l10n.homeFindRelation, () => context.push(Routes.finder())),
      (Icons.account_tree_outlined, l10n.homeFamilyTree, () => context.push(Routes.tree())),
    ];
    return GridView.count(
      crossAxisCount: 2,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      mainAxisSpacing: AppSpacing.sm,
      crossAxisSpacing: AppSpacing.sm,
      childAspectRatio: 2.6,
      children: [
        for (final (icon, label, onTap) in actions)
          Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: onTap,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm),
                child: Row(
                  children: [
                    Icon(icon, color: Theme.of(context).colorScheme.primary),
                    const SizedBox(width: AppSpacing.xs),
                    Expanded(child: Text(label, maxLines: 2, overflow: TextOverflow.ellipsis)),
                  ],
                ),
              ),
            ),
          ),
      ],
    );
  }
}
