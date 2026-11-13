import 'package:parichit/core/sync/sync_engine.dart';

/// In-memory stand-in for Supabase: assigns `server_seq`, applies
/// last-write-wins on `updated_at`, and can reject chosen ids.
class FakeRemote implements SyncRemote {
  final tables = <String, Map<String, Map<String, Object?>>>{};
  final rejectIds = <String>{};
  var seq = 0;
  var offline = false;

  @override
  Future<void> upsert(String table, List<Map<String, Object?>> rows) async {
    if (offline) throw Exception('offline');
    if (rows.any((r) => rejectIds.contains(r['id']))) throw const SyncRejected('P0001', 'GENEALOGY_CYCLE');
    final t = tables.putIfAbsent(table, () => {});
    for (final r in rows) {
      final old = t[r['id']];
      if (old != null && (r['updated_at']! as String).compareTo(old['updated_at']! as String) < 0) continue;
      t[r['id']! as String] = {...r, 'server_seq': ++seq, 'owner_id': 'owner'};
    }
  }

  @override
  Future<List<Map<String, dynamic>>> pull(String table, int afterSeq, int limit) async {
    if (offline) throw Exception('offline');
    final rows =
        (tables[table]?.values ?? const <Map<String, Object?>>[])
            .where((r) => (r['server_seq']! as int) > afterSeq)
            .toList()
          ..sort((a, b) => (a['server_seq']! as int).compareTo(b['server_seq']! as int));
    return rows.take(limit).map(Map<String, dynamic>.from).toList();
  }
}
