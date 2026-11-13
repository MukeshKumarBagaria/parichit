import 'package:flutter/material.dart';

import '../../../core/database/app_database.dart';
import '../domain/app_settings.dart';

/// Reads and writes [AppSettings] in the local `kv_settings` table.
class SettingsRepository {
  SettingsRepository(this._db);

  final AppDatabase _db;

  static const _kLanguage = 'language';
  static const _kThemeMode = 'theme_mode';
  static const _kOnboardingComplete = 'onboarding_complete';

  Future<AppSettings> load() async {
    final rows = await _db.select(_db.kvSettings).get();
    final map = {for (final r in rows) r.key: r.value};
    return AppSettings(
      languageCode: map[_kLanguage],
      themeMode: ThemeMode.values.asNameMap()[map[_kThemeMode]] ?? ThemeMode.system,
      onboardingComplete: map[_kOnboardingComplete] == 'true',
    );
  }

  Future<void> save(AppSettings s) => _db.transaction(() async {
    await _put(_kLanguage, s.languageCode);
    await _put(_kThemeMode, s.themeMode.name);
    await _put(_kOnboardingComplete, s.onboardingComplete.toString());
  });

  Future<void> _put(String key, String? value) async {
    if (value == null) {
      await (_db.delete(_db.kvSettings)..where((t) => t.key.equals(key))).go();
    } else {
      await _db.into(_db.kvSettings).insertOnConflictUpdate(KvSettingsCompanion.insert(key: key, value: value));
    }
  }
}
