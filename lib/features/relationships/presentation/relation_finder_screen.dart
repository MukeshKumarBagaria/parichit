import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinship/kinship.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../core/theme/relation_colors.dart';
import '../../../shared/widgets/empty_state.dart';
import '../../../shared/widgets/person_avatar.dart';
import '../../../shared/widgets/section_card.dart';
import '../../people/domain/person.dart';
import '../../people/presentation/people_providers.dart';
import 'person_picker_sheet.dart';
import 'relation_text.dart';
import 'relationship_providers.dart';
import 'widgets/relation_path_view.dart';

/// Relationship finder (blueprint §10, screen 8): pick two people and see how
/// they are connected, with the full chain and alternative paths.
class RelationFinderScreen extends ConsumerStatefulWidget {
  const RelationFinderScreen({this.initialA, this.initialB, super.key});

  final String? initialA;
  final String? initialB;

  @override
  ConsumerState<RelationFinderScreen> createState() => _RelationFinderScreenState();
}

class _RelationFinderScreenState extends ConsumerState<RelationFinderScreen> {
  late String? _a = widget.initialA;
  late String? _b = widget.initialB;
  bool _includeSocial = true;

  Future<void> _pick({required bool first}) async {
    final picked = await showPersonPicker(
      context,
      title: first ? context.l10n.finderPersonA : context.l10n.finderPersonB,
      allowCreate: false,
    );
    if (picked case PickedExisting(:final person)) {
      setState(() => first ? _a = person.id : _b = person.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final self = ref.watch(selfPersonProvider).value;
    final a = _a ?? self?.id;
    final people = ref.watch(peopleByIdProvider).value ?? const <String, Person>{};
    final graph = ref.watch(familyGraphProvider).value;

    final paths = (graph != null && a != null && _b != null && a != _b)
        ? PathFinder(graph).findAll(a, _b!, includeSocial: _includeSocial)
        : const <KinPath>[];

    return Scaffold(
      appBar: AppBar(title: Text(l10n.relationFinderTitle)),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Row(
            children: [
              Expanded(
                child: _PersonSlot(
                  label: l10n.finderPersonA,
                  person: people[a],
                  onTap: () => _pick(first: true),
                ),
              ),
              IconButton(
                tooltip: l10n.finderSwap,
                icon: const Icon(Icons.swap_horiz),
                onPressed: () => setState(() {
                  final t = a;
                  _a = _b;
                  _b = t;
                }),
              ),
              Expanded(
                child: _PersonSlot(
                  label: l10n.finderPersonB,
                  person: people[_b],
                  onTap: () => _pick(first: false),
                ),
              ),
            ],
          ),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.finderIncludeFriends),
            value: _includeSocial,
            onChanged: (v) => setState(() => _includeSocial = v),
          ),
          const SizedBox(height: AppSpacing.sm),
          if (a != null && _b != null && paths.isEmpty)
            EmptyState(icon: Icons.link_off, title: l10n.finderNotConnected)
          else
            for (final (i, path) in paths.indexed) ...[
              if (i == 1)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: AppSpacing.sm),
                  child: Text(l10n.finderAlternatives, style: Theme.of(context).textTheme.titleMedium),
                ),
              _PathCard(start: a!, path: path, people: people, highlighted: i == 0),
              const SizedBox(height: AppSpacing.md),
            ],
        ],
      ),
    );
  }
}

class _PersonSlot extends StatelessWidget {
  const _PersonSlot({required this.label, required this.person, required this.onTap});

  final String label;
  final Person? person;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.sm),
          child: Column(
            children: [
              if (person == null)
                const CircleAvatar(radius: 24, child: Icon(Icons.person_search))
              else
                PersonAvatar(personId: person!.id, name: person!.fullName, radius: 24),
              const SizedBox(height: AppSpacing.xs),
              Text(
                person?.fullName ?? context.l10n.finderSelect,
                maxLines: 2,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              Text(label, style: theme.textTheme.labelSmall?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            ],
          ),
        ),
      ),
    );
  }
}

class _PathCard extends StatelessWidget {
  const _PathCard({required this.start, required this.path, required this.people, required this.highlighted});

  final String start;
  final KinPath path;
  final Map<String, Person> people;
  final bool highlighted;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final name = RelationNamer.name(path);
    final color = context.relationColors.of(name.side).foreground;
    final ancestor = path.commonAncestorId == null ? null : people[path.commonAncestorId];
    final from = people[start]?.fullName ?? '';
    final to = people[path.personIds.last]?.fullName ?? '';
    return SectionCard(
      title: '$to → $from',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            context.relationLabel(name),
            style: (highlighted ? theme.textTheme.headlineSmall : theme.textTheme.titleLarge)?.copyWith(color: color),
          ),
          Text(context.relationDetail(name), style: theme.textTheme.bodyMedium),
          if (ancestor != null && ancestor.id != start) ...[
            const SizedBox(height: AppSpacing.xxs),
            Text(context.l10n.finderCommonAncestor(ancestor.fullName), style: theme.textTheme.bodySmall),
          ],
          const SizedBox(height: AppSpacing.md),
          RelationPathView(startId: start, path: path, people: people),
        ],
      ),
    );
  }
}
