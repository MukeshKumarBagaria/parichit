import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/sync/sync_providers.dart';
import '../../../core/theme/app_tokens.dart';
import '../../account/account_actions.dart';

/// Small status chip (blueprint §10): Synced ✓ / Offline / 3 pending / Issue.
/// Hidden when cloud backup is not available at all.
class SyncPill extends ConsumerWidget {
  const SyncPill({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(syncControllerProvider);
    if (state.phase == SyncPhase.localOnly) return const SizedBox.shrink();

    final pending = ref.watch(pendingChangesProvider).value ?? 0;
    final issues = ref.watch(syncIssuesProvider).value?.length ?? 0;
    final scheme = Theme.of(context).colorScheme;

    final (IconData icon, String label, Color color) = switch (state.phase) {
      _ when issues > 0 => (Icons.error_outline, l10n.syncStatusError, scheme.error),
      SyncPhase.signedOut => (Icons.cloud_off_outlined, l10n.syncStatusSignedOut, scheme.outline),
      SyncPhase.syncing => (Icons.sync, l10n.syncStatusSyncing, scheme.primary),
      SyncPhase.offline => (Icons.cloud_off_outlined, l10n.syncStatusOffline, scheme.outline),
      SyncPhase.error => (Icons.error_outline, l10n.syncStatusError, scheme.error),
      _ when pending > 0 => (Icons.cloud_upload_outlined, l10n.syncStatusPending(pending), scheme.primary),
      _ => (Icons.cloud_done_outlined, l10n.syncStatusSynced, scheme.primary),
    };

    return ActionChip(
      avatar: Icon(icon, size: 18, color: color),
      label: Text(label),
      visualDensity: VisualDensity.compact,
      onPressed: () => context.go(Routes.more),
    );
  }
}

/// Cloud-backup card on the Settings screen.
class SyncSettingsBody extends ConsumerWidget {
  const SyncSettingsBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final state = ref.watch(syncControllerProvider);
    final session = ref.watch(sessionProvider).value;
    final pending = ref.watch(pendingChangesProvider).value ?? 0;
    final issues = ref.watch(syncIssuesProvider).value?.length ?? 0;

    switch (state.phase) {
      case SyncPhase.localOnly:
        return ListTile(
          contentPadding: EdgeInsets.zero,
          leading: const Icon(Icons.cloud_off_outlined),
          title: Text(l10n.syncLocalOnly),
        );
      case SyncPhase.signedOut:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.syncSignedOutBody),
            const SizedBox(height: AppSpacing.sm),
            FilledButton.icon(
              onPressed: () => context.push(Routes.signIn),
              icon: const Icon(Icons.login),
              label: Text(l10n.syncSignInButton),
            ),
          ],
        );
      case SyncPhase.idle || SyncPhase.syncing || SyncPhase.offline || SyncPhase.error:
        final last = state.lastSyncedAt;
        final status = switch (state.phase) {
          SyncPhase.syncing => l10n.syncStatusSyncing,
          SyncPhase.offline => l10n.syncStatusOffline,
          SyncPhase.error => '${l10n.syncStatusError}${state.message == null ? '' : ': ${state.message}'}',
          _ when pending > 0 => l10n.syncStatusPending(pending),
          _ => l10n.syncStatusSynced,
        };
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(l10n.syncSignedInAs(session?.user.email ?? '')),
            const SizedBox(height: AppSpacing.xxs),
            Text(status, style: Theme.of(context).textTheme.titleSmall),
            Text(
              last == null ? l10n.syncNeverSynced : l10n.syncLastSynced(DateFormat.jm().format(last.toLocal())),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            const SizedBox(height: AppSpacing.sm),
            Wrap(
              spacing: AppSpacing.xs,
              children: [
                FilledButton.tonalIcon(
                  onPressed: state.phase == SyncPhase.syncing
                      ? null
                      : () => ref.read(syncControllerProvider.notifier).syncNow(),
                  icon: const Icon(Icons.sync),
                  label: Text(l10n.syncNow),
                ),
                OutlinedButton(
                  onPressed: () => ref.read(supabaseClientProvider)?.auth.signOut(),
                  child: Text(l10n.syncSignOut),
                ),
              ],
            ),
            if (issues > 0) ...[
              const SizedBox(height: AppSpacing.xs),
              ListTile(
                contentPadding: EdgeInsets.zero,
                leading: Icon(Icons.error_outline, color: Theme.of(context).colorScheme.error),
                title: Text(l10n.syncIssuesCount(issues)),
                trailing: const Icon(Icons.chevron_right),
                onTap: () => context.push(Routes.syncIssues),
              ),
            ],
            const SizedBox(height: AppSpacing.xs),
            TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Theme.of(context).colorScheme.error),
              onPressed: () => deleteCloudAccount(context, ref),
              icon: const Icon(Icons.person_remove_outlined),
              label: Text(l10n.accountDeleteButton),
            ),
          ],
        );
    }
  }
}
