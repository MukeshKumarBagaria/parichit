/// Kinship engine for Parichit.
///
/// Only primitive facts are stored (parent → child, partner ↔ partner,
/// social ties). Every other relation — chacha, mama, sasur, cousin… — is
/// derived by walking the family graph and naming the resulting path.
///
/// See `parichit-idea.md`, section 4, for the full design.
library;

export 'src/gender.dart';
export 'src/kin_path.dart';
export 'src/kin_step.dart';
export 'src/relation_side.dart';
