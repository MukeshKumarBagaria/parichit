import 'package:drift/drift.dart';
import 'package:kinship/kinship.dart';

import '../../../core/database/app_database.dart';
import '../../../core/database/soft_delete.dart';
import '../../../core/sync/outbox_writer.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/utils/phone_normalizer.dart';
import '../../../core/utils/search_text.dart';
import '../domain/duplicate_scorer.dart';
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

  late final _softDeleter = SoftDeleter(_db, _outbox);

  // ---------------------------------------------------------------- reads

  /// People joined with their primary phone (if any).
  JoinedSelectStatement<HasResultSet, dynamic> _peopleWithPhone({bool deleted = false}) {
    final p = _db.people;
    final c = _db.personContacts;
    // Exactly one phone per person (the earliest primary one), so a person is
    // never duplicated in results even if data briefly has two primaries.
    final c2 = _db.alias(_db.personContacts, 'primary_phone');
    final firstPrimary = subqueryExpression<String>(
      _db.selectOnly(c2)
        ..addColumns([c2.id])
        ..where(
          c2.personId.equalsExp(p.id) & c2.kind.equals('phone') & c2.isPrimary.equals(true) & c2.deletedAt.isNull(),
        )
        ..orderBy([OrderingTerm.asc(c2.createdAt), OrderingTerm.asc(c2.id)])
        ..limit(1),
    );
    return _db.select(p).join([
      leftOuterJoin(c, c.id.equalsExp(firstPrimary)),
    ])..where((deleted ? p.deletedAt.isNotNull() : p.deletedAt.isNull()) & p.mergedIntoId.isNull());
  }

  Person _toPerson(TypedResult r) => personFromRow(
    r.readTable(_db.people),
    primaryPhone: r.readTableOrNull(_db.personContacts)?.normalizedValue,
  );

  /// Maps a database row to the domain model (shared with other features).
  static Person personFromRow(PersonRow row, {String? primaryPhone}) => Person(
    id: row.id,
    fullName: row.fullName,
    fullNameAlt: row.fullNameAlt,
    nickname: row.nickname,
    surname: row.surname,
    gender: Gender.fromDb(row.gender),
    isLiving: row.isLiving,
    birthDate: PartialDate.of(row.birthYear, row.birthMonth, row.birthDay, approximate: row.birthDateApprox),
    birthOrder: row.birthOrder,
    deathDate: PartialDate.of(row.deathYear, row.deathMonth, row.deathDay),
    gotra: row.gotra,
    occupation: row.occupation,
    organization: row.organization,
    designation: row.designation,
    education: row.education,
    notes: row.notes,
    nativePlaceId: row.nativePlaceId,
    primaryPhone: primaryPhone,
    isSelf: row.isSelf,
    isPlaceholder: row.isPlaceholder,
    isFavorite: row.isFavorite,
    notifyBirthday: row.notifyBirthday,
    createdAt: row.createdAt,
    updatedAt: row.updatedAt,
    deletedAt: row.deletedAt,
  );

  @override
  Stream<List<Person>> watchAll({String query = ''}) {
    final p = _db.people;
    final stmt = _peopleWithPhone()..orderBy([OrderingTerm.asc(p.fullName.collate(Collate.noCase))]);
    final variants = SearchText.queryVariants(query);
    if (variants.isNotEmpty) {
      Expression<bool> match = const Constant(false);
      for (final v in variants) {
        match = match | p.searchText.like('%${_escapeLike(v)}%', escapeChar: r'\');
      }
      final digits = PhoneNormalizer.digitsOnly(query);
      if (digits.length >= 3) match = match | p.searchText.like('%$digits%');
      stmt.where(match);
    }
    return stmt.watch().map((rows) => rows.map(_toPerson).toList(growable: false));
  }

  @override
  Stream<List<Person>> watchRecent({int limit = 5}) {
    final p = _db.people;
    final stmt = _peopleWithPhone()
      ..where(p.isSelf.equals(false) & p.isPlaceholder.equals(false))
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

  @override
  Stream<List<Person>> watchDeleted() {
    final stmt = _peopleWithPhone(deleted: true)..orderBy([OrderingTerm.desc(_db.people.deletedAt)]);
    return stmt.watch().map((rows) => rows.map(_toPerson).toList(growable: false));
  }

  @override
  Stream<List<ContactMethod>> watchContacts(String personId) {
    final c = _db.personContacts;
    final stmt = _db.select(c)
      ..where((t) => t.personId.equals(personId) & t.deletedAt.isNull())
      ..orderBy([(t) => OrderingTerm.desc(t.isPrimary), (t) => OrderingTerm.asc(t.createdAt)]);
    return stmt.watch().map(
      (rows) => [
        for (final r in rows)
          ContactMethod(
            id: r.id,
            kind: r.kind,
            value: r.value,
            label: r.label,
            isWhatsapp: r.isWhatsapp,
            isPrimary: r.isPrimary,
          ),
      ],
    );
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
      nativePlaceId: input.nativePlaceId,
      isSelf: input.isSelf,
      isPlaceholder: false,
      isFavorite: false,
      notifyBirthday: true,
      searchText: '',
    );

    return _db.transaction(() async {
      await _db.into(_db.people).insert(person);
      await _outbox.enqueue(_db.people, person.id, person);
      if (rawPhone.isNotEmpty) {
        await _insertContact(personId, ContactMethod(kind: 'phone', value: rawPhone, isPrimary: true), now);
      }
      await refreshSearchText(personId);
      return personFromRow(person, primaryPhone: PhoneNormalizer.normalize(rawPhone));
    });
  }

  @override
  Future<void> update(String id, PersonDraft d) {
    final fullName = d.fullName.trim();
    if (fullName.isEmpty) throw ArgumentError.value(d.fullName, 'fullName', 'must not be empty');
    return _db.transaction(() async {
      final row = await _row(id);
      final updated = row.copyWith(
        fullName: fullName,
        fullNameAlt: Value(_blankToNull(d.fullNameAlt)),
        nickname: Value(_blankToNull(d.nickname)),
        surname: Value(_blankToNull(d.surname)),
        gender: d.gender.dbValue,
        isLiving: Value(d.deathDate != null ? false : d.isLiving),
        birthYear: Value(d.birthDate?.year),
        birthMonth: Value(d.birthDate?.month),
        birthDay: Value(d.birthDate?.day),
        birthDateApprox: d.birthDate?.approximate ?? false,
        birthOrder: Value(d.birthOrder),
        deathYear: Value(d.deathDate?.year),
        deathMonth: Value(d.deathDate?.month),
        deathDay: Value(d.deathDate?.day),
        gotra: Value(_blankToNull(d.gotra)),
        occupation: Value(_blankToNull(d.occupation)),
        organization: Value(_blankToNull(d.organization)),
        designation: Value(_blankToNull(d.designation)),
        education: Value(_blankToNull(d.education)),
        notes: Value(_blankToNull(d.notes)),
        nativePlaceId: Value(d.nativePlaceId),
        isFavorite: d.isFavorite,
        notifyBirthday: d.notifyBirthday,
        // Editing a placeholder means you now know who they are.
        isPlaceholder: false,
        updatedAt: _clock(),
      );
      await _db.update(_db.people).replace(updated);
      await _outbox.enqueue(_db.people, id, updated);
      await refreshSearchText(id);
    });
  }

  @override
  Future<void> saveContacts(String id, List<ContactMethod> contacts) => _db.transaction(() async {
    final now = _clock();
    final existing = await (_db.select(
      _db.personContacts,
    )..where((c) => c.personId.equals(id) & c.deletedAt.isNull())).get();
    final keep = contacts.where((c) => c.value.trim().isNotEmpty).toList();
    // Exactly one primary phone if there are any phones.
    final phones = keep.where((c) => c.kind == 'phone').toList();
    if (phones.isNotEmpty && !phones.any((c) => c.isPrimary)) {
      keep[keep.indexOf(phones.first)] = phones.first.copyWith(isPrimary: true);
    }

    final keptIds = {for (final c in keep) ?c.id};
    for (final old in existing.where((e) => !keptIds.contains(e.id))) {
      final row = old.copyWith(deletedAt: Value(now), updatedAt: now);
      await _db.update(_db.personContacts).replace(row);
      await _outbox.enqueue(_db.personContacts, row.id, row);
    }
    for (final c in keep) {
      final old = existing.where((e) => e.id == c.id).firstOrNull;
      if (old == null) {
        await _insertContact(id, c, now);
        continue;
      }
      final row = old.copyWith(
        value: c.value.trim(),
        normalizedValue: Value(_normalizeContact(c.kind, c.value)),
        label: Value(_blankToNull(c.label)),
        isWhatsapp: c.isWhatsapp,
        isPrimary: c.isPrimary,
        updatedAt: now,
      );
      if (row != old.copyWith(updatedAt: now)) {
        await _db.update(_db.personContacts).replace(row);
        await _outbox.enqueue(_db.personContacts, row.id, row);
      }
    }
    await refreshSearchText(id);
  });

  @override
  Future<void> setFavorite(String id, {required bool favorite}) => _db.transaction(() async {
    final row = (await _row(id)).copyWith(isFavorite: favorite, updatedAt: _clock());
    await _db.update(_db.people).replace(row);
    await _outbox.enqueue(_db.people, id, row);
  });

  @override
  Future<void> softDelete(String id) => _db.transaction(() async {
    final person = await _row(id);
    if (person.isSelf) throw StateError('Your own profile cannot be deleted.');
    if (person.deletedAt != null) return;
    final now = _clock();
    final updated = person.copyWith(deletedAt: Value(now), updatedAt: now);
    await _db.update(_db.people).replace(updated);
    await _outbox.enqueue(_db.people, id, updated);
    await _softDeleter.deletePersonDependents(_db, id, now);
  });

  @override
  Future<void> restore(String id) => _db.transaction(() async {
    final person = await _row(id);
    final deletedAt = person.deletedAt;
    if (deletedAt == null) return;
    final now = _clock();
    final updated = person.copyWith(deletedAt: const Value(null), updatedAt: now);
    await _db.update(_db.people).replace(updated);
    await _outbox.enqueue(_db.people, id, updated);
    await _softDeleter.restorePersonDependents(_db, id, deletedAt, now);
  });

  @override
  Future<List<Person>> findPossibleDuplicates({required String fullName, String? phone, String? excludeId}) async {
    final name = fullName.trim();
    if (name.isEmpty && (phone == null || phone.trim().isEmpty)) return const [];
    final normalizedPhone = phone == null ? null : PhoneNormalizer.normalize(phone);

    final samePhoneIds = <String>{};
    if (normalizedPhone != null) {
      final rows = await (_db.select(
        _db.personContacts,
      )..where((c) => c.normalizedValue.equals(normalizedPhone) & c.deletedAt.isNull())).get();
      samePhoneIds.addAll(rows.map((r) => r.personId));
    }

    final p = _db.people;
    final candidates = await (_db.select(
      p,
    )..where((t) => t.deletedAt.isNull() & t.mergedIntoId.isNull() & t.isPlaceholder.equals(false))).get();

    final scored = <(int, PersonRow)>[];
    for (final c in candidates) {
      if (c.id == excludeId) continue;
      final score = DuplicateScorer.score(
        nameA: name,
        nameB: c.fullName,
        nameAltB: c.fullNameAlt,
        samePhone: samePhoneIds.contains(c.id),
      );
      if (score >= DuplicateScorer.threshold) scored.add((score, c));
    }
    scored.sort((a, b) => b.$1.compareTo(a.$1));
    return [for (final (_, row) in scored.take(5)) personFromRow(row)];
  }

  // ------------------------------------------------------------- helpers

  /// Rebuilds the person's local search index from names, aliases, phones
  /// and native village.
  @override
  Future<void> refreshSearchText(String id) async {
    final person = await _row(id);
    final phones = await (_db.select(
      _db.personContacts,
    )..where((c) => c.personId.equals(id) & c.kind.equals('phone') & c.deletedAt.isNull())).get();
    final aliases = await (_db.select(
      _db.personNames,
    )..where((n) => n.personId.equals(id) & n.deletedAt.isNull())).get();
    final place = person.nativePlaceId == null
        ? null
        : await (_db.select(_db.places)..where((pl) => pl.id.equals(person.nativePlaceId!))).getSingleOrNull();

    final text = SearchText.build(
      fullName: person.fullName,
      fullNameAlt: person.fullNameAlt,
      nickname: person.nickname,
      occupation: person.occupation,
      phones: phones.map((p) => p.value),
      extra: [...aliases.map((a) => a.name), ?place?.name, ?place?.nameAlt, ?person.gotra],
    );
    // search_text is local-only, so this write is not queued for sync.
    await (_db.update(_db.people)..where((p) => p.id.equals(id))).write(PeopleCompanion(searchText: Value(text)));
  }

  Future<void> _insertContact(String personId, ContactMethod c, DateTime now) async {
    final row = PersonContactRow(
      id: _ids.newId(),
      createdAt: now,
      updatedAt: now,
      serverSeq: 0,
      personId: personId,
      kind: c.kind,
      value: c.value.trim(),
      normalizedValue: _normalizeContact(c.kind, c.value),
      label: _blankToNull(c.label),
      isWhatsapp: c.isWhatsapp,
      isPrimary: c.isPrimary,
    );
    await _db.into(_db.personContacts).insert(row);
    await _outbox.enqueue(_db.personContacts, row.id, row);
  }

  static String? _normalizeContact(String kind, String value) => switch (kind) {
    'phone' => PhoneNormalizer.normalize(value) ?? value.trim(),
    'email' => value.trim().toLowerCase(),
    _ => value.trim(),
  };

  Future<PersonRow> _row(String id) => (_db.select(_db.people)..where((p) => p.id.equals(id))).getSingle();

  static String? _blankToNull(String? v) {
    final t = v?.trim();
    return (t == null || t.isEmpty) ? null : t;
  }

  static String _escapeLike(String v) => v.replaceAll(r'\', r'\\').replaceAll('%', r'\%').replaceAll('_', r'\_');
}
