import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:share_plus/share_plus.dart';

import '../../../core/di/core_providers.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/section_card.dart';
import '../../people/presentation/people_providers.dart';
import '../../relationships/presentation/relationship_providers.dart';
import '../data/backup_codec.dart';
import '../data/backup_service.dart';

final backupServiceProvider = Provider<BackupService>((ref) {
  final people = ref.watch(peopleRepositoryProvider);
  return BackupService(
    ref.watch(appDatabaseProvider),
    onPeopleChanged: (ids) async {
      for (final id in ids) {
        await people.refreshSearchText(id);
      }
    },
  );
});

/// Backup & export (blueprint §13): encrypted backup, restore, CSV, GEDCOM.
class BackupScreen extends ConsumerStatefulWidget {
  const BackupScreen({super.key});

  @override
  ConsumerState<BackupScreen> createState() => _BackupScreenState();
}

class _BackupScreenState extends ConsumerState<BackupScreen> {
  bool _busy = false;

  Future<void> _run(Future<void> Function() action) async {
    setState(() => _busy = true);
    try {
      await action();
    } on BackupFormatException catch (_) {
      if (mounted) _snack(context.l10n.backupWrongPassphrase);
    } on Object catch (e) {
      if (mounted) _snack('$e');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  void _snack(String text) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));

  Future<void> _share(File file) => SharePlus.instance.share(ShareParams(files: [XFile(file.path)]));

  Future<String?> _askPassphrase({required bool confirm}) async {
    final l10n = context.l10n;
    final a = TextEditingController();
    final b = TextEditingController();
    final ok = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.backupPassphrase),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(confirm ? l10n.backupPassphraseHelp : l10n.backupPassphraseEnter),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: a,
              obscureText: true,
              decoration: InputDecoration(labelText: l10n.backupPassphrase),
            ),
            if (confirm)
              TextField(
                controller: b,
                obscureText: true,
                decoration: InputDecoration(labelText: l10n.backupPassphraseRepeat),
              ),
          ],
        ),
        actions: [
          TextButton(onPressed: () => Navigator.pop(ctx, false), child: Text(l10n.actionCancel)),
          FilledButton(onPressed: () => Navigator.pop(ctx, true), child: Text(l10n.actionContinue)),
        ],
      ),
    );
    final value = a.text;
    final repeat = b.text;
    a.dispose();
    b.dispose();
    if (ok != true || value.length < 6) {
      if (ok == true && mounted) _snack(l10n.backupPassphraseTooShort);
      return null;
    }
    if (confirm && value != repeat) {
      if (mounted) _snack(l10n.backupPassphraseMismatch);
      return null;
    }
    return value;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final service = ref.read(backupServiceProvider);

    Widget tile(IconData icon, String title, String body, VoidCallback onTap) => ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      subtitle: Text(body),
      trailing: const Icon(Icons.chevron_right),
      enabled: !_busy,
      onTap: onTap,
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.backupTitle)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          if (_busy) const LinearProgressIndicator(),
          SectionCard(
            title: l10n.backupEncrypted,
            child: Column(
              children: [
                tile(Icons.lock_outline, l10n.backupCreate, l10n.backupCreateBody, () async {
                  final pass = await _askPassphrase(confirm: true);
                  if (pass == null) return;
                  await _run(() async => _share(await service.createEncryptedBackup(pass)));
                }),
                tile(Icons.restore, l10n.backupRestore, l10n.backupRestoreBody, () async {
                  final files = await FilePicker.pickFiles();
                  final bytes = await files.firstOrNull?.readAsBytes();
                  if (bytes == null) return;
                  final pass = await _askPassphrase(confirm: false);
                  if (pass == null) return;
                  await _run(() async {
                    final count = await service.restore(bytes, pass);
                    if (mounted) _snack(l10n.backupRestored(count));
                  });
                }),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SectionCard(
            title: l10n.exportTitle,
            child: Column(
              children: [
                tile(Icons.table_chart_outlined, l10n.exportCsv, l10n.exportCsvBody, () async {
                  final relations = ref.read(relationsToMeProvider).value ?? const {};
                  final hindi = Localizations.localeOf(context).languageCode == 'hi';
                  final labels = {for (final e in relations.entries) e.key: e.value.name.label(hindi: hindi)};
                  final self = ref.read(selfPersonProvider).value;
                  if (self != null) labels[self.id] = l10n.relationYou;
                  await _run(() async => _share(await service.exportCsv(relationToMe: labels)));
                }),
                tile(Icons.account_tree_outlined, l10n.exportGedcom, l10n.exportGedcomBody, () async {
                  await _run(() async => _share(await service.exportGedcom()));
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
