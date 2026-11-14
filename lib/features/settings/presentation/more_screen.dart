import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/section_card.dart';
import '../../security/app_lock.dart';
import '../../sync/presentation/sync_widgets.dart';
import 'settings_providers.dart';

/// "More" tab: data tools and settings.
class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final settings = ref.watch(appSettingsProvider);
    final controller = ref.read(appSettingsProvider.notifier);
    final lock = ref.watch(appLockProvider);

    Widget nav(IconData icon, String title, String route, {Widget? trailing}) => ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing ?? const Icon(Icons.chevron_right),
      onTap: () => context.push(route),
    );

    return Scaffold(
      appBar: AppBar(title: Text(l10n.navMore)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          SectionCard(title: l10n.settingsSync, child: const SyncSettingsBody()),
          const SizedBox(height: AppSpacing.md),
          SectionCard(
            title: l10n.moreData,
            child: Column(
              children: [
                nav(Icons.save_alt, l10n.backupTitle, Routes.backup),
                nav(Icons.merge_type, l10n.duplicatesTitle, Routes.duplicates),
                nav(Icons.delete_outline, l10n.trashTitle, Routes.trash),
              ],
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SectionCard(
            title: l10n.settingsLanguage,
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<String>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(value: 'system', label: Text(l10n.settingsLanguageSystem)),
                  const ButtonSegment(value: 'hi', label: Text('हिंदी')),
                  const ButtonSegment(value: 'en', label: Text('English')),
                ],
                selected: {settings.languageCode ?? 'system'},
                onSelectionChanged: (s) => controller.setLanguage(s.first == 'system' ? null : s.first),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SectionCard(
            title: l10n.settingsTheme,
            child: SizedBox(
              width: double.infinity,
              child: SegmentedButton<ThemeMode>(
                showSelectedIcon: false,
                segments: [
                  ButtonSegment(value: ThemeMode.system, label: Text(l10n.themeSystem)),
                  ButtonSegment(value: ThemeMode.light, label: Text(l10n.themeLight)),
                  ButtonSegment(value: ThemeMode.dark, label: Text(l10n.themeDark)),
                ],
                selected: {settings.themeMode},
                onSelectionChanged: (s) => controller.setThemeMode(s.first),
              ),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          SectionCard(
            title: l10n.settingsSecurity,
            child: SwitchListTile(
              contentPadding: EdgeInsets.zero,
              secondary: const Icon(Icons.fingerprint),
              title: Text(l10n.settingsAppLock),
              subtitle: Text(l10n.settingsAppLockBody),
              value: lock.enabled,
              onChanged: (v) async {
                final notifier = ref.read(appLockProvider.notifier);
                if (v && !await notifier.isSupported()) {
                  if (context.mounted) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.lockUnsupported)));
                  }
                  return;
                }
                if (context.mounted) await notifier.setEnabled(v, reason: l10n.lockReason);
              },
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Card(
            child: ListTile(
              leading: const Icon(Icons.info_outline),
              title: Text(l10n.settingsAbout),
              onTap: () => showAboutDialog(
                context: context,
                applicationName: l10n.appTitle,
                applicationVersion: '1.0.0',
                applicationLegalese: l10n.appTagline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
