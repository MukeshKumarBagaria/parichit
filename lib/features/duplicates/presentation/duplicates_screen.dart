import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/di/core_providers.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/person_avatar.dart';
import '../../people/domain/person.dart';
import '../../people/presentation/people_providers.dart';
import '../../relationships/presentation/relationship_providers.dart';
import '../data/merge_repository.dart';

final mergeRepositoryProvider = Provider<MergeRepository>(
  (ref) => MergeRepository(
    db: ref.watch(appDatabaseProvider),
    outbox: ref.watch(outboxWriterProvider),
    ids: ref.watch(idGeneratorProvider),
    people: ref.watch(peopleRepositoryProvider),
    clock: ref.watch(clockProvider),
  ),
);

final duplicatePairsProvider = FutureProvider.autoDispose<List<DuplicatePair>>(
  (ref) => ref.watch(mergeRepositoryProvider).scan(),
);

/// Suggested duplicate pairs with "merge" / "not the same" actions.
class DuplicatesScreen extends ConsumerWidget {
  const DuplicatesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final people = ref.watch(peopleByIdProvider).value ?? const <String, Person>{};
    return Scaffold(
      appBar: AppBar(title: Text(l10n.duplicatesTitle)),
      body: ref
          .watch(duplicatePairsProvider)
          .when(
            loading: () => const Center(child: CircularProgressIndicator()),
            error: (e, _) => Center(child: Text('$e')),
            data: (pairs) {
              final visible = pairs.where((p) => people.containsKey(p.aId) && people.containsKey(p.bId)).toList();
              if (visible.isEmpty) {
                return EmptyState(icon: Icons.verified_outlined, title: l10n.duplicatesNone);
              }
              return ListView.separated(
                padding: const EdgeInsets.all(AppSpacing.md),
                itemCount: visible.length,
                separatorBuilder: (_, _) => const SizedBox(height: AppSpacing.sm),
                itemBuilder: (context, i) {
                  final pair = visible[i];
                  return _PairCard(a: people[pair.aId]!, b: people[pair.bId]!);
                },
              );
            },
          ),
    );
  }
}

class _PairCard extends ConsumerWidget {
  const _PairCard({required this.a, required this.b});

  final Person a;
  final Person b;

  Future<void> _merge(BuildContext context, WidgetRef ref) async {
    final l10n = context.l10n;
    // Choose which record to keep (its values win; gaps are filled).
    final survivor = await showDialog<Person>(
      context: context,
      builder: (ctx) => SimpleDialog(
        title: Text(l10n.mergeKeepWhich),
        children: [
          for (final p in [a, b])
            SimpleDialogOption(
              onPressed: () => Navigator.pop(ctx, p),
              child: ListTile(
                leading: PersonAvatar(personId: p.id, name: p.fullName),
                title: Text(p.fullName),
                subtitle: Text([?p.fullNameAlt, ?p.primaryPhone].join(' · ')),
              ),
            ),
        ],
      ),
    );
    if (survivor == null) return;
    final other = survivor.id == a.id ? b : a;
    await ref.read(mergeRepositoryProvider).merge(survivorId: survivor.id, mergedId: other.id);
    ref.invalidate(duplicatePairsProvider);
    if (context.mounted) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(l10n.mergeDone(other.fullName, survivor.fullName))));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    Widget side(Person p) => Expanded(
      child: InkWell(
        onTap: () => context.push('/people/${p.id}'),
        child: Column(
          children: [
            PersonAvatar(personId: p.id, name: p.fullName, radius: 24),
            const SizedBox(height: AppSpacing.xs),
            Text(p.fullName, textAlign: TextAlign.center, maxLines: 2),
            if (p.fullNameAlt != null) Text(p.fullNameAlt!, textAlign: TextAlign.center),
            if (p.primaryPhone != null) Text(p.primaryPhone!, style: Theme.of(context).textTheme.bodySmall),
          ],
        ),
      ),
    );
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(AppSpacing.md),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [side(a), const Icon(Icons.compare_arrows), side(b)],
            ),
            const SizedBox(height: AppSpacing.sm),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () async {
                    await ref.read(mergeRepositoryProvider).ignore(a.id, b.id);
                    ref.invalidate(duplicatePairsProvider);
                  },
                  child: Text(l10n.duplicatesNotSame),
                ),
                const SizedBox(width: AppSpacing.xs),
                FilledButton(onPressed: () => _merge(context, ref), child: Text(l10n.mergeAction)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
