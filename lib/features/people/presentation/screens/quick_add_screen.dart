import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:kinship/kinship.dart';

import '../../../../core/l10n/l10n.dart';
import '../../../../core/theme/app_tokens.dart';
import '../../../../core/utils/phone_normalizer.dart';
import '../../domain/person.dart';
import '../people_providers.dart';
import '../widgets/gender_selector.dart';

/// Quick Add (blueprint §10, screen 5): only the name is required, so a new
/// person can be saved in seconds and completed later.
class QuickAddScreen extends ConsumerStatefulWidget {
  const QuickAddScreen({super.key});

  @override
  ConsumerState<QuickAddScreen> createState() => _QuickAddScreenState();
}

class _QuickAddScreenState extends ConsumerState<QuickAddScreen> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _nameAlt = TextEditingController();
  final _phone = TextEditingController();
  final _notes = TextEditingController();
  final _nameFocus = FocusNode();
  Gender _gender = Gender.unknown;
  bool _saving = false;

  @override
  void dispose() {
    for (final c in [_name, _nameAlt, _phone, _notes]) {
      c.dispose();
    }
    _nameFocus.dispose();
    super.dispose();
  }

  Future<void> _save({required bool addAnother}) async {
    if (_saving || !_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    final messenger = ScaffoldMessenger.of(context);
    final l10n = context.l10n;
    try {
      final person = await ref
          .read(peopleRepositoryProvider)
          .create(
            NewPerson(
              fullName: _name.text,
              fullNameAlt: _nameAlt.text,
              gender: _gender,
              phone: _phone.text,
              notes: _notes.text,
            ),
          );
      await HapticFeedback.lightImpact();
      messenger.showSnackBar(SnackBar(content: Text(l10n.personSaved(person.fullName))));
      if (!mounted) return;
      if (addAnother) {
        _formKey.currentState!.reset();
        for (final c in [_name, _nameAlt, _phone, _notes]) {
          c.clear();
        }
        setState(() => _gender = Gender.unknown);
        _nameFocus.requestFocus();
      } else {
        context.pop();
      }
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: AppBar(title: Text(l10n.quickAddTitle)),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.md),
          children: [
            TextFormField(
              controller: _name,
              focusNode: _nameFocus,
              autofocus: true,
              textCapitalization: TextCapitalization.words,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: '${l10n.fieldFullName} *', hintText: l10n.fieldFullNameHint),
              validator: (v) => (v == null || v.trim().isEmpty) ? l10n.validationNameRequired : null,
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _nameAlt,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(labelText: l10n.fieldFullNameAlt, hintText: l10n.fieldFullNameAltHint),
            ),
            const SizedBox(height: AppSpacing.md),
            TextFormField(
              controller: _phone,
              keyboardType: TextInputType.phone,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                labelText: l10n.fieldPhone,
                hintText: l10n.fieldPhoneHint,
                prefixIcon: const Icon(Icons.phone_outlined),
              ),
              validator: (v) => (v == null || v.trim().isEmpty || PhoneNormalizer.normalize(v) != null)
                  ? null
                  : l10n.validationPhoneInvalid,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text(l10n.fieldGender, style: Theme.of(context).textTheme.labelLarge),
            const SizedBox(height: AppSpacing.xs),
            GenderSelector(value: _gender, onChanged: (g) => setState(() => _gender = g)),
            const SizedBox(height: AppSpacing.lg),
            TextFormField(
              controller: _notes,
              minLines: 2,
              maxLines: 5,
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(labelText: l10n.fieldNotes, hintText: l10n.fieldNotesHint),
            ),
            const SizedBox(height: AppSpacing.xl),
            FilledButton(
              onPressed: _saving ? null : () => _save(addAnother: false),
              child: Text(l10n.actionSave),
            ),
            const SizedBox(height: AppSpacing.sm),
            OutlinedButton(
              onPressed: _saving ? null : () => _save(addAnother: true),
              child: Text(l10n.actionSaveAndAddAnother),
            ),
          ],
        ),
      ),
    );
  }
}
