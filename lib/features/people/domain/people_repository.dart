import 'person.dart';

/// Contract for reading and writing people. The presentation layer depends
/// only on this interface; the Drift implementation lives in `data/`.
abstract interface class PeopleRepository {
  /// All non-deleted, non-merged people, alphabetically, filtered by [query]
  /// (name in either script, nickname, occupation or phone digits).
  Stream<List<Person>> watchAll({String query = ''});

  /// Most recently added people (excluding yourself).
  Stream<List<Person>> watchRecent({int limit = 5});

  Stream<int> watchCount();

  Stream<Person?> watchById(String id);

  /// The app owner's own record ("Me"), if onboarding is complete.
  Stream<Person?> watchSelf();

  /// Creates a person (and their primary phone) and queues it for sync.
  Future<Person> create(NewPerson input);

  /// Soft-deletes a person; reversible with [restore].
  Future<void> softDelete(String id);

  Future<void> restore(String id);
}
