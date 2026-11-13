import 'package:supabase_flutter/supabase_flutter.dart';

import 'sync_engine.dart';

/// [SyncRemote] over Supabase PostgREST. RLS limits every query to the
/// signed-in owner; `owner_id` is filled in by the database default.
class SupabaseSyncRemote implements SyncRemote {
  SupabaseSyncRemote(this._client);

  final SupabaseClient _client;

  @override
  Future<void> upsert(String table, List<Map<String, Object?>> rows) async {
    try {
      await _client.from(table).upsert(rows, onConflict: 'id');
    } on PostgrestException catch (e) {
      // 08xxx = connection problems, everything else is a data/permission
      // rejection that retrying will not fix.
      if (e.code != null && e.code!.startsWith('08')) rethrow;
      throw SyncRejected(e.code ?? 'unknown', e.message);
    }
  }

  @override
  Future<List<Map<String, dynamic>>> pull(String table, int afterSeq, int limit) =>
      _client.from(table).select().gt('server_seq', afterSeq).order('server_seq', ascending: true).limit(limit);
}
