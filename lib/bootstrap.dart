import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'app.dart';
import 'core/config/app_config.dart';
import 'core/database/app_database.dart';
import 'core/database/connection.dart';
import 'core/di/core_providers.dart';
import 'core/logging/app_logger.dart';
import 'core/security/database_key_store.dart';
import 'features/settings/data/settings_repository.dart';
import 'features/settings/presentation/settings_providers.dart';

/// Initialises everything the first frame needs, then starts the app.
///
/// Order matters: secure key → encrypted database → saved settings →
/// (optional) Supabase. Nothing here needs the network.
Future<void> bootstrap() async {
  WidgetsFlutterBinding.ensureInitialized();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
    AppLogger.error('Flutter error', error: details.exception, stackTrace: details.stack);
  };
  PlatformDispatcher.instance.onError = (error, stack) {
    AppLogger.error('Uncaught error', error: error, stackTrace: stack);
    return true;
  };

  final key = await DatabaseKeyStore().obtainKey();
  final db = AppDatabase(openAppDatabase(encryptionKey: key));
  final settings = await SettingsRepository(db).load();

  if (AppConfig.isCloudConfigured) {
    await Supabase.initialize(url: AppConfig.supabaseUrl, publishableKey: AppConfig.supabasePublishableKey);
  }

  runApp(
    ProviderScope(
      overrides: [
        appDatabaseProvider.overrideWithValue(db),
        initialSettingsProvider.overrideWithValue(settings),
      ],
      child: const ParichitApp(),
    ),
  );
}
