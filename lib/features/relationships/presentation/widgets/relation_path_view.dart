import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kinship/kinship.dart';

import '../../../../core/router/routes.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/theme/relation_colors.dart';
import '../../../../shared/widgets/person_avatar.dart';
import '../../../people/domain/person.dart';
import '../relation_text.dart';

/// Vertical chain of people with the relation on each link:
/// You → (father) Mahesh → (younger brother) Dinesh → (daughter) Neha.
class RelationPathView extends StatelessWidget {
  const RelationPathView({required this.startId, required this.path, required this.people, super.key});

  final String startId;
  final KinPath path;
  final Map<String, Person> people;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final color = context.relationColors.of(path.side).foreground;
    final nodes = [startId, ...path.personIds];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        for (var i = 0; i < nodes.length; i++) ...[
          _node(context, nodes[i]),
          if (i < path.steps.length)
            Padding(
              padding: const EdgeInsets.only(left: 19),
              child: Row(
                children: [
                  Container(width: 2, height: 28, color: color.withValues(alpha: 0.5)),
                  const SizedBox(width: AppSpacing.md),
                  if (kinTerms[path.steps[i].token] ?? kinTerms[path.steps[i].plainToken] case final term?)
                    Text(context.termLabel(term), style: theme.textTheme.labelMedium?.copyWith(color: color)),
                ],
              ),
            ),
        ],
      ],
    );
  }

  Widget _node(BuildContext context, String id) {
    final p = people[id];
    return InkWell(
      borderRadius: BorderRadius.circular(AppRadius.input),
      onTap: p == null ? null : () => context.push(Routes.person(id)),
      child: Row(
        children: [
          PersonAvatar(personId: id, name: p?.fullName ?? '?', radius: 20, isPlaceholder: p?.isPlaceholder ?? false),
          const SizedBox(width: AppSpacing.sm),
          Expanded(child: Text(p?.fullName ?? '?', style: Theme.of(context).textTheme.titleSmall)),
        ],
      ),
    );
  }
}
