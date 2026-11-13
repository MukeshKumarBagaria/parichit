import 'package:flutter/material.dart';

/// Circular avatar showing initials on a colour derived from the person's id,
/// so the same person always gets the same colour. Placeholders get a dashed
/// look; deceased people are shown muted.
class PersonAvatar extends StatelessWidget {
  const PersonAvatar({
    required this.personId,
    required this.name,
    this.radius = 22,
    this.isPlaceholder = false,
    this.isDeceased = false,
    super.key,
  });

  final String personId;
  final String name;
  final double radius;
  final bool isPlaceholder;
  final bool isDeceased;

  static const _palette = [
    Color(0xFF0F6E6E),
    Color(0xFFC2477A),
    Color(0xFF4F5BD5),
    Color(0xFFB7791F),
    Color(0xFF2E7D32),
    Color(0xFF8E44AD),
    Color(0xFFD35400),
    Color(0xFF00838F),
  ];

  /// Up to two grapheme-safe initials (works for Devanagari, e.g. "क्ष").
  static String initialsOf(String name) {
    final words = name.trim().split(RegExp(r'\s+')).where((w) => w.isNotEmpty).toList();
    if (words.isEmpty) return '?';
    final first = words.first.characters.first;
    if (words.length == 1) return first.toUpperCase();
    return (first + words.last.characters.first).toUpperCase();
  }

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;
    // Stable across app runs and platforms (unlike String.hashCode).
    final hash = personId.codeUnits.fold<int>(0, (h, c) => (h * 31 + c) & 0x7fffffff);
    final base = _palette[hash % _palette.length];
    final color = isDeceased ? Color.lerp(base, scheme.outline, 0.6)! : base;

    return Semantics(
      label: name,
      excludeSemantics: true,
      child: Container(
        width: radius * 2,
        height: radius * 2,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isPlaceholder ? Colors.transparent : color.withValues(alpha: 0.16),
          border: Border.all(
            color: color.withValues(alpha: isPlaceholder ? 0.7 : 0.0),
            width: isPlaceholder ? 1.5 : 0,
          ),
        ),
        child: Text(
          isPlaceholder ? '?' : initialsOf(name),
          style: TextStyle(
            color: color,
            fontWeight: FontWeight.w600,
            fontSize: radius * 0.75,
          ),
        ),
      ),
    );
  }
}
