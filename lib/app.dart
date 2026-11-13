import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/l10n/l10n.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/security/app_lock.dart';
import 'features/settings/presentation/settings_providers.dart';
import 'features/sync/presentation/sync_controller.dart';

class ParichitApp extends ConsumerWidget {
  const ParichitApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settings = ref.watch(appSettingsProvider);
    return MaterialApp.router(
      onGenerateTitle: (context) => context.l10n.appTitle,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: settings.themeMode,
      locale: settings.locale,
      supportedLocales: AppLocalizations.supportedLocales,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      routerConfig: ref.watch(appRouterProvider),
      builder: (context, child) => _SyncOnResume(child: AppLockGate(child: child ?? const SizedBox.shrink())),
    );
  }
}

/// Starts the sync controller and syncs whenever the app comes back to the
/// foreground (blueprint §7).
class _SyncOnResume extends ConsumerStatefulWidget {
  const _SyncOnResume({required this.child});

  final Widget child;

  @override
  ConsumerState<_SyncOnResume> createState() => _SyncOnResumeState();
}

class _SyncOnResumeState extends ConsumerState<_SyncOnResume> {
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(onResume: () => ref.read(syncControllerProvider.notifier).syncNow());
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ref.watch(syncControllerProvider); // keep the controller alive
    return widget.child;
  }
}
