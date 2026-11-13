import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../core/l10n/formatters.dart';
import '../../../../core/l10n/l10n.dart';
import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../shared/widgets/empty_state.dart';
import '../../../../shared/widgets/person_avatar.dart';
import '../../../../shared/widgets/section_card.dart';
import '../../../interactions/presentation/interaction_widgets.dart';
import '../../../network/presentation/network_providers.dart';
import '../../../places/presentation/places_providers.dart';
import '../../../relationships/presentation/relation_text.dart';
import '../../../relationships/presentation/relationship_providers.dart';
import '../../../relationships/presentation/widgets/family_section.dart';
import '../../../relationships/presentation/widgets/relation_to_me_chip.dart';
import '../../../reminders/presentation/add_reminder_dialog.dart';
import '../../../tags/presentation/tag_editor_sheet.dart';
import '../../domain/person.dart';
import '../people_providers.dart';

/// Person profile (blueprint §10, screen 3).
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
    return ref
        .watch(personProvider(personId))
        .when(
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
                  IconButton(
                    tooltip: l10n.fieldFavorite,
                    icon: Icon(p.isFavorite ? Icons.star : Icons.star_border),
                    onPressed: () => ref.read(peopleRepositoryProvider).setFavorite(p.id, favorite: !p.isFavorite),
                  ),
                  IconButton(
                    tooltip: l10n.editPersonTitle,
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => context.push(Routes.editPerson(p.id)),
                  ),
                  PopupMenuButton<String>(
                    onSelected: (v) => switch (v) {
                      'finder' => context.push(Routes.finder(b: p.id)),
                      'reminder' => showAddReminderDialog(context, ref, personId: p.id),
                      'delete' => _delete(context, ref, p),
                      _ => null,
                    },
                    itemBuilder: (_) => [
                      PopupMenuItem(value: 'finder', child: Text(l10n.relationFinderTitle)),
                      PopupMenuItem(value: 'reminder', child: Text(l10n.reminderAdd)),
                      if (!p.isSelf) PopupMenuItem(value: 'delete', child: Text(l10n.actionDelete)),
                    ],
                  ),
                ],
              ),
              body: ListView(
                padding: const EdgeInsets.fromLTRB(AppSpacing.md, 0, AppSpacing.md, AppSpacing.xl),
                children: [
                  _Header(person: p),
                  const SizedBox(height: AppSpacing.md),
                  _QuickActions(person: p),
                  const SizedBox(height: AppSpacing.lg),
                  FamilySection(person: p),
                  const SizedBox(height: AppSpacing.md),
                  _MeetingsCard(person: p),
                  const SizedBox(height: AppSpacing.md),
                  _AboutCard(person: p),
                  const SizedBox(height: AppSpacing.md),
                  NetworkSection(person: p),
                  const SizedBox(height: AppSpacing.md),
                  _TagsCard(person: p),
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

class _Header extends ConsumerWidget {
  const _Header({required this.person});

  final Person person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final l10n = context.l10n;
    final place = person.nativePlaceId == null ? null : ref.watch(placeByIdProvider(person.nativePlaceId!));
    final info = ref.watch(relationToMeProvider(person.id));
    final subtitle = [?person.occupation, ?place?.name].join(' · ');

    return Column(
      children: [
        Hero(
          tag: 'avatar-${person.id}',
          child: PersonAvatar(
            personId: person.id,
            name: person.fullName,
            radius: 44,
            isPlaceholder: person.isPlaceholder,
            isDeceased: person.isDeceased,
          ),
        ),
        const SizedBox(height: AppSpacing.sm),
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
        if (person.nickname != null) Text('“${person.nickname}”', style: theme.textTheme.bodyMedium),
        const SizedBox(height: AppSpacing.xs),
        RelationToMeChip(
          personId: person.id,
          isSelf: person.isSelf,
          onTap: () => context.push(Routes.finder(b: person.id)),
        ),
        if (info != null && (!info.name.isNamed || info.name.roman != null))
          Padding(
            padding: const EdgeInsets.only(top: AppSpacing.xxs),
            child: Text(context.relationDetail(info.name), style: theme.textTheme.bodySmall),
          ),
        if (subtitle.isNotEmpty) ...[
          const SizedBox(height: AppSpacing.xxs),
          Text(subtitle, style: theme.textTheme.bodyMedium),
        ],
        if (person.isPlaceholder) ...[
          const SizedBox(height: AppSpacing.sm),
          FilledButton.tonalIcon(
            onPressed: () => context.push(Routes.editPerson(person.id)),
            icon: const Icon(Icons.edit_note),
            label: Text(l10n.placeholderBadge),
          ),
        ],
      ],
    );
  }
}

class _QuickActions extends ConsumerWidget {
  const _QuickActions({required this.person});

  final Person person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final phone = person.primaryPhone;
    final contacts = ref.watch(contactsProvider(person.id)).value ?? const [];
    final whatsapp = contacts.where((c) => c.kind == 'phone' && c.isWhatsapp).firstOrNull?.value ?? phone;

    Widget action(IconData icon, String label, VoidCallback? onTap) => Expanded(
      child: Column(
        children: [
          IconButton.filledTonal(onPressed: onTap, icon: Icon(icon)),
          Text(label, style: Theme.of(context).textTheme.labelSmall, textAlign: TextAlign.center),
        ],
      ),
    );

    return Row(
      children: [
        action(Icons.call_outlined, l10n.actionCall, phone == null ? null : () => launchUrl(Uri.parse('tel:$phone'))),
        action(
          Icons.chat_outlined,
          l10n.actionWhatsApp,
          whatsapp == null
              ? null
              : () => launchUrl(
                  Uri.parse('https://wa.me/${whatsapp.replaceAll(RegExp(r'\D'), '')}'),
                  mode: LaunchMode.externalApplication,
                ),
        ),
        action(Icons.event_note_outlined, l10n.actionMeet, () => context.push(Routes.logMeeting(personId: person.id))),
        action(Icons.account_tree_outlined, l10n.familyTreeTitle, () => context.push(Routes.tree(focus: person.id))),
      ],
    );
  }
}

class _MeetingsCard extends ConsumerWidget {
  const _MeetingsCard({required this.person});

  final Person person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final meetings = ref.watch(personInteractionsProvider(person.id)).value ?? const [];
    return SectionCard(
      title: l10n.personSectionMeetings(meetings.length),
      trailing: TextButton.icon(
        onPressed: () => context.push(Routes.logMeeting(personId: person.id)),
        icon: const Icon(Icons.add, size: 18),
        label: Text(l10n.actionMeet),
      ),
      child: meetings.isEmpty
          ? Text(l10n.personNoMeetings, style: Theme.of(context).textTheme.bodyMedium)
          : Column(children: [for (final m in meetings.take(5)) InteractionTile(interaction: m)]),
    );
  }
}

class _AboutCard extends ConsumerWidget {
  const _AboutCard({required this.person});

  final Person person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final contacts = ref.watch(contactsProvider(person.id)).value ?? const [];
    final place = person.nativePlaceId == null ? null : ref.watch(placeByIdProvider(person.nativePlaceId!));
    final now = DateTime.now();

    final rows = <(IconData, String, String)>[
      for (final c in contacts)
        (
          c.kind == 'email' ? Icons.email_outlined : Icons.phone_outlined,
          c.kind == 'email' ? l10n.fieldEmail : l10n.fieldPhone,
          c.value + (c.isWhatsapp ? ' · WhatsApp' : ''),
        ),
      if (person.birthDate case final b?)
        (
          Icons.cake_outlined,
          l10n.fieldBirthDate,
          '${context.formatPartialDate(b)}${person.isDeceased ? '' : ' · ${l10n.ageYears(b.ageOn(now))}'}',
        ),
      if (person.deathDate case final d?)
        (Icons.local_florist_outlined, l10n.fieldDeathDate, context.formatPartialDate(d)),
      if (place != null) (Icons.home_work_outlined, l10n.fieldNativePlace, place.displayName),
      if (person.gotra case final g?) (Icons.account_balance_outlined, l10n.fieldGotra, g),
      if ([?person.designation, ?person.organization].join(', ') case final w when w.isNotEmpty)
        (Icons.work_outline, l10n.fieldOrganization, w),
      if (person.education case final e?) (Icons.school_outlined, l10n.fieldEducation, e),
    ];
    if (rows.isEmpty) return const SizedBox.shrink();
    return SectionCard(
      title: l10n.personSectionAbout,
      child: Column(
        children: [
          for (final (icon, label, value) in rows)
            ListTile(
              contentPadding: EdgeInsets.zero,
              dense: true,
              leading: Icon(icon),
              title: Text(value),
              subtitle: Text(label),
            ),
        ],
      ),
    );
  }
}

class _TagsCard extends ConsumerWidget {
  const _TagsCard({required this.person});

  final Person person;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final tags = ref.watch(tagsProvider).value ?? const [];
    final assigned = ref.watch(tagAssignmentsProvider).value?[person.id] ?? const <String>{};
    final mine = tags.where((t) => assigned.contains(t.id)).toList();
    return SectionCard(
      title: l10n.tagsTitle,
      trailing: IconButton(
        tooltip: l10n.tagsEdit,
        icon: const Icon(Icons.edit_outlined, size: 20),
        onPressed: () => showTagEditor(context, ref, person.id),
      ),
      child: mine.isEmpty
          ? Text(l10n.tagsNone, style: Theme.of(context).textTheme.bodyMedium)
          : Wrap(
              spacing: AppSpacing.xs,
              runSpacing: AppSpacing.xs,
              children: [for (final t in mine) Chip(label: Text(context.isHindi ? (t.nameAlt ?? t.name) : t.name))],
            ),
    );
  }
}
