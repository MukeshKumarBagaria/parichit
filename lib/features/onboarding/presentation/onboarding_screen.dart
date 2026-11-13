import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:kinship/kinship.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/theme/app_tokens.dart';
import '../../people/domain/person.dart';
import '../../people/presentation/people_providers.dart';
import '../../people/presentation/widgets/gender_selector.dart';
import '../../settings/presentation/settings_providers.dart';

/// First launch: pick a language, then create your own profile ("Me"), which
/// anchors every computed relation. The router leaves onboarding as soon as
/// `onboardingComplete` becomes true.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  int _step = 0;
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _nameAlt = TextEditingController();
  Gender _gender = Gender.unknown;
  bool _saving = false;

  @override
  void dispose() {
    _name.dispose();
    _nameAlt.dispose();
    super.dispose();
  }

  Future<void> _finish() async {
    if (_saving || !_formKey.currentState!.validate()) return;
    setState(() => _saving = true);
    try {
      final repo = ref.read(peopleRepositoryProvider);
      // Re-running onboarding (e.g. after a crash) must not create a second "Me".
      final existing = await repo.watchSelf().first;
      if (existing == null) {
        await repo.create(
          NewPerson(fullName: _name.text, fullNameAlt: _nameAlt.text, gender: _gender, isSelf: true),
        );
      }
      await ref.read(appSettingsProvider.notifier).completeOnboarding();
    } finally {
      if (mounted) setState(() => _saving = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AnimatedSwitcher(
          duration: AppDurations.medium,
          child: _step == 0 ? _languageStep(context) : _aboutYouStep(context),
        ),
      ),
    );
  }

  Widget _languageStep(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    final current = ref.watch(appSettingsProvider).languageCode ?? Localizations.localeOf(context).languageCode;

    return Padding(
      key: const ValueKey('language'),
      padding: const EdgeInsets.all(AppSpacing.lg),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          Icon(Icons.diversity_3_rounded, size: 72, color: theme.colorScheme.primary),
          const SizedBox(height: AppSpacing.lg),
          Text(l10n.onboardingWelcomeTitle, style: theme.textTheme.headlineMedium, textAlign: TextAlign.center),
          const SizedBox(height: AppSpacing.sm),
          Text(
            l10n.onboardingWelcomeBody,
            style: theme.textTheme.bodyLarge?.copyWith(color: theme.colorScheme.onSurfaceVariant),
            textAlign: TextAlign.center,
          ),
          const Spacer(),
          Text(l10n.onboardingChooseLanguage, style: theme.textTheme.titleMedium),
          const SizedBox(height: AppSpacing.sm),
          for (final (code, label) in const [('hi', 'हिंदी'), ('en', 'English')]) ...[
            _LanguageOption(
              label: label,
              selected: current == code,
              onTap: () => ref.read(appSettingsProvider.notifier).setLanguage(code),
            ),
            const SizedBox(height: AppSpacing.xs),
          ],
          const SizedBox(height: AppSpacing.lg),
          FilledButton(
            onPressed: () => setState(() => _step = 1),
            child: Text(l10n.actionContinue),
          ),
        ],
      ),
    );
  }

  Widget _aboutYouStep(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Form(
      key: _formKey,
      child: ListView(
        key: const ValueKey('about-you'),
        padding: const EdgeInsets.all(AppSpacing.lg),
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: TextButton.icon(
              onPressed: () => setState(() => _step = 0),
              icon: const Icon(Icons.arrow_back),
              label: Text(l10n.actionBack),
            ),
          ),
          const SizedBox(height: AppSpacing.md),
          Text(l10n.onboardingAboutYouTitle, style: theme.textTheme.headlineSmall),
          const SizedBox(height: AppSpacing.xs),
          Text(
            l10n.onboardingAboutYouBody,
            style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: AppSpacing.lg),
          TextFormField(
            controller: _name,
            autofocus: true,
            textCapitalization: TextCapitalization.words,
            textInputAction: TextInputAction.next,
            decoration: InputDecoration(labelText: '${l10n.fieldFullName} *', hintText: l10n.fieldFullNameHint),
            validator: (v) => (v == null || v.trim().isEmpty) ? l10n.validationNameRequired : null,
          ),
          const SizedBox(height: AppSpacing.md),
          TextFormField(
            controller: _nameAlt,
            decoration: InputDecoration(labelText: l10n.fieldFullNameAlt, hintText: l10n.fieldFullNameAltHint),
          ),
          const SizedBox(height: AppSpacing.lg),
          Text(l10n.fieldGender, style: theme.textTheme.labelLarge),
          const SizedBox(height: AppSpacing.xs),
          GenderSelector(value: _gender, onChanged: (g) => setState(() => _gender = g)),
          const SizedBox(height: AppSpacing.xl),
          FilledButton(
            onPressed: _saving ? null : _finish,
            child: Text(l10n.actionGetStarted),
          ),
        ],
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({required this.label, required this.selected, required this.onTap});

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    return Material(
      color: selected ? scheme.primary.withValues(alpha: 0.10) : scheme.surfaceContainer,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.input),
        side: BorderSide(color: selected ? scheme.primary : scheme.outline, width: selected ? 2 : 1),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppRadius.input),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md, vertical: AppSpacing.md),
          child: Row(
            children: [
              Expanded(child: Text(label, style: Theme.of(context).textTheme.titleMedium)),
              Icon(
                selected ? Icons.radio_button_checked : Icons.radio_button_off,
                color: selected ? scheme.primary : scheme.outline,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
