import 'dart:async';

import 'package:drift/drift.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supabase_flutter/supabase_flutter.dart' hide TableUpdate;

import '../../../core/config/app_config.dart';
import '../../../core/database/app_database.dart';
import '../../../core/di/core_providers.dart';
import '../../../core/logging/app_logger.dart';
import '../../../core/sync/supabase_sync_remote.dart';
import '../../../core/sync/sync_engine.dart';
import '../../people/presentation/people_providers.dart';

enum SyncPhase { notConfigured, signedOut, idle, syncing, offline, error }

final class SyncStatus {
  const SyncStatus(this.phase, {this.lastSyncedAt, this.message, this.email});

  final SyncPhase phase;
  final DateTime? lastSyncedAt;
  final String? message;
  final String? email;

  SyncStatus copyWith({SyncPhase? phase, DateTime? lastSyncedAt, String? message, String? email}) => SyncStatus(
    phase ?? this.phase,
    lastSyncedAt: lastSyncedAt ?? this.lastSyncedAt,
    message: message,
    email: email ?? this.email,
  );
}

/// Supabase client, or null when the app runs local-only.
final supabaseClientProvider = Provider<SupabaseClient?>(
  (ref) => AppConfig.isCloudConfigured ? Supabase.instance.client : null,
);

final syncEngineProvider = Provider<SyncEngine?>((ref) {
  final client = ref.watch(supabaseClientProvider);
  if (client == null) return null;
  final people = ref.watch(peopleRepositoryProvider);
  return SyncEngine(
    ref.watch(appDatabaseProvider),
    SupabaseSyncRemote(client),
    clock: ref.watch(clockProvider),
    onPeopleChanged: (ids) async {
      for (final id in ids) {
        await people.refreshSearchText(id);
      }
    },
  );
});

/// Number of local changes not yet uploaded.
final pendingChangesProvider = StreamProvider<int>((ref) {
  final db = ref.watch(appDatabaseProvider);
  final count = db.syncOutbox.seq.count();
  return (db.selectOnly(db.syncOutbox)..addColumns([count])).map((r) => r.read(count) ?? 0).watchSingle();
});

final syncIssuesProvider = StreamProvider<List<SyncIssueRow>>((ref) {
  final db = ref.watch(appDatabaseProvider);
  return (db.select(db.syncIssues)..where((i) => i.resolvedAt.isNull())).watch();
});

/// Drives sync: on start, on resume, 5 s after local edits, every 15 min,
/// and with exponential back-off while offline (blueprint §7).
class SyncController extends Notifier<SyncStatus> {
  StreamSubscription<AuthState>? _authSub;
  StreamSubscription<Set<TableUpdate>>? _outboxSub;
  Timer? _debounce;
  Timer? _periodic;
  Timer? _retry;
  int _failures = 0;
  bool _running = false;

  static const _initialUploadKey = 'sync_initial_upload_user';

  SupabaseClient? get _client => ref.read(supabaseClientProvider);

  @override
  SyncStatus build() {
    final client = ref.watch(supabaseClientProvider);
    ref.onDispose(_disposeTimers);
    if (client == null) return const SyncStatus(SyncPhase.notConfigured);

    _authSub = client.auth.onAuthStateChange.listen((event) {
      final user = event.session?.user;
      if (user == null) {
        state = const SyncStatus(SyncPhase.signedOut);
      } else {
        state = state.copyWith(phase: SyncPhase.idle, email: user.email);
        unawaited(_onSignedIn(user.id));
      }
    });
    final db = ref.read(appDatabaseProvider);
    _outboxSub = db.tableUpdates(TableUpdateQuery.onTable(db.syncOutbox, limitUpdateKind: UpdateKind.insert)).listen((
      _,
    ) {
      _debounce?.cancel();
      _debounce = Timer(const Duration(seconds: 5), syncNow);
    });
    _periodic = Timer.periodic(const Duration(minutes: 15), (_) => syncNow());

    final user = client.auth.currentUser;
    if (user == null) return const SyncStatus(SyncPhase.signedOut);
    scheduleMicrotask(syncNow);
    return SyncStatus(SyncPhase.idle, email: user.email);
  }

  void _disposeTimers() {
    _authSub?.cancel();
    _outboxSub?.cancel();
    _debounce?.cancel();
    _periodic?.cancel();
    _retry?.cancel();
  }

  /// First sign-in on this device: upload everything created while local-only.
  Future<void> _onSignedIn(String userId) async {
    final db = ref.read(appDatabaseProvider);
    final done = await (db.select(db.kvSettings)..where((k) => k.key.equals(_initialUploadKey))).getSingleOrNull();
    if (done?.value != userId) {
      await ref.read(syncEngineProvider)?.enqueueEverything();
      await db
          .into(db.kvSettings)
          .insertOnConflictUpdate(KvSettingsCompanion.insert(key: _initialUploadKey, value: userId));
    }
    await syncNow();
  }

  Future<void> syncNow() async {
    final engine = ref.read(syncEngineProvider);
    final client = _client;
    if (engine == null || client == null || _running) return;
    if (client.auth.currentUser == null) {
      state = const SyncStatus(SyncPhase.signedOut);
      return;
    }
    _running = true;
    state = state.copyWith(phase: SyncPhase.syncing);
    try {
      final report = await engine.syncOnce();
      _failures = 0;
      state = state.copyWith(
        phase: SyncPhase.idle,
        lastSyncedAt: DateTime.now(),
        message: report.rejected > 0 ? '${report.rejected}' : null,
      );
    } on Object catch (e, st) {
      AppLogger.error('Sync failed', error: e, stackTrace: st);
      _failures++;
      state = state.copyWith(phase: e is AuthException ? SyncPhase.error : SyncPhase.offline, message: '$e');
      final delays = [5, 30, 120, 600];
      _retry?.cancel();
      _retry = Timer(Duration(seconds: delays[(_failures - 1).clamp(0, delays.length - 1)]), syncNow);
    } finally {
      _running = false;
    }
  }

  // ------------------------------------------------------------- account

  Future<void> sendCode(String email) async {
    await _client!.auth.signInWithOtp(email: email.trim());
  }

  Future<void> verifyCode(String email, String code) async {
    await _client!.auth.verifyOTP(type: OtpType.email, email: email.trim(), token: code.trim());
  }

  Future<void> signOut() async {
    await _client?.auth.signOut();
    state = const SyncStatus(SyncPhase.signedOut);
  }
}

final syncControllerProvider = NotifierProvider<SyncController, SyncStatus>(SyncController.new);
