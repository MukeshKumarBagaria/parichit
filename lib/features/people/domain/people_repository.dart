import 'person.dart';

/// Contract for reading and writing people. The presentation layer depends
/// only on this interface; the Drift implementation lives in `data/`.
abstract interface class PeopleRepository {
  /// All live people (placeholders included), alphabetically, filtered by
  /// [query] (name in either script, nickname, occupation, village, phone).
  Stream<List<Person>> watchAll({String query = ''});

  /// Most recently added real people (excluding yourself and placeholders).
  Stream<List<Person>> watchRecent({int limit = 5});

  Stream<int> watchCount();

  Stream<Person?> watchById(String id);

  /// The app owner's own record ("Me"), if onboarding is complete.
  Stream<Person?> watchSelf();

  /// People in the trash, most recently deleted first.
  Stream<List<Person>> watchDeleted();

  Stream<List<ContactMethod>> watchContacts(String personId);

  /// Creates a person (and their primary phone) and queues it for sync.
  Future<Person> create(NewPerson input);

  /// Saves the full edit form. Placeholders become real people once edited.
  Future<void> update(String id, PersonDraft draft);

  /// Replaces the person's contact methods with [contacts] (removed ones are
  /// soft-deleted, new ones created, changed ones updated).
  Future<void> saveContacts(String id, List<ContactMethod> contacts);

  Future<void> setFavorite(String id, {required bool favorite});

  /// Soft-deletes a person and everything attached to them; reversible
  /// with [restore].
  Future<void> softDelete(String id);

  Future<void> restore(String id);

  /// Rebuilds the local search index for a person (after sync or edits of
  /// related rows such as aliases or places).
  Future<void> refreshSearchText(String id);

  /// People whose normalised phone or name closely matches — used to warn
  /// about duplicates before saving.
  Future<List<Person>> findPossibleDuplicates({required String fullName, String? phone, String? excludeId});
}
