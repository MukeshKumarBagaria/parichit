import 'package:drift/drift.dart';
import 'package:meta/meta.dart';

import '../../../core/database/app_database.dart';
import '../../../core/sync/outbox_writer.dart';
import '../../../core/utils/id_generator.dart';

@immutable
final class Tag {
  const Tag({required this.id, required this.name, this.nameAlt, this.color});

  final String id;
  final String name;
  final String? nameAlt;
  final String? color;

  @override
  bool operator ==(Object other) => other is Tag && other.id == id && other.name == name && other.color == color;

  @override
  int get hashCode => Object.hash(id, name, color);
}

/// Categories such as Friend, Business, Political contact (blueprint §2.1).
class TagsRepository {
  TagsRepository({required this._db, required this._outbox, required this._ids, DateTime Function()? clock})
    : _clock = clock ?? (() => DateTime.now().toUtc());

  final AppDatabase _db;
  final OutboxWriter _outbox;
  final IdGenerator _ids;
  final DateTime Function() _clock;

  /// Suggested tags created on first use of the tag editor.
  static const defaults = [
    ('Relative', 'रिश्तेदार', '#0F6E6E'),
    ('Friend', 'मित्र', '#4F5BD5'),
    ('Business', 'व्यापार', '#B7791F'),
    ('Village', 'गाँव', '#2E7D32'),
    ('Political', 'राजनीतिक', '#C2477A'),
    ('Important', 'महत्वपूर्ण', '#C0392B'),
  ];

  static Tag _toTag(TagRow r) => Tag(id: r.id, name: r.name, nameAlt: r.nameAlt, color: r.color);

  Stream<List<Tag>> watchAll() =>
      (_db.select(_db.tags)
            ..where((t) => t.deletedAt.isNull())
            ..orderBy([(t) => OrderingTerm.asc(t.name)]))
          .watch()
          .map((rows) => rows.map(_toTag).toList());

  /// Tag ids per person id.
  Stream<Map<String, Set<String>>> watchAssignments() =>
      (_db.select(_db.personTags)..where((t) => t.deletedAt.isNull())).watch().map((rows) {
        final map = <String, Set<String>>{};
        for (final r in rows) {
          (map[r.personId] ??= {}).add(r.tagId);
        }
        return map;
      });

  Future<Tag> create(String name, {String? nameAlt, String? color}) => _db.transaction(() async {
    final existing = await (_db.select(
      _db.tags,
    )..where((t) => t.deletedAt.isNull() & t.name.lower().equals(name.trim().toLowerCase()))).getSingleOrNull();
    if (existing != null) return _toTag(existing);
    final now = _clock();
    final row = TagRow(
      id: _ids.newId(),
      createdAt: now,
      updatedAt: now,
      serverSeq: 0,
      name: name.trim(),
      nameAlt: nameAlt,
      color: color,
    );
    await _db.into(_db.tags).insert(row);
    await _outbox.enqueue(_db.tags, row.id, row);
    return _toTag(row);
  });

  Future<void> ensureDefaults() async {
    final count = await (_db.select(_db.tags)..where((t) => t.deletedAt.isNull())).get();
    if (count.isNotEmpty) return;
    for (final (name, alt, color) in defaults) {
      await create(name, nameAlt: alt, color: color);
    }
  }

  /// Replaces the tags of a person.
  Future<void> setTags(String personId, Set<String> tagIds) => _db.transaction(() async {
    final now = _clock();
    final existing = await (_db.select(
      _db.personTags,
    )..where((t) => t.personId.equals(personId) & t.deletedAt.isNull())).get();
    for (final e in existing.where((e) => !tagIds.contains(e.tagId))) {
      final row = e.copyWith(deletedAt: Value(now), updatedAt: now);
      await _db.update(_db.personTags).replace(row);
      await _outbox.enqueue(_db.personTags, row.id, row);
    }
    final have = existing.map((e) => e.tagId).toSet();
    for (final tagId in tagIds.difference(have)) {
      final row = PersonTagRow(
        id: _ids.newId(),
        createdAt: now,
        updatedAt: now,
        serverSeq: 0,
        personId: personId,
        tagId: tagId,
      );
      await _db.into(_db.personTags).insert(row);
      await _outbox.enqueue(_db.personTags, row.id, row);
    }
  });
}
