import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinship/kinship.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../shared/widgets/relation_chip.dart';
import '../relation_text.dart';
import '../relationship_providers.dart';

/// Chip showing how [personId] is related to you ("मामा", "Chacha", "You").
/// Renders nothing for people not connected to you.
class RelationToMeChip extends ConsumerWidget {
  const RelationToMeChip({required this.personId, this.isSelf = false, this.onTap, super.key});

  final String personId;
  final bool isSelf;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (isSelf) return RelationChip(label: context.l10n.relationYou, side: RelationSide.direct);
    final info = ref.watch(relationToMeProvider(personId));
    if (info == null) return const SizedBox.shrink();
    return RelationChip(label: context.relationLabel(info.name), side: info.name.side, onTap: onTap);
  }
}
