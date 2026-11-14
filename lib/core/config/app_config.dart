/// Build-time configuration. Override with
/// `flutter run --dart-define-from-file=env/dev.json` (e.g. to point at a
/// different Supabase project).
///
/// The URL and *publishable* key below are public by design — they ship in
/// every client build, and all data is protected by row-level security (every
/// row is readable only by its owner). Never put a secret/service-role key
/// here. `env/*.json` is git-ignored and `env/example.json` documents the keys.
abstract final class AppConfig {
  static const supabaseUrl = String.fromEnvironment(
    'SUPABASE_URL',
    defaultValue: 'https://qqjhfcibcxerkwxdfynd.supabase.co',
  );
  static const supabasePublishableKey = String.fromEnvironment(
    'SUPABASE_PUBLISHABLE_KEY',
    defaultValue: 'sb_publishable_VvGo0ZvwB8QyXdBMmjAZXw_WZxA7NyA',
  );

  /// Without Supabase configuration the app runs fully local-only.
  static bool get isCloudConfigured => supabaseUrl.isNotEmpty && supabasePublishableKey.isNotEmpty;
}
