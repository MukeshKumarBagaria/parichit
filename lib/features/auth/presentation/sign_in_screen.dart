import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../core/l10n/l10n.dart';
import '../../../core/router/routes.dart';
import '../../../core/sync/sync_providers.dart';
import '../../../core/theme/app_tokens.dart';
import '../../people/presentation/people_providers.dart';
import '../../settings/presentation/settings_providers.dart';

/// Passwordless sign-in: email → one-time code. Used from Settings and from
/// onboarding ("restore"). Signing in is always optional.
class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  final _formKey = GlobalKey<FormState>();
  final _email = TextEditingController();
  final _code = TextEditingController();
  bool _codeSent = false;
  bool _busy = false;
  String? _error;

  @override
  void dispose() {
    _email.dispose();
    _code.dispose();
    super.dispose();
  }

  Future<void> _run(Future<void> Function() action) async {
    if (_busy || !_formKey.currentState!.validate()) return;
    setState(() {
      _busy = true;
      _error = null;
    });
    try {
      await action();
    } on AuthException catch (e) {
      if (mounted) setState(() => _error = context.l10n.signInFailed(e.message));
    } catch (e) {
      if (mounted) setState(() => _error = context.l10n.signInFailed(e.toString()));
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _sendCode() => _run(() async {
    await ref.read(supabaseClientProvider)!.auth.signInWithOtp(email: _email.text.trim());
    if (mounted) setState(() => _codeSent = true);
  });

  Future<void> _verify() => _run(() async {
    final auth = ref.read(supabaseClientProvider)!.auth;
    await auth.verifyOTP(email: _email.text.trim(), token: _code.text.trim(), type: OtpType.email);

    // Pull first so a restored account's "Me" is on this phone before we decide
    // whether onboarding is still needed.
    await ref.read(syncControllerProvider.notifier).syncNow();
    final hasSelf = await ref.read(peopleRepositoryProvider).watchSelf().first != null;
    if (hasSelf && !ref.read(appSettingsProvider).onboardingComplete) {
      await ref.read(appSettingsProvider.notifier).completeOnboarding();
    }
    if (!mounted) return;
    if (hasSelf) {
      context.go(Routes.home);
    } else if (context.canPop()) {
      context.pop();
    } else {
      context.go(Routes.onboarding);
    }
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(title: Text(l10n.signInTitle)),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: const EdgeInsets.all(AppSpacing.lg),
          children: [
            Text(
              _codeSent ? l10n.signInCodeSent(_email.text.trim()) : l10n.signInBody,
              style: theme.textTheme.bodyLarge,
            ),
            const SizedBox(height: AppSpacing.lg),
            TextFormField(
              controller: _email,
              enabled: !_codeSent && !_busy,
              keyboardType: TextInputType.emailAddress,
              autofillHints: const [AutofillHints.email],
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: l10n.signInEmailLabel),
              validator: (v) {
                final t = v?.trim() ?? '';
                return RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(t) ? null : l10n.signInEmailInvalid;
              },
              onFieldSubmitted: (_) => _codeSent ? null : _sendCode(),
            ),
            if (_codeSent) ...[
              const SizedBox(height: AppSpacing.md),
              TextFormField(
                controller: _code,
                enabled: !_busy,
                autofocus: true,
                keyboardType: TextInputType.number,
                autofillHints: const [AutofillHints.oneTimeCode],
                decoration: InputDecoration(labelText: l10n.signInCodeLabel),
                validator: (v) => RegExp(r'^\d{6,10}$').hasMatch(v?.trim() ?? '') ? null : l10n.signInCodeInvalid,
                onFieldSubmitted: (_) => _verify(),
              ),
            ],
            if (_error != null) ...[
              const SizedBox(height: AppSpacing.md),
              Text(_error!, style: theme.textTheme.bodyMedium?.copyWith(color: theme.colorScheme.error)),
            ],
            const SizedBox(height: AppSpacing.lg),
            FilledButton(
              onPressed: _busy ? null : (_codeSent ? _verify : _sendCode),
              child: _busy
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2))
                  : Text(_codeSent ? l10n.signInVerify : l10n.signInSendCode),
            ),
            if (_codeSent)
              TextButton(
                onPressed: _busy
                    ? null
                    : () => setState(() {
                        _codeSent = false;
                        _code.clear();
                        _error = null;
                      }),
                child: Text(l10n.signInChangeEmail),
              ),
          ],
        ),
      ),
    );
  }
}
