/// Which side of the family a relation belongs to. Drives the colour of the
/// relation chip in the UI.
enum RelationSide {
  /// You and your direct line (parents, siblings, children, spouse).
  direct,

  /// पितृ पक्ष — reached through your father.
  paternal,

  /// मातृ पक्ष — reached through your mother.
  maternal,

  /// ससुराल — reached through your spouse.
  inLaws,

  /// Friends, colleagues and other non-family ties.
  social,
}
