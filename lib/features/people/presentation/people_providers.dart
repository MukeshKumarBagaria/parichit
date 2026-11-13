import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../core/di/core_providers.dart';
import '../data/drift_people_repository.dart';
import '../domain/people_repository.dart';
import '../domain/person.dart';

final peopleRepositoryProvider = Provider<PeopleRepository>(
  (ref) => DriftPeopleRepository(
    db: ref.watch(appDatabaseProvider),
    outbox: ref.watch(outboxWriterProvider),
    ids: ref.watch(idGeneratorProvider),
    clock: ref.watch(clockProvider),
  ),
);

/// Text typed into the People search box.
class PeopleQuery extends Notifier<String> {
  @override
  String build() => '';

  void set(String value) => state = value;
}

final peopleQueryProvider = NotifierProvider<PeopleQuery, String>(PeopleQuery.new);

final peopleListProvider = StreamProvider.autoDispose<List<Person>>(
  (ref) => ref.watch(peopleRepositoryProvider).watchAll(query: ref.watch(peopleQueryProvider)),
);

final recentPeopleProvider = StreamProvider.autoDispose<List<Person>>(
  (ref) => ref.watch(peopleRepositoryProvider).watchRecent(),
);

final peopleCountProvider = StreamProvider.autoDispose<int>(
  (ref) => ref.watch(peopleRepositoryProvider).watchCount(),
);

final personProvider = StreamProvider.autoDispose.family<Person?, String>(
  (ref, id) => ref.watch(peopleRepositoryProvider).watchById(id),
);

/// The app owner's own profile ("Me").
final selfPersonProvider = StreamProvider<Person?>(
  (ref) => ref.watch(peopleRepositoryProvider).watchSelf(),
);
