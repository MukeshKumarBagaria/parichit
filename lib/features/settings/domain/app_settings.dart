import 'package:flutter/material.dart';

/// Device-level preferences. Stored in the local `kv_settings` table and
/// never synced (each phone can use its own language and theme).
@immutable
final class AppSettings {
  const AppSettings({
    this.languageCode,
    this.themeMode = ThemeMode.system,
    this.onboardingComplete = false,
  });

  /// `en`, `hi`, or `null` to follow the phone's language.
  final String? languageCode;
  final ThemeMode themeMode;
  final bool onboardingComplete;

  Locale? get locale => languageCode == null ? null : Locale(languageCode!);

  AppSettings copyWith({
    String? Function()? languageCode,
    ThemeMode? themeMode,
    bool? onboardingComplete,
  }) => AppSettings(
    languageCode: languageCode != null ? languageCode() : this.languageCode,
    themeMode: themeMode ?? this.themeMode,
    onboardingComplete: onboardingComplete ?? this.onboardingComplete,
  );

  @override
  bool operator ==(Object other) =>
      other is AppSettings &&
      other.languageCode == languageCode &&
      other.themeMode == themeMode &&
      other.onboardingComplete == onboardingComplete;

  @override
  int get hashCode => Object.hash(languageCode, themeMode, onboardingComplete);
}
