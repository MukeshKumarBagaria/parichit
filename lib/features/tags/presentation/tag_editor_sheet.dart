import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../network/presentation/network_providers.dart';
import '../../relationships/presentation/relation_text.dart';

/// Choose a person's tags; new tags can be created inline.
Future<void> showTagEditor(BuildContext context, WidgetRef ref, String personId) async {
  final repo = ref.read(tagsRepositoryProvider);
  await repo.ensureDefaults();
  if (!context.mounted) return;
  final current = {...?ref.read(tagAssignmentsProvider).value?[personId]};
  final result = await showModalBottomSheet<Set<String>>(
    context: context,
    isScrollControlled: true,
    useSafeArea: true,
    builder: (_) => _TagEditor(initial: current),
  );
  if (result != null) await repo.setTags(personId, result);
}

class _TagEditor extends ConsumerStatefulWidget {
  const _TagEditor({required this.initial});

  final Set<String> initial;

  @override
  ConsumerState<_TagEditor> createState() => _TagEditorState();
}

class _TagEditorState extends ConsumerState<_TagEditor> {
  late final _selected = {...widget.initial};
  final _newTag = TextEditingController();

  @override
  void dispose() {
    _newTag.dispose();
    super.dispose();
  }

  Future<void> _create() async {
    final name = _newTag.text.trim();
    if (name.isEmpty) return;
    final tag = await ref.read(tagsRepositoryProvider).create(name);
    setState(() {
      _selected.add(tag.id);
      _newTag.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final tags = ref.watch(tagsProvider).value ?? const [];
    return Padding(
      padding: EdgeInsets.fromLTRB(
        AppSpacing.md,
        0,
        AppSpacing.md,
        MediaQuery.viewInsetsOf(context).bottom + AppSpacing.md,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(l10n.tagsEdit, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.sm),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              for (final t in tags)
                FilterChip(
                  label: Text(context.isHindi ? (t.nameAlt ?? t.name) : t.name),
                  selected: _selected.contains(t.id),
                  onSelected: (v) => setState(() => v ? _selected.add(t.id) : _selected.remove(t.id)),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _newTag,
            decoration: InputDecoration(
              labelText: l10n.tagsNew,
              suffixIcon: IconButton(icon: const Icon(Icons.add), onPressed: _create),
            ),
            onSubmitted: (_) => _create(),
          ),
          const SizedBox(height: AppSpacing.md),
          FilledButton(onPressed: () => Navigator.pop(context, _selected), child: Text(l10n.actionSave)),
        ],
      ),
    );
  }
}
