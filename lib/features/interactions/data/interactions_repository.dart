import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/soft_delete.dart';
import '../../../core/sync/outbox_writer.dart';
import '../../../core/utils/id_generator.dart';
import '../domain/interaction.dart';

/// Meetings, calls and events (blueprint §2.4) with many participants each.
class InteractionsRepository {
  InteractionsRepository({required this._db, required this._outbox, required this._ids, DateTime Function()? clock})
    : _clock = clock ?? (() => DateTime.now().toUtc());

  final AppDatabase _db;
  final OutboxWriter _outbox;
  final IdGenerator _ids;
  final DateTime Function() _clock;

  late final _softDeleter = SoftDeleter(_db, _outbox);

  /// All interactions, newest first; only those involving [personId] if set.
  Stream<List<Interaction>> watchAll({String? personId, int? limit}) {
    final i = _db.interactions;
    final p = _db.interactionParticipants;
    final query = _db.select(i).join([
      leftOuterJoin(p, p.interactionId.equalsExp(i.id) & p.deletedAt.isNull()),
    ])..where(i.deletedAt.isNull());
    if (personId != null) {
      final ids = _db.selectOnly(p)
        ..addColumns([p.interactionId])
        ..where(p.personId.equals(personId) & p.deletedAt.isNull());
      query.where(i.id.isInQuery(ids));
    }
    query.orderBy([OrderingTerm.desc(i.occurredAt)]);
    return query.watch().map((rows) {
      final byId = <String, (InteractionRow, List<String>)>{};
      for (final r in rows) {
        final row = r.readTable(i);
        final entry = byId.putIfAbsent(row.id, () => (row, <String>[]));
        final part = r.readTableOrNull(p);
        if (part != null) entry.$2.add(part.personId);
      }
      final list = [for (final (row, people) in byId.values) _toDomain(row, people)];
      return limit == null ? list : list.take(limit).toList();
    });
  }

  Stream<Interaction?> watchById(String id) => watchAll().map((list) => list.where((x) => x.id == id).firstOrNull);

  /// Most recent meeting date per person.
  Stream<Map<String, DateTime>> watchLastMet() {
    final i = _db.interactions;
    final p = _db.interactionParticipants;
    final last = i.occurredAt.max();
    final q = _db.selectOnly(p).join([innerJoin(i, i.id.equalsExp(p.interactionId))])
      ..addColumns([p.personId, last])
      ..where(p.deletedAt.isNull() & i.deletedAt.isNull())
      ..groupBy([p.personId]);
    return q.watch().map((rows) => {for (final r in rows) r.read(p.personId)!: r.read(last)!});
  }

  Future<String> create(InteractionDraft d) => _db.transaction(() async {
    final now = _clock();
    final row = InteractionRow(
      id: _ids.newId(),
      createdAt: now,
      updatedAt: now,
      serverSeq: 0,
      title: _blank(d.title),
      interactionType: d.type,
      occurredAt: d.occurredAt.toUtc(),
      placeId: d.placeId,
      locationText: _blank(d.locationText),
      notes: _blank(d.notes),
      followUpOn: d.followUpOn == null ? null : _isoDate(d.followUpOn!),
    );
    await _db.into(_db.interactions).insert(row);
    await _outbox.enqueue(_db.interactions, row.id, row);
    await _setParticipants(row.id, d.participantIds, now);
    await _createFollowUp(row.id, d, now);
    return row.id;
  });

  Future<void> update(String id, InteractionDraft d) => _db.transaction(() async {
    final now = _clock();
    final old = await (_db.select(_db.interactions)..where((x) => x.id.equals(id))).getSingle();
    final row = old.copyWith(
      title: Value(_blank(d.title)),
      interactionType: d.type,
      occurredAt: d.occurredAt.toUtc(),
      placeId: Value(d.placeId),
      locationText: Value(_blank(d.locationText)),
      notes: Value(_blank(d.notes)),
      followUpOn: Value(d.followUpOn == null ? null : _isoDate(d.followUpOn!)),
      updatedAt: now,
    );
    await _db.update(_db.interactions).replace(row);
    await _outbox.enqueue(_db.interactions, id, row);
    await _setParticipants(id, d.participantIds, now);
    if (d.followUpOn != null && old.followUpOn != row.followUpOn) await _createFollowUp(id, d, now);
  });

  Future<void> delete(String id) => _db.transaction(() async {
    final now = _clock();
    await _softDeleter.delete(_db.interactions, (t) => t.id.equals(id), at: now);
    await _softDeleter.delete(_db.interactionParticipants, (t) => t.interactionId.equals(id), at: now);
  });

  Future<void> _setParticipants(String interactionId, List<String> personIds, DateTime now) async {
    final existing = await (_db.select(
      _db.interactionParticipants,
    )..where((p) => p.interactionId.equals(interactionId) & p.deletedAt.isNull())).get();
    final wanted = personIds.toSet();
    for (final e in existing.where((e) => !wanted.contains(e.personId))) {
      final row = e.copyWith(deletedAt: Value(now), updatedAt: now);
      await _db.update(_db.interactionParticipants).replace(row);
      await _outbox.enqueue(_db.interactionParticipants, row.id, row);
    }
    final have = existing.map((e) => e.personId).toSet();
    for (final personId in wanted.difference(have)) {
      final row = InteractionParticipantRow(
        id: _ids.newId(),
        createdAt: now,
        updatedAt: now,
        serverSeq: 0,
        interactionId: interactionId,
        personId: personId,
        role: 'participant',
      );
      await _db.into(_db.interactionParticipants).insert(row);
      await _outbox.enqueue(_db.interactionParticipants, row.id, row);
    }
  }

  Future<void> _createFollowUp(String interactionId, InteractionDraft d, DateTime now) async {
    final due = d.followUpOn;
    if (due == null) return;
    final row = ReminderRow(
      id: _ids.newId(),
      createdAt: now,
      updatedAt: now,
      serverSeq: 0,
      personId: d.participantIds.firstOrNull,
      interactionId: interactionId,
      reminderType: 'follow_up',
      title: _blank(d.followUpNote) ?? _blank(d.title) ?? 'Follow up',
      dueAt: DateTime(due.year, due.month, due.day, 9).toUtc(),
      recurrence: 'none',
    );
    await _db.into(_db.reminders).insert(row);
    await _outbox.enqueue(_db.reminders, row.id, row);
  }

  static Interaction _toDomain(InteractionRow r, List<String> people) => Interaction(
    id: r.id,
    type: r.interactionType,
    occurredAt: r.occurredAt.toLocal(),
    participantIds: people,
    title: r.title,
    placeId: r.placeId,
    locationText: r.locationText,
    notes: r.notes,
    followUpOn: r.followUpOn == null ? null : DateTime.tryParse(r.followUpOn!),
  );

  static String _isoDate(DateTime d) =>
      '${d.year.toString().padLeft(4, '0')}-${d.month.toString().padLeft(2, '0')}-${d.day.toString().padLeft(2, '0')}';

  static String? _blank(String? v) {
    final t = v?.trim();
    return t == null || t.isEmpty ? null : t;
  }
}
