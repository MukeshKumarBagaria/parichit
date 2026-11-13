import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/core_providers.dart';
import '../data/settings_repository.dart';
import '../domain/app_settings.dart';

final settingsRepositoryProvider = Provider<SettingsRepository>(
  (ref) => SettingsRepository(ref.watch(appDatabaseProvider)),
);

/// Settings loaded before `runApp` so the first frame already uses the right
/// language/theme and the router knows whether to show onboarding.
final initialSettingsProvider = Provider<AppSettings>((ref) => const AppSettings());

class AppSettingsController extends Notifier<AppSettings> {
  @override
  AppSettings build() => ref.watch(initialSettingsProvider);

  Future<void> setLanguage(String? code) => _update(state.copyWith(languageCode: () => code));

  Future<void> setThemeMode(ThemeMode mode) => _update(state.copyWith(themeMode: mode));

  Future<void> completeOnboarding() => _update(state.copyWith(onboardingComplete: true));

  Future<void> _update(AppSettings next) async {
    state = next;
    await ref.read(settingsRepositoryProvider).save(next);
  }
}

final appSettingsProvider = NotifierProvider<AppSettingsController, AppSettings>(AppSettingsController.new);
