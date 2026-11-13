import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kinship/kinship.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/person_avatar.dart';
import '../../../../shared/widgets/relation_chip.dart';
import '../../../../shared/widgets/section_card.dart';
import '../../domain/person.dart';
import '../people_providers.dart';

/// Person profile (blueprint §10, screen 3). Family, meetings and photos
/// sections are filled in by later milestones.
class PersonDetailScreen extends ConsumerWidget {
  const PersonDetailScreen({required this.personId, super.key});

  final String personId;

  Future<void> _delete(BuildContext context, WidgetRef ref, Person person) async {
    final repo = ref.read(peopleRepositoryProvider);
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    await repo.softDelete(person.id);
    if (context.mounted) context.pop();
    // Undo instead of a confirmation dialog (blueprint §9).
    messenger.showSnackBar(
      SnackBar(
        content: Text(l10n.personDeleted(person.fullName)),
        action: SnackBarAction(label: l10n.actionUndo, onPressed: () => repo.restore(person.id)),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final person = ref.watch(personProvider(personId));

    return person.when(
      loading: () => const Scaffold(body: Center(child: CircularProgressIndicator())),
      error: (e, _) => Scaffold(
        appBar: AppBar(),
        body: Center(child: Text('$e')),
      ),
      data: (p) {
        if (p == null) {
          return Scaffold(
            appBar: AppBar(),
            body: EmptyState(icon: Icons.person_off_outlined, title: l10n.personNotFound),
          );
        }
        return Scaffold(
          appBar: AppBar(
            actions: [
              if (!p.isSelf)
                IconButton(
                  tooltip: l10n.actionDelete,
                  icon: const Icon(Icons.delete_outline),
                  onPressed: () => _delete(context, ref, p),
                ),
            ],
          ),
          body: ListView(
            padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.xl),
            children: [
              _Header(person: p),
              const SizedBox(height: AppSpacing.lg),
              SectionCard(
                title: l10n.personSectionFamily,
                child: Text(
                  l10n.personFamilyComingSoon,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              if (p.primaryPhone != null) ...[
                const SizedBox(height: AppSpacing.md),
                SectionCard(
                  title: l10n.personSectionContacts,
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: const Icon(Icons.phone_outlined),
                    title: Text(p.primaryPhone!),
                  ),
                ),
              ],
              if (p.notes != null) ...[
                const SizedBox(height: AppSpacing.md),
                SectionCard(title: l10n.personSectionNotes, child: Text(p.notes!)),
              ],
            ],
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header({required this.person});

  final Person person;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    return Column(
      children: [
        Hero(
          tag: 'avatar-${person.id}',
          child: PersonAvatar(
            personId: person.id,
            name: person.fullName,
            radius: 48,
            isPlaceholder: person.isPlaceholder,
            isDeceased: person.isDeceased,
          ),
        ),
        const SizedBox(height: AppSpacing.md),
        Text(
          person.isDeceased ? '${l10n.personLatePrefix} ${person.fullName}' : person.fullName,
          style: theme.textTheme.headlineSmall,
          textAlign: TextAlign.center,
        ),
        if (person.fullNameAlt != null)
          Text(
            person.fullNameAlt!,
            style: theme.textTheme.titleMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
        if (person.isSelf) ...[
          const SizedBox(height: AppSpacing.sm),
          RelationChip(label: l10n.relationYou, side: RelationSide.direct),
        ],
        if (person.occupation != null) ...[
          const SizedBox(height: AppSpacing.xs),
          Text(person.occupation!, style: theme.textTheme.bodyMedium),
        ],
      ],
    );
  }
}
