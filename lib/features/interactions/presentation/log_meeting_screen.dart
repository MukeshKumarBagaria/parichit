import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../core/l10n/formatters.dart';
import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/person_avatar.dart';
import '../../network/presentation/network_providers.dart';
import '../../people/domain/person.dart';
import '../../places/presentation/place_field.dart';
import '../../relationships/presentation/person_picker_sheet.dart';
import '../../relationships/presentation/relationship_providers.dart';
import '../domain/interaction.dart';
import 'interaction_widgets.dart';

/// Log (or edit) a meeting with one or more people — one screen (blueprint §10).
class LogMeetingScreen extends ConsumerStatefulWidget {
  const LogMeetingScreen({this.interactionId, this.initialPersonId, super.key});

  final String? interactionId;
  final String? initialPersonId;

  @override
  ConsumerState<LogMeetingScreen> createState() => _LogMeetingScreenState();
}

class _LogMeetingScreenState extends ConsumerState<LogMeetingScreen> {
  final _title = TextEditingController();
  final _notes = TextEditingController();
  final _location = TextEditingController();
  final _followUpNote = TextEditingController();
  late final _participants = <String>[?widget.initialPersonId];
  String _type = 'in_person';
  DateTime _when = DateTime.now();
  String? _placeId;
  DateTime? _followUp;
  bool _loaded = false;
  bool _saving = false;

  @override
  void dispose() {
    for (final c in [_title, _notes, _location, _followUpNote]) {
      c.dispose();
    }
    super.dispose();
  }

  void _load(Interaction i) {
    if (_loaded) return;
    _loaded = true;
    _title.text = i.title ?? '';
    _notes.text = i.notes ?? '';
    _location.text = i.locationText ?? '';
    _participants
      ..clear()
      ..addAll(i.participantIds);
    _type = i.type;
    _when = i.occurredAt;
    _placeId = i.placeId;
    _followUp = i.followUpOn;
  }

  Future<void> _addParticipant() async {
    final picked = await showPersonPicker(
      context,
      title: context.l10n.meetingAddPerson,
      excludeIds: _participants.toSet(),
    );
    if (picked == null || !mounted) return;
    final id = switch (picked) {
      PickedExisting(:final person) => person.id,
      PickedNew(:final person) => await ref.read(graphRepositoryProvider).createPerson(person),
    };
    setState(() => _participants.add(id));
  }

  Future<void> _pickWhen() async {
    final date = await showDatePicker(
      context: context,
      initialDate: _when,
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 365)),
    );
    if (date == null || !mounted) return;
    final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(_when));
    setState(
      () => _when = DateTime(date.year, date.month, date.day, time?.hour ?? _when.hour, time?.minute ?? _when.minute),
    );
  }

  Future<void> _save() async {
    final l10n = context.l10n;
    if (_participants.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(l10n.meetingNeedsPerson)));
      return;
    }
    setState(() => _saving = true);
    final draft = InteractionDraft(
      type: _type,
      occurredAt: _when,
      participantIds: List.of(_participants),
      title: _title.text,
      placeId: _placeId,
      locationText: _location.text,
      notes: _notes.text,
      followUpOn: _followUp,
      followUpNote: _followUpNote.text,
    );
    final repo = ref.read(interactionsRepositoryProvider);
    if (widget.interactionId == null) {
      await repo.create(draft);
    } else {
      await repo.update(widget.interactionId!, draft);
    }
    if (mounted) context.pop();
  }

  Future<void> _delete() async {
    await ref.read(interactionsRepositoryProvider).delete(widget.interactionId!);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    if (widget.interactionId != null) {
      final existing = ref.watch(interactionProvider(widget.interactionId!)).value;
      if (existing != null) _load(existing);
    }
    final people = ref.watch(peopleByIdProvider).value ?? const <String, Person>{};

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.interactionId == null ? l10n.homeLogMeeting : l10n.meetingEdit),
        actions: [
          if (widget.interactionId != null)
            IconButton(tooltip: l10n.actionDelete, icon: const Icon(Icons.delete_outline), onPressed: _delete),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(l10n.meetingWho, style: Theme.of(context).textTheme.labelLarge),
          const SizedBox(height: AppSpacing.xs),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              for (final id in _participants)
                InputChip(
                  avatar: PersonAvatar(personId: id, name: people[id]?.fullName ?? '?', radius: 12),
                  label: Text(people[id]?.fullName ?? '…'),
                  onDeleted: () => setState(() => _participants.remove(id)),
                ),
              ActionChip(avatar: const Icon(Icons.add), label: Text(l10n.meetingAddPerson), onPressed: _addParticipant),
            ],
          ),
          const SizedBox(height: AppSpacing.lg),
          Wrap(
            spacing: AppSpacing.xs,
            runSpacing: AppSpacing.xs,
            children: [
              for (final t in interactionTypes)
                ChoiceChip(
                  avatar: Icon(interactionIcon(t), size: 18),
                  label: Text(context.interactionTypeLabel(t)),
                  selected: _type == t,
                  onSelected: (_) => setState(() => _type = t),
                ),
            ],
          ),
          const SizedBox(height: AppSpacing.md),
          ListTile(
            contentPadding: EdgeInsets.zero,
            leading: const Icon(Icons.schedule),
            title: Text(context.formatDateTime(_when)),
            trailing: const Icon(Icons.edit_calendar_outlined),
            onTap: _pickWhen,
          ),
          PlaceField(
            label: l10n.meetingWhere,
            placeId: _placeId,
            onChanged: (id) => setState(() => _placeId = id),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _location,
            decoration: InputDecoration(labelText: l10n.meetingLocationDetail),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _title,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(labelText: l10n.meetingTitle, hintText: l10n.meetingTitleHint),
          ),
          const SizedBox(height: AppSpacing.md),
          TextField(
            controller: _notes,
            minLines: 3,
            maxLines: 8,
            textCapitalization: TextCapitalization.sentences,
            decoration: InputDecoration(labelText: l10n.fieldNotes, hintText: l10n.meetingNotesHint),
          ),
          const SizedBox(height: AppSpacing.md),
          SwitchListTile(
            contentPadding: EdgeInsets.zero,
            title: Text(l10n.meetingFollowUp),
            subtitle: _followUp == null ? null : Text(context.formatDate(_followUp!)),
            value: _followUp != null,
            onChanged: (on) async {
              if (!on) return setState(() => _followUp = null);
              final picked = await showDatePicker(
                context: context,
                initialDate: DateTime.now().add(const Duration(days: 7)),
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
              );
              if (picked != null) setState(() => _followUp = picked);
            },
          ),
          if (_followUp != null)
            TextField(
              controller: _followUpNote,
              decoration: InputDecoration(labelText: l10n.meetingFollowUpNote),
            ),
          const SizedBox(height: AppSpacing.xl),
          FilledButton(onPressed: _saving ? null : _save, child: Text(l10n.actionSave)),
        ],
      ),
    );
  }
}
