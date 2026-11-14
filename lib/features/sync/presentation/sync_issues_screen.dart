import 'package:drift/drift.dart' show Value;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/database/app_database.dart';
import '../../../core/di/core_providers.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/sync/sync_providers.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/empty_state.dart';

/// Changes the cloud refused. They are never deleted automatically; the user
/// dismisses them after checking.
class SyncIssuesScreen extends ConsumerWidget {
  const SyncIssuesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final issues = ref.watch(syncIssuesProvider).value ?? const <SyncIssueRow>[];
    final db = ref.watch(appDatabaseProvider);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.syncIssuesTitle)),
      body: issues.isEmpty
          ? EmptyState(icon: Icons.cloud_done_outlined, title: l10n.syncIssuesTitle, message: l10n.syncIssuesEmpty)
          : ListView(
              padding: const EdgeInsets.all(AppSpacing.md),
              children: [
                Text(l10n.syncIssuesHelp),
                const SizedBox(height: AppSpacing.sm),
                for (final issue in issues)
                  Card(
                    child: ListTile(
                      title: Text('${issue.entity} · ${issue.errorCode ?? ''}'),
                      subtitle: Text(issue.message ?? issue.recordId),
                      trailing: TextButton(
                        onPressed: () => (db.update(db.syncIssues)..where((i) => i.id.equals(issue.id))).write(
                          SyncIssuesCompanion(resolvedAt: Value(DateTime.now().toUtc())),
                        ),
                        child: Text(l10n.syncDiscard),
                      ),
                    ),
                  ),
              ],
            ),
    );
  }
}
