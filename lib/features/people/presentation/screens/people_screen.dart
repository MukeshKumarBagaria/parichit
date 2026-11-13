import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../people_providers.dart';
import '../widgets/person_tile.dart';

class PeopleScreen extends ConsumerWidget {
  const PeopleScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final query = ref.watch(peopleQueryProvider);
    final people = ref.watch(peopleListProvider);

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
          Expanded(
            child: people.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('$e')),
              data: (list) {
                if (list.isEmpty) {
                  return query.isEmpty
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
