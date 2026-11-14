import 'package:supabase_flutter/supabase_flutter.dart';

/// Error from the cloud, already classified so the engine never needs to know
/// about Supabase types.
class SyncRemoteException implements Exception {
  const SyncRemoteException({required this.transient, this.code, this.message});

  /// Network/server trouble: keep the data and retry later. When false the
  /// server *rejected* the change (validation, constraint, RLS).
  final bool transient;
  final String? code;
  final String? message;

  /// Postgres unique violation (e.g. the same family edge made on two devices).
  bool get isUniqueViolation => code == '23505';

  @override
  String toString() => 'SyncRemoteException(${transient ? 'transient' : 'rejected'}, $code, $message)';
}

/// The few cloud operations the sync engine needs. Faked in tests.
abstract class SyncRemote {
  /// Batched upsert (`on_conflict=id`). The server trigger enforces
  /// last-write-wins, so stale rows are silently ignored.
  Future<void> upsert(String table, List<Map<String, Object?>> rows);

  /// Rows with `server_seq > afterSeq`, ascending, at most [limit].
  Future<List<Map<String, Object?>>> fetchChanges(String table, int afterSeq, int limit);
}

class SupabaseSyncRemote implements SyncRemote {
  SupabaseSyncRemote(this._client);

  final SupabaseClient _client;

  @override
  Future<void> upsert(String table, List<Map<String, Object?>> rows) => _guard(
    () => _client.from(table).upsert(rows, onConflict: 'id', defaultToNull: false),
  );

  @override
  Future<List<Map<String, Object?>>> fetchChanges(String table, int afterSeq, int limit) => _guard(() async {
    final data = await _client.from(table).select().gt('server_seq', afterSeq).order('server_seq').limit(limit);
    return [for (final row in data) Map<String, Object?>.from(row)];
  });

  Future<T> _guard<T>(Future<T> Function() action) async {
    try {
      return await action();
    } on PostgrestException catch (e) {
      throw SyncRemoteException(transient: _isTransient(e), code: e.code, message: e.message);
    } on SyncRemoteException {
      rethrow;
    } catch (e) {
      // Socket/timeout/TLS/auth-refresh failures: all "try again later".
      throw SyncRemoteException(transient: true, message: e.toString());
    }
  }

  /// HTTP-status style codes (>= 500, 401, 408, 429) and PostgREST connection
  /// or JWT codes are retryable; Postgres SQLSTATE codes (23xxx, P0001, 42501…)
  /// mean the server understood and refused the change.
  static bool _isTransient(PostgrestException e) {
    final code = e.code ?? '';
    final status = int.tryParse(code);
    if (status != null) return status >= 500 || status == 401 || status == 408 || status == 429;
    return code == 'PGRST301' || code == 'PGRST000' || code == 'PGRST001' || code == 'PGRST002' || code == 'PGRST003';
  }
}
