import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/core_providers.dart';
import '../data/places_repository.dart';
import '../domain/place.dart';

final placesRepositoryProvider = Provider<PlacesRepository>(
  (ref) => PlacesRepository(
    db: ref.watch(appDatabaseProvider),
    outbox: ref.watch(outboxWriterProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);

final placesProvider = StreamProvider<List<Place>>((ref) => ref.watch(placesRepositoryProvider).watchAll());

final placeByIdProvider = Provider.family<Place?, String>(
  (ref, id) => ref.watch(placesProvider).value?.where((p) => p.id == id).firstOrNull,
);
