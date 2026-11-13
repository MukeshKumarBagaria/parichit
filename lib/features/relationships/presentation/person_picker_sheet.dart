import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinship/kinship.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../../shared/widgets/person_avatar.dart';
import '../../people/domain/person.dart';
import '../../people/presentation/people_providers.dart';
import '../../people/presentation/widgets/gender_selector.dart';
import 'widgets/relation_to_me_chip.dart';

/// Result of picking a person: someone already saved, or a new person.
sealed class PickedPerson {
  const PickedPerson();
}

final class PickedExisting extends PickedPerson {
  const PickedExisting(this.person);
  final Person person;
}

final class PickedNew extends PickedPerson {
  const PickedNew(this.person);
  final NewPerson person;
}

/// Bottom sheet to choose an existing person or create a new one.
Future<PickedPerson?> showPersonPicker(
  BuildContext context, {
  required String title,
  Set<String> excludeIds = const {},
  Gender suggestedGender = Gender.unknown,
  bool allowCreate = true,
}) => showModalBottomSheet<PickedPerson>(
  context: context,
  isScrollControlled: true,
  useSafeArea: true,
  builder: (_) => _PersonPicker(
    title: title,
    excludeIds: excludeIds,
    suggestedGender: suggestedGender,
    allowCreate: allowCreate,
  ),
);

class _PersonPicker extends ConsumerStatefulWidget {
  const _PersonPicker({
    required this.title,
    required this.excludeIds,
    required this.suggestedGender,
    required this.allowCreate,
  });

  final String title;
  final Set<String> excludeIds;
  final Gender suggestedGender;
  final bool allowCreate;

  @override
  ConsumerState<_PersonPicker> createState() => _PersonPickerState();
}

class _PersonPickerState extends ConsumerState<_PersonPicker> {
  final _query = TextEditingController();
  String _q = '';
  bool _creating = false;

  @override
  void dispose() {
    _query.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return DraggableScrollableSheet(
      expand: false,
      initialChildSize: 0.85,
      minChildSize: 0.5,
      maxChildSize: 0.95,
      builder: (context, scroll) => Padding(
        padding: EdgeInsets.only(bottom: MediaQuery.viewInsetsOf(context).bottom),
        child: _creating
            ? _NewPersonForm(
                initialName: _q,
                gender: widget.suggestedGender,
                onCancel: () => setState(() => _creating = false),
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: AppSpacing.screen,
                    child: Text(widget.title, style: Theme.of(context).textTheme.titleLarge),
                  ),
                  const SizedBox(height: AppSpacing.sm),
                  Padding(
                    padding: AppSpacing.screen,
                    child: TextField(
                      controller: _query,
                      autofocus: true,
                      decoration: InputDecoration(
                        hintText: l10n.pickPersonSearchHint,
                        prefixIcon: const Icon(Icons.search),
                      ),
                      onChanged: (v) => setState(() => _q = v),
                    ),
                  ),
                  if (widget.allowCreate)
                    ListTile(
                      leading: const CircleAvatar(child: Icon(Icons.person_add_alt_1)),
                      title: Text(l10n.createNewPerson),
                      subtitle: _q.trim().isEmpty ? null : Text(_q.trim()),
                      onTap: () => setState(() => _creating = true),
                    ),
                  const Divider(height: 1),
                  Expanded(child: _results(scroll)),
                ],
              ),
      ),
    );
  }

  Widget _results(ScrollController scroll) {
    final people = ref.watch(peopleSearchProvider(_q));
    return people.when(
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (e, _) => Center(child: Text('$e')),
      data: (list) {
        final filtered = list.where((p) => !widget.excludeIds.contains(p.id)).toList();
        return ListView.builder(
          controller: scroll,
          itemCount: filtered.length,
          itemBuilder: (context, i) {
            final p = filtered[i];
            return ListTile(
              leading: PersonAvatar(personId: p.id, name: p.fullName, isPlaceholder: p.isPlaceholder),
              title: Text(p.fullName),
              subtitle: p.fullNameAlt == null ? null : Text(p.fullNameAlt!),
              trailing: RelationToMeChip(personId: p.id, isSelf: p.isSelf),
              onTap: () => Navigator.pop(context, PickedExisting(p)),
            );
          },
        );
      },
    );
  }
}

class _NewPersonForm extends StatefulWidget {
  const _NewPersonForm({required this.initialName, required this.gender, required this.onCancel});

  final String initialName;
  final Gender gender;
  final VoidCallback onCancel;

  @override
  State<_NewPersonForm> createState() => _NewPersonFormState();
}

class _NewPersonFormState extends State<_NewPersonForm> {
  final _formKey = GlobalKey<FormState>();
  late final _name = TextEditingController(text: widget.initialName.trim());
  final _nameAlt = TextEditingController();
  final _phone = TextEditingController();
  late Gender _gender = widget.gender;

  @override
  void dispose() {
    _name.dispose();
    _nameAlt.dispose();
    _phone.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Form(
      key: _formKey,
      child: ListView(
        padding: const EdgeInsets.all(AppSpacing.md),
        children: [
          Text(l10n.createNewPerson, style: Theme.of(context).textTheme.titleLarge),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _name,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            decoration: InputDecoration(labelText: '${l10n.fieldFullName} *'),
            validator: (v) => (v == null || v.trim().isEmpty) ? l10n.validationNameRequired : null,
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _nameAlt,
            decoration: InputDecoration(labelText: l10n.fieldFullNameAlt),
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _phone,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(labelText: l10n.fieldPhone, prefixIcon: const Icon(Icons.phone_outlined)),
          ),
          const SizedBox(height: AppSpacing.md),
          GenderSelector(value: _gender, onChanged: (g) => setState(() => _gender = g)),
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: () {
              if (!_formKey.currentState!.validate()) return;
              Navigator.pop(
                context,
                PickedNew(
                  NewPerson(fullName: _name.text, fullNameAlt: _nameAlt.text, phone: _phone.text, gender: _gender),
                ),
              );
            },
            child: Text(l10n.actionContinue),
          ),
          TextButton(onPressed: widget.onCancel, child: Text(l10n.actionBack)),
        ],
      ),
    );
  }
}
