import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../network/presentation/network_providers.dart';
import '../../../relationships/presentation/relation_text.dart';
import '../../../relationships/presentation/relationship_providers.dart';
import '../../domain/person.dart';
import '../people_providers.dart';
import '../widgets/person_tile.dart';

/// Active People-tab filter: a fixed filter or a tag id.
class PeopleFilter extends Notifier<String?> {
  @override
  String? build() => null;

  void set(String? value) => state = state == value ? null : value;
}

final peopleFilterProvider = NotifierProvider<PeopleFilter, String?>(PeopleFilter.new);

class PeopleScreen extends ConsumerWidget {
  const PeopleScreen({super.key});

  static const _favorites = ':favorites';
  static const _family = ':family';
  static const _notMet = ':notmet';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final query = ref.watch(peopleQueryProvider);
    final filter = ref.watch(peopleFilterProvider);
    final people = ref.watch(peopleListProvider);
    final tags = ref.watch(tagsProvider).value ?? const [];
    final assignments = ref.watch(tagAssignmentsProvider).value ?? const {};
    final relations = ref.watch(relationsToMeProvider).value ?? const {};
    final lastMet = ref.watch(lastMetProvider).value ?? const {};

    bool keep(Person p) {
      final cutoff = DateTime.now().subtract(const Duration(days: 90));
      return switch (filter) {
        null => !p.isPlaceholder || query.isNotEmpty,
        _favorites => p.isFavorite,
        // Connected to you through family edges only (blood or marriage).
        _family => relations[p.id]?.path.steps.every((s) => s.socialType == null) ?? false,
        _notMet => lastMet[p.id]?.isBefore(cutoff) ?? false,
        final tagId => assignments[p.id]?.contains(tagId) ?? false,
      };
    }

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navPeople)),
      floatingActionButton: FloatingActionButton(
        tooltip: l10n.quickAddTitle,
        onPressed: () => context.push(Routes.addPerson),
        child: const Icon(Icons.person_add_alt_1),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.xs),
            child: SearchBar(
              hintText: l10n.peopleSearchHint,
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
              onChanged: ref.read(peopleQueryProvider.notifier).set,
            ),
          ),
          SizedBox(
            height: 44,
            child: ListView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
              children: [
                for (final (id, label) in [
                  (_favorites, l10n.filterFavorites),
                  (_family, l10n.filterFamily),
                  (_notMet, l10n.filterNotMet),
                  for (final t in tags) (t.id, context.isHindi ? (t.nameAlt ?? t.name) : t.name),
                ])
                  Padding(
                    padding: const EdgeInsets.only(right: AppSpacing.xs),
                    child: FilterChip(
                      label: Text(label),
                      selected: filter == id,
                      onSelected: (_) => ref.read(peopleFilterProvider.notifier).set(id),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: people.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('$e')),
              data: (all) {
                final list = all.where(keep).toList();
                if (list.isEmpty) {
                  return query.isEmpty && filter == null
                      ? EmptyState(
                          icon: Icons.people_outline,
                          title: l10n.peopleEmptyTitle,
                          message: l10n.peopleEmptyBody,
                          actionLabel: l10n.quickAddTitle,
                          onAction: () => context.push(Routes.addPerson),
                        )
                      : EmptyState(icon: Icons.search_off, title: l10n.peopleNoResults(query));
                }
                return ListView.builder(
                  padding: const EdgeInsets.only(bottom: 88),
                  itemCount: list.length,
                  itemBuilder: (context, i) => PersonTile(
                    person: list[i],
                    onTap: () => context.push(Routes.person(list[i].id)),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
