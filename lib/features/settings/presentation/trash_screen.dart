import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../people/presentation/people_providers.dart';
import '../../people/presentation/widgets/person_tile.dart';

/// Deleted people with restore (everything deleted with them comes back).
class TrashScreen extends ConsumerWidget {
  const TrashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.trashTitle)),
      body: ref
          .watch(deletedPeopleProvider)
          .when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('$e')),
            data: (people) => people.isEmpty
                ? EmptyState(icon: Icons.delete_outline, title: l10n.trashEmpty)
                : ListView(
                    children: [
                      for (final p in people)
                        PersonTile(
                          person: p,
                          trailing: TextButton(
                            onPressed: () => ref.read(peopleRepositoryProvider).restore(p.id),
                            child: Text(l10n.actionRestore),
                          ),
                        ),
                    ],
                  ),
          ),
    );
  }
}
