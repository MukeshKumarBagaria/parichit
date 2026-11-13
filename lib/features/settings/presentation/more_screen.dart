import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/section_card.dart';
import 'settings_providers.dart';

/// "More" tab: settings now; duplicates, import/export and trash later.
class MoreScreen extends ConsumerWidget {
  const MoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = context.l10n;
    final settings = ref.watch(appSettingsProvider);
    final controller = ref.read(appSettingsProvider.notifier);

    return Scaffold(
      appBar: AppBar(title: Text(l10n.settingsTitle)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
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
            title: l10n.settingsSync,
            child: ListTile(
              contentPadding: EdgeInsets.zero,
              leading: const Icon(Icons.cloud_off_outlined),
              title: Text(l10n.syncLocalOnly),
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
                applicationLegalese: l10n.appTagline,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
