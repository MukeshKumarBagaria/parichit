import 'package:flutter/material.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../shared/widgets/person_avatar.dart';
import '../../../relationships/presentation/widgets/relation_to_me_chip.dart';
import '../../domain/person.dart';

/// One row in people lists: avatar · name (+ other script) · phone · relation to you.
class PersonTile extends StatelessWidget {
  const PersonTile({required this.person, this.onTap, this.trailing, super.key});

  final Person person;
  final VoidCallback? onTap;
  final Widget? trailing;

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
      title: Row(
        children: [
          Flexible(child: Text(name, maxLines: 1, overflow: TextOverflow.ellipsis)),
          if (person.isFavorite) ...[
            const SizedBox(width: 4),
            Icon(Icons.star, size: 16, color: theme.colorScheme.secondary),
          ],
        ],
      ),
      subtitle: subtitle.isEmpty
          ? (person.isPlaceholder ? Text(l10n.placeholderBadge) : null)
          : Text(
              subtitle,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            ),
      trailing: trailing ?? RelationToMeChip(personId: person.id, isSelf: person.isSelf),
    );
  }
}
