import 'package:flutter/material.dart';
import 'package:kinship/kinship.dart';

import 'app_tokens.dart';

/// Colour pair (strong foreground + tinted background) for one relation side.
@immutable
class RelationColorPair {
  const RelationColorPair({required this.foreground, required this.background});

  final Color foreground;
  final Color background;

  static RelationColorPair lerp(RelationColorPair a, RelationColorPair b, double t) => RelationColorPair(
    foreground: Color.lerp(a.foreground, b.foreground, t)!,
    background: Color.lerp(a.background, b.background, t)!,
  );
}

/// Theme extension holding the relation-chip colours for each family side.
@immutable
class RelationColors extends ThemeExtension<RelationColors> {
  const RelationColors({
    required this.direct,
    required this.paternal,
    required this.maternal,
    required this.inLaws,
    required this.social,
  });

  factory RelationColors.light() => RelationColors(
    direct: _pair(AppPalette.directIndigo, Brightness.light),
    paternal: _pair(AppPalette.paternalTeal, Brightness.light),
    maternal: _pair(AppPalette.maternalRose, Brightness.light),
    inLaws: _pair(AppPalette.inLawsAmber, Brightness.light),
    social: _pair(AppPalette.socialSlate, Brightness.light),
  );

  factory RelationColors.dark() => RelationColors(
    direct: _pair(AppPalette.directIndigo, Brightness.dark),
    paternal: _pair(AppPalette.paternalTeal, Brightness.dark),
    maternal: _pair(AppPalette.maternalRose, Brightness.dark),
    inLaws: _pair(AppPalette.inLawsAmber, Brightness.dark),
    social: _pair(AppPalette.socialSlate, Brightness.dark),
  );

  final RelationColorPair direct;
  final RelationColorPair paternal;
  final RelationColorPair maternal;
  final RelationColorPair inLaws;
  final RelationColorPair social;

  RelationColorPair of(RelationSide side) => switch (side) {
    RelationSide.direct => direct,
    RelationSide.paternal => paternal,
    RelationSide.maternal => maternal,
    RelationSide.inLaws => inLaws,
    RelationSide.social => social,
  };

  /// Light theme: strong colour on a 12% tint. Dark theme: lightened colour on
  /// a 24% tint so text keeps AA contrast on dark surfaces.
  static RelationColorPair _pair(Color base, Brightness brightness) {
    if (brightness == Brightness.light) {
      return RelationColorPair(foreground: base, background: base.withValues(alpha: 0.12));
    }
    final light = Color.lerp(base, Colors.white, 0.45)!;
    return RelationColorPair(foreground: light, background: base.withValues(alpha: 0.24));
  }

  @override
  RelationColors copyWith({
    RelationColorPair? direct,
    RelationColorPair? paternal,
    RelationColorPair? maternal,
    RelationColorPair? inLaws,
    RelationColorPair? social,
  }) => RelationColors(
    direct: direct ?? this.direct,
    paternal: paternal ?? this.paternal,
    maternal: maternal ?? this.maternal,
    inLaws: inLaws ?? this.inLaws,
    social: social ?? this.social,
  );

  @override
  RelationColors lerp(covariant RelationColors? other, double t) {
    if (other == null) return this;
    return RelationColors(
      direct: RelationColorPair.lerp(direct, other.direct, t),
      paternal: RelationColorPair.lerp(paternal, other.paternal, t),
      maternal: RelationColorPair.lerp(maternal, other.maternal, t),
      inLaws: RelationColorPair.lerp(inLaws, other.inLaws, t),
      social: RelationColorPair.lerp(social, other.social, t),
    );
  }
}

extension RelationColorsX on BuildContext {
  RelationColors get relationColors => Theme.of(this).extension<RelationColors>()!;
}
