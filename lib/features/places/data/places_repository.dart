import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/sync/outbox_writer.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/utils/search_text.dart';
import '../domain/place.dart';

/// Villages, towns, districts and states — one row per place, so "Sikar" and
/// "सीकर" are the same place for filtering (blueprint §5.1).
class PlacesRepository {
  PlacesRepository({required this._db, required this._outbox, required this._ids, DateTime Function()? clock})
    : _clock = clock ?? (() => DateTime.now().toUtc());

  final AppDatabase _db;
  final OutboxWriter _outbox;
  final IdGenerator _ids;
  final DateTime Function() _clock;

  static Place _toPlace(PlaceRow r) =>
      Place(id: r.id, name: r.name, nameAlt: r.nameAlt, type: r.placeType, parentId: r.parentPlaceId);

  Stream<List<Place>> watchAll() =>
      (_db.select(_db.places)
            ..where((p) => p.deletedAt.isNull())
            ..orderBy([(p) => OrderingTerm.asc(p.name)]))
          .watch()
          .map((rows) => rows.map(_toPlace).toList());

  Future<Place?> byId(String id) async {
    final r = await (_db.select(_db.places)..where((p) => p.id.equals(id))).getSingleOrNull();
    return r == null ? null : _toPlace(r);
  }

  Future<List<Place>> search(String query, {int limit = 8}) async {
    final q = SearchText.normalize(query);
    final stmt = _db.select(_db.places)
      ..where((p) => p.deletedAt.isNull())
      ..orderBy([(p) => OrderingTerm.asc(p.name)])
      ..limit(limit);
    if (q.isNotEmpty) {
      stmt.where((p) => p.name.lower().like('%$q%') | p.nameAlt.lower().like('%$q%'));
    }
    return (await stmt.get()).map(_toPlace).toList();
  }

  /// Returns the existing place with this name (either script), or creates it.
  Future<Place> findOrCreate(String name, {String? nameAlt, String type = 'village'}) => _db.transaction(() async {
    final trimmed = name.trim();
    final existing =
        await (_db.select(_db.places)..where(
              (p) => p.deletedAt.isNull() & (p.name.lower().equals(trimmed.toLowerCase()) | p.nameAlt.equals(trimmed)),
            ))
            .getSingleOrNull();
    if (existing != null) return _toPlace(existing);
    final now = _clock();
    final row = PlaceRow(
      id: _ids.newId(),
      createdAt: now,
      updatedAt: now,
      serverSeq: 0,
      name: trimmed,
      nameAlt: nameAlt?.trim().isEmpty ?? true ? null : nameAlt!.trim(),
      placeType: type,
    );
    await _db.into(_db.places).insert(row);
    await _outbox.enqueue(_db.places, row.id, row);
    return _toPlace(row);
  });
}
