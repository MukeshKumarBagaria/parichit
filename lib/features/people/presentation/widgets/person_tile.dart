import 'package:flutter/material.dart';
import 'package:kinship/kinship.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../shared/widgets/person_avatar.dart';
import '../../../../shared/widgets/relation_chip.dart';
import '../../domain/person.dart';

/// One row in people lists: avatar · name (+ other script) · relation · phone.
class PersonTile extends StatelessWidget {
  const PersonTile({required this.person, this.onTap, super.key});

  final Person person;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final name = person.isDeceased ? '${l10n.personLatePrefix} ${person.fullName}' : person.fullName;
    final subtitle = [person.fullNameAlt, person.primaryPhone].whereType<String>().join(' · ');

    return ListTile(
      onTap: onTap,
      leading: Hero(
        tag: 'avatar-${person.id}',
        child: PersonAvatar(
          personId: person.id,
          name: person.fullName,
          isPlaceholder: person.isPlaceholder,
          isDeceased: person.isDeceased,
        ),
      ),
      title: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis),
      subtitle: subtitle.isEmpty
          ? null
          : Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
      // Milestone 3 replaces this with the computed relation-to-me chip.
      trailing: person.isSelf ? RelationChip(label: l10n.relationYou, side: RelationSide.direct) : null,
    );
  }
}
