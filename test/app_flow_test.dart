import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:parichit/app.dart';
import 'package:parichit/core/database/app_database.dart';
import 'package:parichit/core/di/core_providers.dart';
import 'package:parichit/features/settings/domain/app_settings.dart';
import 'package:parichit/features/settings/presentation/settings_providers.dart';

import 'helpers/test_database.dart';

void main() {
  late AppDatabase db;

  setUp(() => db = createTestDatabase());

  Future<void> pumpApp(WidgetTester tester, {AppSettings settings = const AppSettings()}) async {
    await tester.pumpWidget(
      ProviderScope(
        overrides: [
          appDatabaseProvider.overrideWithValue(db),
          initialSettingsProvider.overrideWithValue(settings),
        ],
        child: const ParichitApp(),
      ),
    );
    await tester.pumpAndSettle();
  }

  /// Widget tests run on fake time, but saving goes through the real
  /// database, whose futures need real async turns to complete. Alternate
  /// real waits with frames until the UI has caught up.
  Future<void> settleAfterSave(WidgetTester tester) async {
    for (var i = 0; i < 20; i++) {
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 20)));
      await tester.pump(const Duration(milliseconds: 50));
    }
    await tester.pumpAndSettle();
  }

  /// Unmount before closing the database so no stream query outlives it.
  Future<void> tearDownApp(WidgetTester tester) async {
    await tester.pumpWidget(const SizedBox());
    // Drift closes stream queries on a zero-duration timer; flush it.
    await tester.pump(Duration.zero);
    await db.close();
  }

  testWidgets('first launch: choose language, create "Me", land on Home', (tester) async {
    await pumpApp(tester, settings: const AppSettings(languageCode: 'en'));

    expect(find.text('Welcome to Parichit'), findsOneWidget);
    await tester.tap(find.text('Continue'));
    await tester.pumpAndSettle();

    await tester.enterText(find.byType(TextFormField).first, 'Asha');
    await tester.ensureVisible(find.text('Get started'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Get started'));
    await settleAfterSave(tester);

    expect(find.text('Namaste, Asha'), findsOneWidget);
    expect(find.byType(NavigationBar), findsOneWidget);
    await tearDownApp(tester);
  });

  testWidgets('switching to Hindi translates the UI', (tester) async {
    await pumpApp(tester, settings: const AppSettings(languageCode: 'en'));

    await tester.tap(find.text('हिंदी'));
    await tester.pumpAndSettle();

    expect(find.text('परिचित में आपका स्वागत है'), findsOneWidget);
    await tearDownApp(tester);
  });

  testWidgets('quick add saves a person who then appears in People', (tester) async {
    await pumpApp(tester, settings: const AppSettings(languageCode: 'en', onboardingComplete: true));

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    expect(find.text('Quick add'), findsWidgets);

    await tester.enterText(find.byType(TextFormField).first, 'Ramesh Sharma');
    await tester.ensureVisible(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await settleAfterSave(tester);

    await tester.tap(find.text('People'));
    await tester.pumpAndSettle();
    expect(find.text('Ramesh Sharma'), findsOneWidget);
    await tearDownApp(tester);
  });

  testWidgets('quick add requires a name', (tester) async {
    await pumpApp(tester, settings: const AppSettings(languageCode: 'en', onboardingComplete: true));

    await tester.tap(find.byType(FloatingActionButton));
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.text('Save'));
    await tester.pumpAndSettle();
    await tester.tap(find.text('Save'));
    await tester.pumpAndSettle();

    expect(find.text('Please enter a name'), findsOneWidget);
    await tearDownApp(tester);
  });
}
