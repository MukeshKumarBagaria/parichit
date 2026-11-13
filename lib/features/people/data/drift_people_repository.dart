import 'package:drift/drift.dart';
import 'package:kinship/kinship.dart';

import '../../../core/database/app_database.dart';
import '../../../core/sync/outbox_writer.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/utils/phone_normalizer.dart';
import '../../../core/utils/search_text.dart';
import '../domain/people_repository.dart';
import '../domain/person.dart';

/// [PeopleRepository] backed by the local Drift database.
///
/// Every write is one transaction that updates the row(s) **and** the sync
/// outbox, so local data and pending sync work can never diverge.
class DriftPeopleRepository implements PeopleRepository {
  DriftPeopleRepository({
    required this._db,
    required this._outbox,
    required this._ids,
    DateTime Function()? clock,
  }) : _clock = clock ?? (() => DateTime.now().toUtc());

  final AppDatabase _db;
  final OutboxWriter _outbox;
  final IdGenerator _ids;
  final DateTime Function() _clock;

  // ---------------------------------------------------------------- reads

  /// People joined with their primary phone (if any).
  JoinedSelectStatement<HasResultSet, dynamic> _peopleWithPhone() {
    final p = _db.people;
    final c = _db.personContacts;
    return _db.select(p).join([
      leftOuterJoin(
        c,
        c.personId.equalsExp(p.id) & c.kind.equals('phone') & c.isPrimary.equals(true) & c.deletedAt.isNull(),
      ),
    ])..where(p.deletedAt.isNull() & p.mergedIntoId.isNull());
  }

  Person _toPerson(TypedResult r) {
    final row = r.readTable(_db.people);
    final phone = r.readTableOrNull(_db.personContacts);
    return Person(
      id: row.id,
      fullName: row.fullName,
      fullNameAlt: row.fullNameAlt,
      nickname: row.nickname,
      gender: Gender.fromDb(row.gender),
      isLiving: row.isLiving,
      occupation: row.occupation,
      notes: row.notes,
      primaryPhone: phone?.normalizedValue ?? phone?.value,
      isSelf: row.isSelf,
      isPlaceholder: row.isPlaceholder,
      isFavorite: row.isFavorite,
      createdAt: row.createdAt,
      updatedAt: row.updatedAt,
    );
  }

  @override
  Stream<List<Person>> watchAll({String query = ''}) {
    final p = _db.people;
    final q = SearchText.normalize(query);
    final stmt = _peopleWithPhone()..orderBy([OrderingTerm.asc(p.fullName.collate(Collate.noCase))]);
    if (q.isNotEmpty) {
      final digits = PhoneNormalizer.digitsOnly(q);
      stmt.where(
        p.searchText.like('%${_escapeLike(q)}%', escapeChar: r'\') |
            (digits.length >= 3 ? p.searchText.like('%$digits%') : const Constant(false)),
      );
    }
    return stmt.watch().map((rows) => rows.map(_toPerson).toList(growable: false));
  }

  @override
  Stream<List<Person>> watchRecent({int limit = 5}) {
    final p = _db.people;
    final stmt = _peopleWithPhone()
      ..where(p.isSelf.equals(false))
      ..orderBy([OrderingTerm.desc(p.createdAt)])
      ..limit(limit);
    return stmt.watch().map((rows) => rows.map(_toPerson).toList(growable: false));
  }

  @override
  Stream<int> watchCount() {
    final p = _db.people;
    final count = p.id.count();
    final stmt = _db.selectOnly(p)
      ..addColumns([count])
      ..where(p.deletedAt.isNull() & p.mergedIntoId.isNull() & p.isPlaceholder.equals(false));
    return stmt.map((r) => r.read(count) ?? 0).watchSingle();
  }

  @override
  Stream<Person?> watchById(String id) {
    final stmt = _peopleWithPhone()..where(_db.people.id.equals(id));
    return stmt.watchSingleOrNull().map((r) => r == null ? null : _toPerson(r));
  }

  @override
  Stream<Person?> watchSelf() {
    final stmt = _peopleWithPhone()
      ..where(_db.people.isSelf.equals(true))
      ..limit(1);
    return stmt.watchSingleOrNull().map((r) => r == null ? null : _toPerson(r));
  }

  // --------------------------------------------------------------- writes

  @override
  Future<Person> create(NewPerson input) {
    final fullName = input.fullName.trim();
    if (fullName.isEmpty) {
      throw ArgumentError.value(input.fullName, 'fullName', 'must not be empty');
    }
    final now = _clock();
    final personId = _ids.newId();
    final rawPhone = input.phone?.trim() ?? '';
    final normalizedPhone = rawPhone.isEmpty ? null : PhoneNormalizer.normalize(rawPhone);

    final person = PersonRow(
      id: personId,
      createdAt: now,
      updatedAt: now,
      serverSeq: 0,
      fullName: fullName,
      fullNameAlt: _blankToNull(input.fullNameAlt),
      gender: input.gender.dbValue,
      birthDateApprox: false,
      notes: _blankToNull(input.notes),
      isSelf: input.isSelf,
      isPlaceholder: false,
      isFavorite: false,
      notifyBirthday: true,
      searchText: SearchText.build(
        fullName: fullName,
        fullNameAlt: input.fullNameAlt,
        phones: [if (rawPhone.isNotEmpty) rawPhone],
      ),
    );

    return _db.transaction(() async {
      await _db.into(_db.people).insert(person);
      await _outbox.enqueue(_db.people, person.id, person);

      if (rawPhone.isNotEmpty) {
        final contact = PersonContactRow(
          id: _ids.newId(),
          createdAt: now,
          updatedAt: now,
          serverSeq: 0,
          personId: personId,
          kind: 'phone',
          value: rawPhone,
          normalizedValue: normalizedPhone,
          isWhatsapp: false,
          isPrimary: true,
        );
        await _db.into(_db.personContacts).insert(contact);
        await _outbox.enqueue(_db.personContacts, contact.id, contact);
      }

      return Person(
        id: personId,
        fullName: fullName,
        fullNameAlt: person.fullNameAlt,
        gender: input.gender,
        notes: person.notes,
        primaryPhone: normalizedPhone ?? (rawPhone.isEmpty ? null : rawPhone),
        isSelf: input.isSelf,
        createdAt: now,
        updatedAt: now,
      );
    });
  }

  @override
  Future<void> softDelete(String id) => _setDeleted(id, deleted: true);

  @override
  Future<void> restore(String id) => _setDeleted(id, deleted: false);

  /// Soft-deletes (or restores) a person together with everything that hangs
  /// off them, so the graph never points at a deleted person.
  Future<void> _setDeleted(String id, {required bool deleted}) {
    final now = _clock();
    final deletedAt = Value<DateTime?>(deleted ? now : null);

    return _db.transaction(() async {
      final person = await (_db.select(_db.people)..where((p) => p.id.equals(id))).getSingleOrNull();
      if (person == null) return;
      if (person.isSelf && deleted) {
        throw StateError('Your own profile cannot be deleted.');
      }
      final updated = person.copyWith(deletedAt: deletedAt, updatedAt: now);
      await _db.update(_db.people).replace(updated);
      await _outbox.enqueue(_db.people, id, updated);

      // Dependent rows. When restoring, only rows deleted together with the
      // person (same timestamp) come back.
      final previousDeletedAt = person.deletedAt;
      final contacts =
          await (_db.select(_db.personContacts)..where(
                (c) =>
                    c.personId.equals(id) &
                    (deleted ? c.deletedAt.isNull() : c.deletedAt.equalsNullable(previousDeletedAt)),
              ))
              .get();
      for (final c in contacts) {
        final row = c.copyWith(deletedAt: deletedAt, updatedAt: now);
        await _db.update(_db.personContacts).replace(row);
        await _outbox.enqueue(_db.personContacts, row.id, row);
      }
      // Milestone 3 adds parent_child / partnerships / social edges here.
    });
  }

  static String? _blankToNull(String? v) {
    final t = v?.trim();
    return (t == null || t.isEmpty) ? null : t;
  }

  static String _escapeLike(String v) => v.replaceAll(r'\', r'\\').replaceAll('%', r'\%').replaceAll('_', r'\_');
}
