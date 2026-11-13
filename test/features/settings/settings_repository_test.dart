import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parichit/core/database/app_database.dart';
import 'package:parichit/features/settings/data/settings_repository.dart';
import 'package:parichit/features/settings/domain/app_settings.dart';

import '../../helpers/test_database.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = createTestDatabase());
  tearDown(() => db.close());

  test('defaults when nothing is stored', () async {
    expect(await SettingsRepository(db).load(), const AppSettings());
  });

  test('round-trips all settings, including clearing the language', () async {
    final repo = SettingsRepository(db);
    const saved = AppSettings(languageCode: 'hi', themeMode: ThemeMode.dark, onboardingComplete: true);

    await repo.save(saved);
    expect(await repo.load(), saved);

    await repo.save(saved.copyWith(languageCode: () => null));
    expect((await repo.load()).languageCode, isNull);
  });
}
