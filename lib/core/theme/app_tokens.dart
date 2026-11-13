import 'package:flutter/material.dart';

/// Raw design tokens from the blueprint (section 9). Widgets should not use
/// these directly — read colours from `Theme.of(context).colorScheme` or
/// [RelationColors] so light/dark themes keep working.
abstract final class AppPalette {
  // Brand
  static const peacockTeal = Color(0xFF0F6E6E);
  static const peacockTealDark = Color(0xFF5FD4CF);
  static const marigold = Color(0xFFE8913A);
  static const marigoldDark = Color(0xFFF5B26B);

  // Surfaces
  static const ivory = Color(0xFFFBF8F3);
  static const white = Color(0xFFFFFFFF);
  static const ink = Color(0xFF1E2328);
  static const night = Color(0xFF121416);
  static const nightContainer = Color(0xFF1C1F22);
  static const mist = Color(0xFFE6E8EA);
  static const sand = Color(0xFFD9D3C9);
  static const slateLine = Color(0xFF3A3F44);

  // Feedback
  static const error = Color(0xFFC0392B);
  static const errorDark = Color(0xFFFF8A80);

  // Relation sides
  static const directIndigo = Color(0xFF4F5BD5);
  static const paternalTeal = Color(0xFF0F6E6E);
  static const maternalRose = Color(0xFFC2477A);
  static const inLawsAmber = Color(0xFFB7791F);
  static const socialSlate = Color(0xFF5B6B7A);
}

/// 4-pt spacing scale.
abstract final class AppSpacing {
  static const xxs = 4.0;
  static const xs = 8.0;
  static const sm = 12.0;
  static const md = 16.0;
  static const lg = 24.0;
  static const xl = 32.0;

  /// Horizontal padding of every screen.
  static const screen = EdgeInsets.symmetric(horizontal: md);
}

/// Corner radii.
abstract final class AppRadius {
  static const input = 12.0;
  static const card = 16.0;
  static const sheet = 28.0;
}

/// Motion durations.
abstract final class AppDurations {
  static const short = Duration(milliseconds: 200);
  static const medium = Duration(milliseconds: 300);
}
