import 'package:meta/meta.dart';

import '../../people/domain/person.dart';

enum UpcomingKind { birthday, anniversary, deathAnniversary, reminder }

/// Something happening on a date: a birthday, marriage anniversary, barsi
/// (death anniversary) or a manual follow-up.
@immutable
final class UpcomingItem {
  const UpcomingItem({
    required this.date,
    required this.kind,
    required this.personIds,
    this.years,
    this.title,
    this.reminderId,
    this.overdue = false,
  });

  final DateTime date;
  final UpcomingKind kind;
  final List<String> personIds;

  /// Age turning / years married / years since passing, when known.
  final int? years;
  final String? title;
  final String? reminderId;
  final bool overdue;
}

/// Manual reminder as needed for the agenda.
@immutable
final class ReminderInfo {
  const ReminderInfo({
    required this.id,
    required this.title,
    required this.dueAt,
    this.personId,
    this.notes,
    this.recurrence = 'none',
  });

  final String id;
  final String title;
  final DateTime dueAt;
  final String? personId;
  final String? notes;
  final String recurrence;
}

/// A marriage with a known date.
@immutable
final class MarriageDate {
  const MarriageDate({required this.aId, required this.bId, required this.date});

  final String aId;
  final String bId;
  final PartialDate date;
}

/// Builds the agenda. Birthdays/anniversaries are computed from people data
/// rather than stored, so they never go stale (blueprint §5.3).
abstract final class Agenda {
  static List<UpcomingItem> build({
    required DateTime today,
    required int days,
    required Iterable<Person> people,
    required Iterable<MarriageDate> marriages,
    required Iterable<ReminderInfo> reminders,
  }) {
    final start = DateTime(today.year, today.month, today.day);
    final end = start.add(Duration(days: days));
    bool inRange(DateTime d) => !d.isBefore(start) && d.isBefore(end);
    final items = <UpcomingItem>[];

    for (final p in people) {
      if (p.isPlaceholder) continue;
      final birth = p.birthDate;
      if (birth != null && !p.isDeceased && p.notifyBirthday) {
        final next = birth.nextAnniversary(start);
        if (next != null && inRange(next)) {
          items.add(
            UpcomingItem(
              date: next,
              kind: UpcomingKind.birthday,
              personIds: [p.id],
              years: birth.approximate ? null : next.year - birth.year,
            ),
          );
        }
      }
      final death = p.deathDate;
      if (death != null) {
        final next = death.nextAnniversary(start);
        if (next != null && inRange(next)) {
          items.add(
            UpcomingItem(
              date: next,
              kind: UpcomingKind.deathAnniversary,
              personIds: [p.id],
              years: next.year - death.year,
            ),
          );
        }
      }
    }
    for (final m in marriages) {
      final next = m.date.nextAnniversary(start);
      if (next != null && inRange(next)) {
        items.add(
          UpcomingItem(
            date: next,
            kind: UpcomingKind.anniversary,
            personIds: [m.aId, m.bId],
            years: next.year - m.date.year,
          ),
        );
      }
    }
    for (final r in reminders) {
      final due = r.dueAt.toLocal();
      final day = DateTime(due.year, due.month, due.day);
      if (day.isBefore(end)) {
        items.add(
          UpcomingItem(
            date: day,
            kind: UpcomingKind.reminder,
            personIds: [?r.personId],
            title: r.title,
            reminderId: r.id,
            overdue: day.isBefore(start),
          ),
        );
      }
    }
    items.sort((a, b) => a.date.compareTo(b.date));
    return items;
  }
}
