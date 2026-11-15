import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/di/core_providers.dart';
import '../../core/l10n/l10n.dart';
import '../../core/logging/app_logger.dart';
import '../../core/sync/sync_providers.dart';
import '../settings/presentation/settings_providers.dart';

/// Asks the user to type a confirmation word before a destructive action.
Future<bool> _confirmDestructive(BuildContext context, {required String title, required String body}) async {
  final l10n = context.l10n;
  final controller = TextEditingController();
  final word = l10n.accountConfirmWord;
  final ok = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) => AlertDialog(
        icon: Icon(Icons.warning_amber_rounded, color: Theme.of(ctx).colorScheme.error),
        title: Text(title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(body),
            const SizedBox(height: 12),
            TextField(
              controller: controller,
              autofocus: true,
              decoration: InputDecoration(labelText: l10n.accountConfirmHint(word)),
              onChanged: (_) => setState(() {}),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.actionCancel)),
          FilledButton(
            style: FilledButton.styleFrom(backgroundColor: Theme.of(ctx).colorScheme.error),
            onPressed: controller.text.trim().toUpperCase() == word.toUpperCase()
                ? () => Navigator.pop(ctx, true)
                : null,
            child: Text(l10n.actionDelete),
          ),
        ],
      ),
    ),
  );
  controller.dispose();
  return ok ?? false;
}

/// Permanently deletes the cloud account and all cloud data (Google Play
/// account-deletion requirement). Data on this phone is kept.
Future<void> deleteCloudAccount(BuildContext context, WidgetRef ref) async {
  final l10n = context.l10n;
  final client = ref.read(supabaseClientProvider);
  if (client == null) return;
  final messenger = ScaffoldMessenger.of(context);
  if (!await _confirmDestructive(context, title: l10n.accountDeleteTitle, body: l10n.accountDeleteBody)) return;
  try {
    await client.rpc<void>('delete_my_account');
    await client.auth.signOut();
    messenger.showSnackBar(SnackBar(content: Text(l10n.accountDeleted)));
  } on Object catch (e, st) {
    AppLogger.error('Account deletion failed', error: e, stackTrace: st);
    messenger.showSnackBar(SnackBar(content: Text(l10n.accountDeleteFailed('$e'))));
  }
}

/// Erases everything stored on this phone and returns to onboarding. Signs
/// out first so the next sync does not download the data again.
Future<void> eraseThisPhone(BuildContext context, WidgetRef ref) async {
  final l10n = context.l10n;
  if (!await _confirmDestructive(context, title: l10n.eraseDeviceTitle, body: l10n.eraseDeviceBody)) return;
  await ref.read(supabaseClientProvider)?.auth.signOut();
  final db = ref.read(appDatabaseProvider);
  await db.transaction(() async {
    for (final table in db.allTables) {
      await db.delete(table).go();
    }
  });
  await ref.read(appSettingsProvider.notifier).resetOnboarding();
}
