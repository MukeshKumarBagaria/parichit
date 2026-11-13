import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/formatters.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../interactions/presentation/interaction_widgets.dart';
import '../../network/presentation/network_providers.dart';
import '../../reminders/presentation/add_reminder_dialog.dart';

/// Meetings tab: timeline of interactions + upcoming agenda (blueprint §10, 10–11).
class MeetingsScreen extends ConsumerWidget {
  const MeetingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(l10n.navMeetings),
          bottom: TabBar(
            tabs: [
              Tab(text: l10n.meetingsTimeline),
              Tab(text: l10n.meetingsUpcoming),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => context.push(Routes.logMeeting()),
          icon: const Icon(Icons.add),
          label: Text(l10n.homeLogMeeting),
        ),
        body: const TabBarView(children: [_Timeline(), _Upcoming()]),
      ),
    );
  }
}

class _Timeline extends ConsumerWidget {
  const _Timeline();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return ref
        .watch(interactionsProvider)
        .when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('$e')),
          data: (list) {
            if (list.isEmpty) {
              return EmptyState(
                icon: Icons.event_note_outlined,
                title: l10n.meetingsEmptyTitle,
                message: l10n.meetingsEmptyBody,
                actionLabel: l10n.homeLogMeeting,
                onAction: () => context.push(Routes.logMeeting()),
              );
            }
            final children = <Widget>[];
            String? month;
            for (final i in list) {
              final m = context.formatMonthYear(i.occurredAt);
              if (m != month) {
                month = m;
                children.add(
                  Padding(
                    padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, AppSpacing.xxs),
                    child: Text(m, style: Theme.of(context).textTheme.titleSmall),
                  ),
                );
              }
              children.add(InteractionTile(interaction: i));
            }
            return ListView(padding: const EdgeInsets.only(bottom: 96), children: children);
          },
        );
  }
}

class _Upcoming extends ConsumerWidget {
  const _Upcoming();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    return ListView(
      padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.sm, AppSpacing.md, 96),
      children: [
        Text(l10n.upcomingNext60Days, style: Theme.of(context).textTheme.titleSmall),
        const AgendaList(days: 60),
        const SizedBox(height: AppSpacing.md),
        OutlinedButton.icon(
          onPressed: () => showAddReminderDialog(context, ref),
          icon: const Icon(Icons.add_alert_outlined),
          label: Text(l10n.reminderAdd),
        ),
      ],
    );
  }
}
