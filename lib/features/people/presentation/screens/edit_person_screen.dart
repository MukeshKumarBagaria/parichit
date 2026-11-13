import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kinship/kinship.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/phone_normalizer.dart';
import '../../../../shared/widgets/partial_date_field.dart';
import '../../../places/presentation/place_field.dart';
import '../../domain/person.dart';
import '../people_providers.dart';
import '../widgets/gender_selector.dart';

/// Full edit form (blueprint §10, screen 6). Only the name is required.
class EditPersonScreen extends ConsumerStatefulWidget {
  const EditPersonScreen({required this.personId, super.key});

  final String personId;

  @override
  ConsumerState<EditPersonScreen> createState() => _EditPersonScreenState();
}

class _EditPersonScreenState extends ConsumerState<EditPersonScreen> {
  final _formKey = GlobalKey<FormState>();
  final _c = <String, TextEditingController>{};
  PersonDraft? _draft;
  Gender _gender = Gender.unknown;
  bool? _isLiving;
  PartialDate? _birth;
  PartialDate? _death;
  int? _birthOrder;
  String? _nativePlaceId;
  bool _favorite = false;
  bool _notifyBirthday = true;
  List<ContactMethod> _contacts = [];
  final _contactCtl = <TextEditingController>[];
  bool _saving = false;

  TextEditingController _ctl(String key, [String? initial]) =>
      _c.putIfAbsent(key, () => TextEditingController(text: initial ?? ''));

  @override
  void dispose() {
    for (final c in [..._c.values, ..._contactCtl]) {
      c.dispose();
    }
    super.dispose();
  }

  void _init(Person p, List<ContactMethod> contacts) {
    if (_draft != null) return;
    final d = p.toDraft();
    _draft = d;
    _ctl('name', d.fullName);
    _ctl('alt', d.fullNameAlt);
    _ctl('nick', d.nickname);
    _ctl('surname', d.surname);
    _ctl('gotra', d.gotra);
    _ctl('occupation', d.occupation);
    _ctl('organization', d.organization);
    _ctl('designation', d.designation);
    _ctl('education', d.education);
    _ctl('notes', d.notes);
    _gender = d.gender;
    _isLiving = d.isLiving;
    _birth = d.birthDate;
    _death = d.deathDate;
    _birthOrder = d.birthOrder;
    _nativePlaceId = d.nativePlaceId;
    _favorite = d.isFavorite;
    _notifyBirthday = d.notifyBirthday;
    _contacts = contacts.isEmpty ? [const ContactMethod(kind: 'phone', value: '', isPrimary: true)] : List.of(contacts);
    _contactCtl.addAll(_contacts.map((c) => TextEditingController(text: c.value)));
  }

  Future<void> _save() async {
    if (_saving || !_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    String? t(String k) => _c[k]?.text;
    final repo = ref.read(peopleRepositoryProvider);
    await repo.update(
      widget.personId,
      PersonDraft(
        fullName: t('name')!,
        fullNameAlt: t('alt'),
        nickname: t('nick'),
        surname: t('surname'),
        gender: _gender,
        isLiving: _death != null ? false : _isLiving,
        birthDate: _birth,
        birthOrder: _birthOrder,
        deathDate: _isLiving == false ? _death : null,
        gotra: t('gotra'),
        occupation: t('occupation'),
        organization: t('organization'),
        designation: t('designation'),
        education: t('education'),
        notes: t('notes'),
        nativePlaceId: _nativePlaceId,
        isFavorite: _favorite,
        notifyBirthday: _notifyBirthday,
      ),
    );
    await repo.saveContacts(widget.personId, [
      for (final (i, c) in _contacts.indexed) c.copyWith(value: _contactCtl[i].text),
    ]);
    if (mounted) context.pop();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final person = ref.watch(personProvider(widget.personId)).value;
    final contacts = ref.watch(contactsProvider(widget.personId));
    if (person == null || !contacts.hasValue) {
      return Scaffold(
        appBar: AppBar(),
        body: const Center(child: CircularProgressIndicator()),
      );
    }
    _init(person, contacts.value!);

    Widget field(String key, String label, {String? hint, TextInputType? keyboard, int lines = 1}) => Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.md),
      child: TextFormField(
        controller: _ctl(key),
        keyboardType: keyboard,
        minLines: lines,
        maxLines: lines == 1 ? 1 : lines + 3,
        textCapitalization: lines > 1 ? TextCapitalization.sentences : TextCapitalization.words,
        decoration: InputDecoration(labelText: label, hintText: hint),
      ),
    );
    Widget header(String text) => Padding(
      padding: const EdgeInsets.only(top: AppSpacing.md, bottom: AppSpacing.sm),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Theme.of(context).colorScheme.primary),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.editPersonTitle),
        actions: [TextButton(onPressed: _saving ? null : _save, child: Text(l10n.actionSave))],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            header(l10n.editSectionBasic),
            Padding(
              padding: const EdgeInsets.only(bottom: AppSpacing.md),
              child: TextFormField(
                controller: _ctl('name'),
                textCapitalization: TextCapitalization.words,
                decoration: InputDecoration(labelText: '${l10n.fieldFullName} *'),
                validator: (v) => (v == null || v.trim().isEmpty) ? l10n.validationNameRequired : null,
              ),
            ),
            field('alt', l10n.fieldFullNameAlt, hint: l10n.fieldFullNameAltHint),
            field('nick', l10n.fieldNickname, hint: l10n.fieldNicknameHint),
            field('surname', l10n.fieldSurname),
            GenderSelector(value: _gender, onChanged: (g) => setState(() => _gender = g)),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.fieldFavorite),
              value: _favorite,
              onChanged: (v) => setState(() => _favorite = v),
            ),

            header(l10n.editSectionContacts),
            for (final (i, c) in _contacts.indexed)
              Padding(
                padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: _contactCtl[i],
                        keyboardType: c.kind == 'email' ? TextInputType.emailAddress : TextInputType.phone,
                        decoration: InputDecoration(
                          labelText: c.kind == 'email' ? l10n.fieldEmail : l10n.fieldPhone,
                          prefixIcon: Icon(c.kind == 'email' ? Icons.email_outlined : Icons.phone_outlined),
                        ),
                        validator: (v) =>
                            c.kind != 'phone' || v == null || v.trim().isEmpty || PhoneNormalizer.normalize(v) != null
                            ? null
                            : l10n.validationPhoneInvalid,
                      ),
                    ),
                    if (c.kind == 'phone')
                      IconButton(
                        tooltip: l10n.fieldWhatsapp,
                        icon: Icon(Icons.chat, color: c.isWhatsapp ? Colors.green : null),
                        onPressed: () => setState(() => _contacts[i] = c.copyWith(isWhatsapp: !c.isWhatsapp)),
                      ),
                    IconButton(
                      tooltip: l10n.actionDelete,
                      icon: const Icon(Icons.remove_circle_outline),
                      onPressed: () => setState(() {
                        _contacts.removeAt(i);
                        _contactCtl.removeAt(i).dispose();
                      }),
                    ),
                  ],
                ),
              ),
            Wrap(
              spacing: AppSpacing.xs,
              children: [
                ActionChip(
                  avatar: const Icon(Icons.add),
                  label: Text(l10n.fieldPhone),
                  onPressed: () => setState(() {
                    _contacts.add(const ContactMethod(kind: 'phone', value: ''));
                    _contactCtl.add(TextEditingController());
                  }),
                ),
                ActionChip(
                  avatar: const Icon(Icons.add),
                  label: Text(l10n.fieldEmail),
                  onPressed: () => setState(() {
                    _contacts.add(const ContactMethod(kind: 'email', value: ''));
                    _contactCtl.add(TextEditingController());
                  }),
                ),
              ],
            ),

            header(l10n.editSectionLife),
            PartialDateField(label: l10n.fieldBirthDate, value: _birth, onChanged: (d) => _birth = d),
            SwitchListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(l10n.fieldNotifyBirthday),
              value: _notifyBirthday,
              onChanged: (v) => setState(() => _notifyBirthday = v),
            ),
            DropdownButtonFormField<int?>(
              initialValue: _birthOrder,
              decoration: InputDecoration(labelText: l10n.fieldBirthOrder, helperText: l10n.fieldBirthOrderHelp),
              items: [
                DropdownMenuItem(value: null, child: Text(l10n.dateUnknown)),
                for (var i = 1; i <= 12; i++) DropdownMenuItem(value: i, child: Text('$i')),
              ],
              onChanged: (v) => setState(() => _birthOrder = v),
            ),
            const SizedBox(height: AppSpacing.md),
            SegmentedButton<bool?>(
              showSelectedIcon: false,
              segments: [
                ButtonSegment(value: true, label: Text(l10n.statusLiving)),
                ButtonSegment(value: false, label: Text(l10n.statusDeceased)),
                ButtonSegment(value: null, label: Text(l10n.dateUnknown)),
              ],
              selected: {_isLiving},
              onSelectionChanged: (s) => setState(() => _isLiving = s.first),
            ),
            if (_isLiving == false) ...[
              const SizedBox(height: AppSpacing.md),
              PartialDateField(label: l10n.fieldDeathDate, value: _death, onChanged: (d) => _death = d),
            ],

            header(l10n.editSectionOrigin),
            PlaceField(
              label: l10n.fieldNativePlace,
              placeId: _nativePlaceId,
              onChanged: (id) => setState(() => _nativePlaceId = id),
            ),
            const SizedBox(height: AppSpacing.md),
            field('gotra', l10n.fieldGotra),

            header(l10n.editSectionWork),
            field('occupation', l10n.fieldOccupation),
            field('organization', l10n.fieldOrganization),
            field('designation', l10n.fieldDesignation),
            field('education', l10n.fieldEducation),

            header(l10n.personSectionNotes),
            field('notes', l10n.fieldNotes, lines: 3),
            const SizedBox(height: AppSpacing.lg),
            FilledButton(onPressed: _saving ? null : _save, child: Text(l10n.actionSave)),
          ],
        ),
      ),
    );
  }
}
