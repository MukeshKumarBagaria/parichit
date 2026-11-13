/// Build-time configuration, injected with
/// `flutter run --dart-define-from-file=env/dev.json`.
///
/// Secrets never live in source control: `env/*.json` is git-ignored and
/// `env/example.json` documents the expected keys. The Supabase publishable
/// key is safe to ship in the app because every table is protected by RLS.
abstract final class AppConfig {
  static const supabaseUrl = String.fromEnvironment('SUPABASE_URL');
  static const supabasePublishableKey = String.fromEnvironment('SUPABASE_PUBLISHABLE_KEY');

  /// Without Supabase configuration the app runs fully local-only.
  static bool get isCloudConfigured => supabaseUrl.isNotEmpty && supabasePublishableKey.isNotEmpty;
}
