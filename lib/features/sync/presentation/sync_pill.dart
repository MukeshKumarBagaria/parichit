import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import 'sync_controller.dart';

/// Small sync status indicator: Synced ✓ / Offline / 3 pending / Local only.
class SyncPill extends ConsumerWidget {
  const SyncPill({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final status = ref.watch(syncControllerProvider);
    final pending = ref.watch(pendingChangesProvider).value ?? 0;
    final scheme = Theme.of(context).colorScheme;

    final (Widget icon, String label, Color color) = switch (status.phase) {
      SyncPhase.notConfigured || SyncPhase.signedOut => (
        const Icon(Icons.phone_android, size: 16),
        l10n.syncLocal,
        scheme.onSurfaceVariant,
      ),
      SyncPhase.syncing => (
        const SizedBox(width: 14, height: 14, child: CircularProgressIndicator(strokeWidth: 2)),
        l10n.syncSyncing,
        scheme.primary,
      ),
      SyncPhase.offline => (const Icon(Icons.cloud_off, size: 16), l10n.syncOffline, scheme.onSurfaceVariant),
      SyncPhase.error => (const Icon(Icons.error_outline, size: 16), l10n.syncError, scheme.error),
      SyncPhase.idle when pending > 0 => (
        const Icon(Icons.cloud_upload_outlined, size: 16),
        l10n.syncPending(pending),
        scheme.secondary,
      ),
      SyncPhase.idle => (const Icon(Icons.cloud_done_outlined, size: 16), l10n.syncDone, scheme.primary),
    };

    return ActionChip(
      avatar: IconTheme(
        data: IconThemeData(color: color),
        child: icon,
      ),
      label: Text(label, style: TextStyle(color: color)),
      visualDensity: VisualDensity.compact,
      onPressed: () => context.push(Routes.sync),
    );
  }
}
