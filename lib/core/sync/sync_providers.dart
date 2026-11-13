import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../database/app_database.dart';
import '../di/core_providers.dart';
import 'sync_engine.dart';
import 'sync_remote.dart';

/// The Supabase client, or null when the app runs local-only (no config, or
/// initialisation failed). `bootstrap()` overrides this once Supabase is up.
final supabaseClientProvider = Provider<SupabaseClient?>((ref) => null);

/// The signed-in session (null = signed out). Emits on sign-in/out/refresh.
final sessionProvider = StreamProvider<Session?>((ref) async* {
  final client = ref.watch(supabaseClientProvider);
  if (client == null) {
    yield null;
    return;
  }
  yield client.auth.currentSession;
  await for (final change in client.auth.onAuthStateChange) {
    yield change.session;
  }
});

final syncRemoteProvider = Provider<SyncRemote?>((ref) {
  final client = ref.watch(supabaseClientProvider);
  return client == null ? null : SupabaseSyncRemote(client);
});

final syncEngineProvider = Provider<SyncEngine?>((ref) {
  final remote = ref.watch(syncRemoteProvider);
  if (remote == null) return null;
  return SyncEngine(db: ref.watch(appDatabaseProvider), remote: remote, clock: ref.watch(clockProvider));
});

/// Number of local changes not yet confirmed by the cloud.
final pendingChangesProvider = StreamProvider<int>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final count = db.syncOutbox.seq.count();
  final query = db.selectOnly(db.syncOutbox)..addColumns([count]);
  return query.map((r) => r.read(count) ?? 0).watchSingle();
});

/// Rejected changes the user has not dismissed yet.
final syncIssuesProvider = StreamProvider<List<SyncIssueRow>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(db.syncIssues)
        ..where((i) => i.resolvedAt.isNull())
        ..orderBy([(i) => OrderingTerm.desc(i.createdAt)]))
      .watch();
});

enum SyncPhase {
  /// Cloud not configured: everything stays on this phone.
  localOnly,
  signedOut,
  idle,
  syncing,
  offline,
  error,
}

@immutable
class SyncState {
  const SyncState({this.phase = SyncPhase.localOnly, this.lastSyncedAt, this.message});

  final SyncPhase phase;
  final DateTime? lastSyncedAt;
  final String? message;

  SyncState copyWith({SyncPhase? phase, DateTime? lastSyncedAt, String? Function()? message}) => SyncState(
    phase: phase ?? this.phase,
    lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    message: message == null ? this.message : message(),
  );
}

/// Decides *when* to sync (blueprint §7): on sign-in, app start/resume, 5 s
/// after the last local edit, every 15 min, on "Sync now", and with backoff
/// after a network failure. The engine decides *what* to sync.
class SyncController extends Notifier<SyncState> {
  static const _backoff = [Duration(seconds: 5), Duration(seconds: 30), Duration(minutes: 2), Duration(minutes: 10)];
  static const _debounce = Duration(seconds: 5);
  static const _periodic = Duration(minutes: 15);

  Timer? _debounceTimer;
  Timer? _retryTimer;
  int _failures = 0;

  @override
  SyncState build() {
    final remote = ref.watch(syncRemoteProvider);
    if (remote == null) return const SyncState();

    final signedIn = ref.watch(sessionProvider.select((s) => s.value != null));
    if (!signedIn) return const SyncState(phase: SyncPhase.signedOut);

    final lifecycle = _ResumeObserver(syncNow);
    WidgetsBinding.instance.addObserver(lifecycle);
    final periodic = Timer.periodic(_periodic, (_) => syncNow());
    ref
      ..onDispose(() {
        WidgetsBinding.instance.removeObserver(lifecycle);
        periodic.cancel();
        _debounceTimer?.cancel();
        _retryTimer?.cancel();
      })
      ..listen(pendingChangesProvider, (prev, next) {
        if ((next.value ?? 0) > 0) _scheduleSoon();
      });

    scheduleMicrotask(syncNow);
    return const SyncState(phase: SyncPhase.idle);
  }

  void _scheduleSoon() {
    _debounceTimer?.cancel();
    _debounceTimer = Timer(_debounce, syncNow);
  }

  /// Runs a sync now (also used by the "Sync now" button).
  Future<void> syncNow() async {
    final engine = ref.read(syncEngineProvider);
    if (engine == null || state.phase == SyncPhase.signedOut || state.phase == SyncPhase.localOnly) return;
    _retryTimer?.cancel();
    state = state.copyWith(phase: SyncPhase.syncing, message: () => null);
    try {
      final report = await engine.sync();
      if (!ref.mounted) return;
      final error = report.error;
      if (error == null) {
        _failures = 0;
        state = SyncState(phase: SyncPhase.idle, lastSyncedAt: DateTime.now());
      } else {
        _failures++;
        state = state.copyWith(
          phase: error.transient ? SyncPhase.offline : SyncPhase.error,
          message: () => error.message ?? error.code,
        );
        _retryTimer = Timer(_backoff[(_failures - 1).clamp(0, _backoff.length - 1)], syncNow);
      }
    } catch (e) {
      if (!ref.mounted) return;
      _failures++;
      state = state.copyWith(phase: SyncPhase.error, message: e.toString);
      _retryTimer = Timer(_backoff[(_failures - 1).clamp(0, _backoff.length - 1)], syncNow);
    }
  }
}

final syncControllerProvider = NotifierProvider<SyncController, SyncState>(SyncController.new);

class _ResumeObserver with WidgetsBindingObserver {
  _ResumeObserver(this._onResume);

  final Future<void> Function() _onResume;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) _onResume();
  }
}
