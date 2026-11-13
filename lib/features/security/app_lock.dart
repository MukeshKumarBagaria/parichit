import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:local_auth/local_auth.dart';

import '../../core/database/app_database.dart';
import '../../core/di/core_providers.dart';
import '../../core/l10n/l10n.dart';
import '../../core/theme/app_tokens.dart';

/// App lock state: enabled in settings, and whether currently locked.
final class AppLockState {
  const AppLockState({required this.enabled, required this.locked});

  final bool enabled;
  final bool locked;
}

/// Locks the app with fingerprint / face / device PIN (blueprint §13). Locks
/// on start and after being in the background longer than [timeout].
class AppLockController extends Notifier<AppLockState> {
  static const _key = 'app_lock_enabled';
  static const timeout = Duration(minutes: 1);
  final _auth = LocalAuthentication();
  DateTime? _backgroundedAt;

  @override
  AppLockState build() {
    _load();
    return const AppLockState(enabled: false, locked: false);
  }

  Future<void> _load() async {
    final db = ref.read(appDatabaseProvider);
    final row = await (db.select(db.kvSettings)..where((k) => k.key.equals(_key))).getSingleOrNull();
    final enabled = row?.value == 'true';
    state = AppLockState(enabled: enabled, locked: enabled);
  }

  Future<bool> isSupported() async {
    try {
      return await _auth.isDeviceSupported();
    } on Object {
      return false;
    }
  }

  /// Enabling requires a successful authentication first.
  Future<bool> setEnabled(bool enabled, {required String reason}) async {
    if (enabled && !await _authenticate(reason)) return false;
    final db = ref.read(appDatabaseProvider);
    await db.into(db.kvSettings).insertOnConflictUpdate(KvSettingsCompanion.insert(key: _key, value: '$enabled'));
    state = AppLockState(enabled: enabled, locked: false);
    return true;
  }

  Future<void> unlock(String reason) async {
    if (await _authenticate(reason)) state = AppLockState(enabled: state.enabled, locked: false);
  }

  void onPaused() => _backgroundedAt = DateTime.now();

  void onResumed() {
    final since = _backgroundedAt;
    _backgroundedAt = null;
    if (state.enabled && since != null && DateTime.now().difference(since) > timeout) {
      state = const AppLockState(enabled: true, locked: true);
    }
  }

  Future<bool> _authenticate(String reason) async {
    try {
      return await _auth.authenticate(localizedReason: reason, persistAcrossBackgrounding: true);
    } on Object {
      return false;
    }
  }
}

final appLockProvider = NotifierProvider<AppLockController, AppLockState>(AppLockController.new);

/// Covers the app with a lock screen while locked.
class AppLockGate extends ConsumerStatefulWidget {
  const AppLockGate({required this.child, super.key});

  final Widget child;

  @override
  ConsumerState<AppLockGate> createState() => _AppLockGateState();
}

class _AppLockGateState extends ConsumerState<AppLockGate> {
  late final AppLifecycleListener _lifecycle;

  @override
  void initState() {
    super.initState();
    _lifecycle = AppLifecycleListener(
      onPause: () => ref.read(appLockProvider.notifier).onPaused(),
      onResume: () => ref.read(appLockProvider.notifier).onResumed(),
    );
  }

  @override
  void dispose() {
    _lifecycle.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final lock = ref.watch(appLockProvider);
    if (!lock.locked) return widget.child;
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Stack(
      children: [
        widget.child,
        Positioned.fill(
          child: Material(
            color: theme.colorScheme.surface,
            child: SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(AppSpacing.xl),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.lock_outline, size: 64, color: theme.colorScheme.primary),
                      const SizedBox(height: AppSpacing.md),
                      Text(l10n.lockTitle, style: theme.textTheme.titleLarge),
                      const SizedBox(height: AppSpacing.lg),
                      FilledButton.icon(
                        onPressed: () => ref.read(appLockProvider.notifier).unlock(l10n.lockReason),
                        icon: const Icon(Icons.fingerprint),
                        label: Text(l10n.lockUnlock),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
