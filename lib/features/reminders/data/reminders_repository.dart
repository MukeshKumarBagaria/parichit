import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/sync/outbox_writer.dart';
import '../../../core/utils/id_generator.dart';
import '../../people/domain/person.dart';
import '../domain/upcoming.dart';

/// Manual reminders (follow-ups) plus the marriage dates used for
/// anniversary reminders.
class RemindersRepository {
  RemindersRepository({required this._db, required this._outbox, required this._ids, DateTime Function()? clock})
    : _clock = clock ?? (() => DateTime.now().toUtc());

  final AppDatabase _db;
  final OutboxWriter _outbox;
  final IdGenerator _ids;
  final DateTime Function() _clock;

  /// Open (not completed) reminders, soonest first.
  Stream<List<ReminderInfo>> watchOpen() =>
      (_db.select(_db.reminders)
            ..where((r) => r.deletedAt.isNull() & r.completedAt.isNull())
            ..orderBy([(r) => OrderingTerm.asc(r.dueAt)]))
          .watch()
          .map(
            (rows) => [
              for (final r in rows)
                ReminderInfo(
                  id: r.id,
                  title: r.title,
                  dueAt: r.dueAt,
                  personId: r.personId,
                  notes: r.notes,
                  recurrence: r.recurrence,
                ),
            ],
          );

  Stream<List<MarriageDate>> watchMarriageDates() =>
      (_db.select(_db.partnerships)..where(
            (p) =>
                p.deletedAt.isNull() &
                p.startYear.isNotNull() &
                p.startMonth.isNotNull() &
                p.startDay.isNotNull() &
                p.status.isIn(['active', 'widowed']),
          ))
          .watch()
          .map(
            (rows) => [
              for (final r in rows)
                MarriageDate(
                  aId: r.personAId,
                  bId: r.personBId,
                  date: PartialDate(year: r.startYear!, month: r.startMonth, day: r.startDay),
                ),
            ],
          );

  Future<void> create({
    required String title,
    required DateTime dueAt,
    String? personId,
    String recurrence = 'none',
    String? notes,
  }) => _db.transaction(() async {
    final now = _clock();
    final row = ReminderRow(
      id: _ids.newId(),
      createdAt: now,
      updatedAt: now,
      serverSeq: 0,
      personId: personId,
      reminderType: 'custom',
      title: title.trim(),
      dueAt: dueAt.toUtc(),
      recurrence: recurrence,
      notes: notes,
    );
    await _db.into(_db.reminders).insert(row);
    await _outbox.enqueue(_db.reminders, row.id, row);
  });

  /// Completes a reminder; repeating ones move to their next date instead.
  Future<void> complete(String id) => _db.transaction(() async {
    final now = _clock();
    final r = await (_db.select(_db.reminders)..where((x) => x.id.equals(id))).getSingle();
    final next = switch (r.recurrence) {
      'weekly' => r.dueAt.add(const Duration(days: 7)),
      'monthly' => DateTime.utc(r.dueAt.year, r.dueAt.month + 1, r.dueAt.day, r.dueAt.hour, r.dueAt.minute),
      'yearly' => DateTime.utc(r.dueAt.year + 1, r.dueAt.month, r.dueAt.day, r.dueAt.hour, r.dueAt.minute),
      _ => null,
    };
    final row = next == null
        ? r.copyWith(completedAt: Value(now), updatedAt: now)
        : r.copyWith(dueAt: next, updatedAt: now);
    await _db.update(_db.reminders).replace(row);
    await _outbox.enqueue(_db.reminders, id, row);
  });

  Future<void> delete(String id) => _db.transaction(() async {
    final now = _clock();
    final r = await (_db.select(_db.reminders)..where((x) => x.id.equals(id))).getSingle();
    final row = r.copyWith(deletedAt: Value(now), updatedAt: now);
    await _db.update(_db.reminders).replace(row);
    await _outbox.enqueue(_db.reminders, id, row);
  });

  /// Sets the marriage date of a couple (used by the edit flow).
  Future<void> setMarriageDate(String a, String b, PartialDate? date) => _db.transaction(() async {
    final rows =
        await (_db.select(_db.partnerships)..where(
              (e) =>
                  e.deletedAt.isNull() &
                  ((e.personAId.equals(a) & e.personBId.equals(b)) | (e.personAId.equals(b) & e.personBId.equals(a))),
            ))
            .get();
    for (final r in rows) {
      final row = r.copyWith(
        startYear: Value(date?.year),
        startMonth: Value(date?.month),
        startDay: Value(date?.day),
        startDateApprox: date?.approximate ?? false,
        updatedAt: _clock(),
      );
      await _db.update(_db.partnerships).replace(row);
      await _outbox.enqueue(_db.partnerships, row.id, row);
    }
  });
}
