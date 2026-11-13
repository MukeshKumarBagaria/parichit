import 'package:flutter/material.dart';
import 'package:kinship/kinship.dart';

import '../../../../core/l10n/l10n.dart';

/// Segmented gender picker. "Not specified" is a valid choice — gender is
/// never forced.
class GenderSelector extends StatelessWidget {
  const GenderSelector({required this.value, required this.onChanged, super.key});

  final Gender value;
  final ValueChanged<Gender> onChanged;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return SizedBox(
      width: double.infinity,
      child: SegmentedButton<Gender>(
        showSelectedIcon: false,
        segments: [
          ButtonSegment(value: Gender.male, label: Text(l10n.genderMale)),
          ButtonSegment(value: Gender.female, label: Text(l10n.genderFemale)),
          ButtonSegment(value: Gender.unknown, label: Text(l10n.genderUnknown)),
        ],
        selected: {if (value == Gender.other) Gender.unknown else value},
        onSelectionChanged: (s) => onChanged(s.first),
      ),
    );
  }
}
