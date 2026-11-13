import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../core/l10n/l10n.dart';
import '../../core/theme/app_tokens.dart';
import '../../features/people/domain/person.dart';

/// Year (required) · month (optional) · day (optional) · approximate.
/// Lets users record "born around 1955" or "March 1955" (blueprint §2.1).
class PartialDateField extends StatefulWidget {
  const PartialDateField({required this.label, required this.value, required this.onChanged, super.key});

  final String label;
  final PartialDate? value;
  final ValueChanged<PartialDate?> onChanged;

  @override
  State<PartialDateField> createState() => _PartialDateFieldState();
}

class _PartialDateFieldState extends State<PartialDateField> {
  late final _year = TextEditingController(text: widget.value?.year.toString() ?? '');
  late int? _month = widget.value?.month;
  late int? _day = widget.value?.day;
  late bool _approx = widget.value?.approximate ?? false;

  @override
  void dispose() {
    _year.dispose();
    super.dispose();
  }

  void _emit() {
    final y = int.tryParse(_year.text.trim());
    if (y == null || y < 1000 || y > 2200) {
      widget.onChanged(null);
      return;
    }
    final maxDay = _month == null ? 31 : DateUtils.getDaysInMonth(y, _month!);
    if (_day != null && _day! > maxDay) _day = maxDay;
    widget.onChanged(PartialDate(year: y, month: _month, day: _month == null ? null : _day, approximate: _approx));
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final locale = Localizations.localeOf(context).toLanguageTag();
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.label, style: theme.textTheme.labelLarge),
        const SizedBox(height: AppSpacing.xs),
        Row(
          children: [
            Expanded(
              flex: 3,
              child: TextField(
                controller: _year,
                keyboardType: TextInputType.number,
                maxLength: 4,
                decoration: InputDecoration(labelText: l10n.dateYear, counterText: ''),
                onChanged: (_) => _emit(),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              flex: 4,
              child: DropdownButtonFormField<int?>(
                initialValue: _month,
                isExpanded: true,
                decoration: InputDecoration(labelText: l10n.dateMonth),
                items: [
                  DropdownMenuItem(value: null, child: Text(l10n.dateUnknown)),
                  for (var m = 1; m <= 12; m++)
                    DropdownMenuItem(value: m, child: Text(DateFormat.MMMM(locale).format(DateTime(2000, m)))),
                ],
                onChanged: (v) => setState(() {
                  _month = v;
                  if (v == null) _day = null;
                  _emit();
                }),
              ),
            ),
            const SizedBox(width: AppSpacing.xs),
            Expanded(
              flex: 3,
              child: DropdownButtonFormField<int?>(
                initialValue: _day,
                isExpanded: true,
                decoration: InputDecoration(labelText: l10n.dateDay),
                items: [
                  DropdownMenuItem(value: null, child: Text(l10n.dateUnknown)),
                  if (_month != null)
                    for (var d = 1; d <= 31; d++) DropdownMenuItem(value: d, child: Text('$d')),
                ],
                onChanged: _month == null
                    ? null
                    : (v) => setState(() {
                        _day = v;
                        _emit();
                      }),
              ),
            ),
          ],
        ),
        CheckboxListTile(
          contentPadding: EdgeInsets.zero,
          dense: true,
          controlAffinity: ListTileControlAffinity.leading,
          title: Text(l10n.dateApproximate),
          value: _approx,
          onChanged: (v) => setState(() {
            _approx = v ?? false;
            _emit();
          }),
        ),
      ],
    );
  }
}
