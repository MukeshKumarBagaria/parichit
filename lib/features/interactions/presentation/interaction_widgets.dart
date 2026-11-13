import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/formatters.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../network/presentation/network_providers.dart';
import '../../people/domain/person.dart';
import '../../places/presentation/places_providers.dart';
import '../../relationships/presentation/relationship_providers.dart';
import '../../reminders/domain/upcoming.dart';
import '../domain/interaction.dart';

IconData interactionIcon(String type) => switch (type) {
  'phone_call' => Icons.call_outlined,
  'video_call' => Icons.videocam_outlined,
  'message' => Icons.chat_bubble_outline,
  'event' => Icons.celebration_outlined,
  'visit' => Icons.home_outlined,
  'in_person' => Icons.handshake_outlined,
  _ => Icons.event_note_outlined,
};

extension InteractionTypeLabel on BuildContext {
  String interactionTypeLabel(String type) {
    final l = l10n;
    return switch (type) {
      'in_person' => l.meetingTypeInPerson,
      'visit' => l.meetingTypeVisit,
      'phone_call' => l.meetingTypePhone,
      'video_call' => l.meetingTypeVideo,
      'message' => l.meetingTypeMessage,
      'event' => l.meetingTypeEvent,
      _ => l.meetingTypeOther,
    };
  }
}

/// One meeting in a timeline.
class InteractionTile extends ConsumerWidget {
  const InteractionTile({required this.interaction, super.key});

  final Interaction interaction;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final people = ref.watch(peopleByIdProvider).value ?? const <String, Person>{};
    final place = interaction.placeId == null ? null : ref.watch(placeByIdProvider(interaction.placeId!));
    final names = interaction.participantIds.map((id) => people[id]?.fullName).whereType<String>().toList();
    final title =
        interaction.title ?? (names.isEmpty ? context.interactionTypeLabel(interaction.type) : names.join(', '));
    final where = place?.name ?? interaction.locationText;
    final meta = [context.formatDateTime(interaction.occurredAt), ?where].join(' · ');

    return ListTile(
      leading: CircleAvatar(
        backgroundColor: theme.colorScheme.secondary.withValues(alpha: 0.15),
        child: Icon(interactionIcon(interaction.type), color: theme.colorScheme.secondary),
      ),
      title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (interaction.title != null && names.isNotEmpty)
            Text(names.join(', '), maxLines: 1, overflow: TextOverflow.ellipsis),
          Text(meta, style: theme.textTheme.bodySmall),
          if (interaction.notes != null)
            Text(interaction.notes!, maxLines: 2, overflow: TextOverflow.ellipsis, style: theme.textTheme.bodySmall),
        ],
      ),
      onTap: () => context.push(Routes.meeting(interaction.id)),
    );
  }
}

/// One agenda entry: birthday, anniversary, barsi or follow-up.
class UpcomingTile extends ConsumerWidget {
  const UpcomingTile({required this.item, this.onDone, super.key});

  final UpcomingItem item;
  final VoidCallback? onDone;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final people = ref.watch(peopleByIdProvider).value ?? const <String, Person>{};
    final names = item.personIds.map((id) => people[id]?.fullName).whereType<String>().join(' & ');
    final (icon, label) = switch (item.kind) {
      UpcomingKind.birthday => (Icons.cake_outlined, l10n.upcomingBirthday(names, item.years ?? 0)),
      UpcomingKind.anniversary => (Icons.favorite_outline, l10n.upcomingAnniversary(names, item.years ?? 0)),
      UpcomingKind.deathAnniversary => (Icons.local_florist_outlined, l10n.upcomingBarsi(names)),
      UpcomingKind.reminder => (Icons.notifications_none, item.title ?? ''),
    };
    final color = item.overdue ? theme.colorScheme.error : theme.colorScheme.primary;
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: color),
      title: Text(label),
      subtitle: Text(
        [context.relativeDay(item.date), if (item.kind == UpcomingKind.reminder && names.isNotEmpty) names].join(' · '),
        style: theme.textTheme.bodySmall?.copyWith(color: item.overdue ? theme.colorScheme.error : null),
      ),
      trailing: onDone == null
          ? null
          : IconButton(tooltip: l10n.actionDone, icon: const Icon(Icons.check_circle_outline), onPressed: onDone),
      onTap: item.personIds.isEmpty ? null : () => context.push(Routes.person(item.personIds.first)),
    );
  }
}

/// Agenda list for the next [days] days (manual reminders can be ticked off).
class AgendaList extends ConsumerWidget {
  const AgendaList({required this.days, this.limit, super.key});

  final int days;
  final int? limit;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(agendaProvider(days));
    final shown = limit == null ? items : items.take(limit!).toList();
    if (shown.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: AppSpacing.xs),
        child: Text(context.l10n.upcomingNothing, style: Theme.of(context).textTheme.bodyMedium),
      );
    }
    return Column(
      children: [
        for (final item in shown)
          UpcomingTile(
            item: item,
            onDone: item.reminderId == null
                ? null
                : () => ref.read(remindersRepositoryProvider).complete(item.reminderId!),
          ),
      ],
    );
  }
}
