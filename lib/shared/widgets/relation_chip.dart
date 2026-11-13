import 'package:flutter/material.dart';
import 'package:kinship/kinship.dart';

import '../../core/theme/app_tokens.dart';
import '../../core/theme/relation_colors.dart';

/// Small coloured label describing how a person is related to you, coloured
/// by family side (paternal, maternal, in-laws …). Always includes text, so
/// colour is never the only signal.
class RelationChip extends StatelessWidget {
  const RelationChip({required this.label, required this.side, this.onTap, super.key});

  final String label;
  final RelationSide side;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final colors = context.relationColors.of(side);
    return Material(
      color: colors.background,
      shape: const StadiumBorder(),
      child: InkWell(
        customBorder: const StadiumBorder(),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.sm, vertical: AppSpacing.xxs + 2),
          child: Text(
            label,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: colors.foreground,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
