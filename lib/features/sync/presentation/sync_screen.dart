import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/formatters.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/section_card.dart';
import 'sync_controller.dart';

/// Cloud backup & sync: account, status, pending changes, sync issues.
class SyncScreen extends ConsumerStatefulWidget {
  const SyncScreen({super.key});

  @override
  ConsumerState<SyncScreen> createState() => _SyncScreenState();
}

class _SyncScreenState extends ConsumerState<SyncScreen> {
  final _email = TextEditingController();
  final _code = TextEditingController();
  bool _codeSent = false;
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _email.dispose();
    _code.dispose();
    super.dispose();
  }

  Future<void> _run(Future<void> Function() action) async {
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await action();
    } on Object catch (e) {
      setState(() => _error = '$e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final status = ref.watch(syncControllerProvider);
    final controller = ref.read(syncControllerProvider.notifier);
    final pending = ref.watch(pendingChangesProvider).value ?? 0;
    final issues = ref.watch(syncIssuesProvider).value ?? const [];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsSync)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          if (status.phase == SyncPhase.notConfigured)
            SectionCard(title: l10n.syncNotConfiguredTitle, child: Text(l10n.syncNotConfiguredBody))
          else if (status.phase == SyncPhase.signedOut)
            SectionCard(
              title: l10n.syncSignInTitle,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(l10n.syncSignInBody),
                  const SizedBox(height: AppSpacing.md),
                  TextField(
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    enabled: !_codeSent,
                    decoration: InputDecoration(
                      labelText: l10n.fieldEmail,
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                  ),
                  if (_codeSent) ...[
                    const SizedBox(height: AppSpacing.md),
                    TextField(
                      controller: _code,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(labelText: l10n.syncCode, prefixIcon: const Icon(Icons.pin_outlined)),
                    ),
                  ],
                  if (_error != null) ...[
                    const SizedBox(height: AppSpacing.xs),
                    Text(_error!, style: TextStyle(color: Theme.of(context).colorScheme.error)),
                  ],
                  const SizedBox(height: AppSpacing.md),
                  FilledButton(
                    onPressed: _busy
                        ? null
                        : () => _codeSent
                              ? _run(() => controller.verifyCode(_email.text, _code.text))
                              : _run(() async {
                                  await controller.sendCode(_email.text);
                                  setState(() => _codeSent = true);
                                }),
                    child: Text(_codeSent ? l10n.syncVerify : l10n.syncSendCode),
                  ),
                ],
              ),
            )
          else ...[
            SectionCard(
              title: l10n.syncAccount,
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: const Icon(Icons.account_circle_outlined),
                title: Text(status.email ?? ''),
                trailing: TextButton(onPressed: controller.signOut, child: Text(l10n.syncSignOut)),
              ),
            ),
            const SizedBox(height: AppSpacing.md),
            SectionCard(
              title: l10n.syncStatus,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(l10n.syncPendingChanges(pending)),
                  if (status.lastSyncedAt != null)
                    Text(l10n.syncLastSynced(context.formatDateTime(status.lastSyncedAt!))),
                  if (status.phase == SyncPhase.offline) Text(l10n.syncOfflineBody),
                  const SizedBox(height: AppSpacing.sm),
                  FilledButton.icon(
                    onPressed: status.phase == SyncPhase.syncing ? null : controller.syncNow,
                    icon: const Icon(Icons.sync),
                    label: Text(l10n.syncNow),
                  ),
                ],
              ),
            ),
          ],
          if (issues.isNotEmpty) ...[
            const SizedBox(height: AppSpacing.md),
            SectionCard(
              title: l10n.syncIssues(issues.length),
              child: Column(
                children: [
                  for (final i in issues)
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      leading: const Icon(Icons.error_outline),
                      title: Text('${i.entity} · ${i.errorCode ?? ''}'),
                      subtitle: Text(i.message ?? '', maxLines: 3, overflow: TextOverflow.ellipsis),
                      trailing: IconButton(
                        tooltip: l10n.actionDismiss,
                        icon: const Icon(Icons.close),
                        onPressed: () => ref.read(syncEngineProvider)?.dismissIssue(i.id),
                      ),
                    ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
