import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/l10n/l10n.dart';
import '../domain/place.dart';
import 'places_providers.dart';

/// Autocomplete over saved places; typing a new name creates the place on
/// selection, so "Sikar" is entered once and reused everywhere.
class PlaceField extends ConsumerStatefulWidget {
  const PlaceField({required this.label, required this.placeId, required this.onChanged, super.key});

  final String label;
  final String? placeId;
  final ValueChanged<String?> onChanged;

  @override
  ConsumerState<PlaceField> createState() => _PlaceFieldState();
}

class _PlaceFieldState extends ConsumerState<PlaceField> {
  static const _createPrefix = '\u0000new:';

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final places = ref.watch(placesProvider).value ?? const <Place>[];
    final current = widget.placeId == null ? null : places.where((p) => p.id == widget.placeId).firstOrNull;

    return Autocomplete<Place>(
      key: ValueKey(current?.id),
      initialValue: TextEditingValue(text: current?.name ?? ''),
      displayStringForOption: (p) => p.name,
      optionsBuilder: (value) {
        final q = value.text.trim().toLowerCase();
        if (q.isEmpty) return const Iterable<Place>.empty();
        final matches = places
            .where((p) => p.name.toLowerCase().contains(q) || (p.nameAlt?.contains(q) ?? false))
            .take(6)
            .toList();
        final exact = matches.any((p) => p.name.toLowerCase() == q);
        return [
          ...matches,
          if (!exact) Place(id: '$_createPrefix${value.text.trim()}', name: value.text.trim()),
        ];
      },
      optionsViewBuilder: (context, onSelected, options) => Align(
        alignment: Alignment.topLeft,
        child: Material(
          elevation: 4,
          borderRadius: BorderRadius.circular(12),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxHeight: 280, maxWidth: 360),
            child: ListView(
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              children: [
                for (final p in options)
                  ListTile(
                    leading: Icon(
                      p.id.startsWith(_createPrefix) ? Icons.add_location_alt_outlined : Icons.place_outlined,
                    ),
                    title: Text(p.id.startsWith(_createPrefix) ? l10n.placeCreate(p.name) : p.displayName),
                    onTap: () => onSelected(p),
                  ),
              ],
            ),
          ),
        ),
      ),
      onSelected: (p) async {
        if (p.id.startsWith(_createPrefix)) {
          final created = await ref.read(placesRepositoryProvider).findOrCreate(p.name);
          widget.onChanged(created.id);
        } else {
          widget.onChanged(p.id);
        }
      },
      fieldViewBuilder: (context, controller, focus, onSubmit) => TextField(
        controller: controller,
        focusNode: focus,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
          labelText: widget.label,
          prefixIcon: const Icon(Icons.place_outlined),
          suffixIcon: widget.placeId == null
              ? null
              : IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    controller.clear();
                    widget.onChanged(null);
                  },
                ),
        ),
      ),
    );
  }
}
