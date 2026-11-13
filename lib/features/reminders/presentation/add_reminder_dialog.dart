import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/formatters.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../network/presentation/network_providers.dart';

/// Creates a manual reminder ("Call Rahul about the land papers").
Future<void> showAddReminderDialog(BuildContext context, WidgetRef ref, {String? personId}) async {
  final l10n = context.l10n;
  final title = TextEditingController();
  var due = DateTime.now().add(const Duration(days: 1));
  var recurrence = 'none';

  final saved = await showDialog<bool>(
    context: context,
    builder: (ctx) => StatefulBuilder(
      builder: (ctx, setState) => AlertDialog(
        title: Text(l10n.reminderAdd),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: title,
              autofocus: true,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: l10n.reminderWhat),
            ),
            const SizedBox(height: AppSpacing.sm),
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.event),
              title: Text(ctx.formatDate(due)),
              onTap: () async {
                final picked = await showDatePicker(
                  context: ctx,
                  initialDate: due,
                  firstDate: DateTime.now().subtract(const Duration(days: 1)),
                  lastDate: DateTime(2100),
                );
                if (picked != null) setState(() => due = picked);
              },
            ),
            DropdownButtonFormField<String>(
              initialValue: recurrence,
              decoration: InputDecoration(labelText: l10n.reminderRepeat),
              items: [
                DropdownMenuItem(value: 'none', child: Text(l10n.repeatNone)),
                DropdownMenuItem(value: 'weekly', child: Text(l10n.repeatWeekly)),
                DropdownMenuItem(value: 'monthly', child: Text(l10n.repeatMonthly)),
                DropdownMenuItem(value: 'yearly', child: Text(l10n.repeatYearly)),
              ],
              onChanged: (v) => setState(() => recurrence = v ?? 'none'),
            ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.actionCancel)),
          FilledButton(onPressed: () => Navigator.pop(ctx, title.text.trim().isNotEmpty), child: Text(l10n.actionSave)),
        ],
      ),
    ),
  );
  if (saved ?? false) {
    await ref
        .read(remindersRepositoryProvider)
        .create(
          title: title.text,
          dueAt: DateTime(due.year, due.month, due.day, 9),
          personId: personId,
          recurrence: recurrence,
        );
  }
  title.dispose();
}
