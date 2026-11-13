import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

import '../../features/people/domain/person.dart';
import 'l10n.dart';

/// Locale-aware date formatting (Hindi month names in Hindi UI).
extension DateFormattingX on BuildContext {
  String get _locale => Localizations.localeOf(this).toLanguageTag();

  String formatDate(DateTime d) => DateFormat.yMMMd(_locale).format(d);

  String formatDateTime(DateTime d) => '${DateFormat.yMMMd(_locale).format(d)}, ${DateFormat.jm(_locale).format(d)}';

  String formatMonthYear(DateTime d) => DateFormat.yMMMM(_locale).format(d);

  String formatDayMonth(DateTime d) => DateFormat.MMMd(_locale).format(d);

  /// "12 Mar 1955", "Mar 1955", "1955", with "~" when approximate.
  String formatPartialDate(PartialDate p) {
    final text = switch ((p.month, p.day)) {
      (final m?, final d?) => DateFormat.yMMMd(_locale).format(DateTime(p.year, m, d)),
      (final m?, null) => DateFormat.yMMM(_locale).format(DateTime(p.year, m)),
      _ => '${p.year}',
    };
    return p.approximate ? '~$text' : text;
  }

  /// "Today", "Tomorrow", "In 5 days", or a date.
  String relativeDay(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final diff = DateTime(date.year, date.month, date.day).difference(today).inDays;
    final l = l10n;
    if (diff == 0) return l.dayToday;
    if (diff == 1) return l.dayTomorrow;
    if (diff == -1) return l.dayYesterday;
    if (diff > 1 && diff < 7) return l.dayInDays(diff);
    return formatDayMonth(date);
  }
}
