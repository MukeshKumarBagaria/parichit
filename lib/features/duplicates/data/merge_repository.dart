import 'dart:convert';

import 'package:drift/drift.dart';

import '../../../core/database/app_database.dart';
import '../../../core/sync/outbox_writer.dart';
import '../../../core/utils/id_generator.dart';
import '../../../core/utils/name_matching.dart';
import '../../people/domain/duplicate_scorer.dart';
import '../../people/domain/people_repository.dart';

/// A pair of records that probably describe the same person.
final class DuplicatePair {
  const DuplicatePair(this.aId, this.bId, this.score);

  final String aId;
  final String bId;
  final int score;
}

/// Finds and merges duplicate people (blueprint §2.7). Merging moves every
/// relation of the merged record onto the survivor — which is also how two
/// separately entered families become one connected family.
class MergeRepository {
  MergeRepository({
    required this._db,
    required this._outbox,
    required this._ids,
    required this._people,
    DateTime Function()? clock,
  }) : _clock = clock ?? (() => DateTime.now().toUtc());

  final AppDatabase _db;
  final OutboxWriter _outbox;
  final IdGenerator _ids;
  final PeopleRepository _people;
  final DateTime Function() _clock;

  static const _ignoredKey = 'duplicates_ignored';

  // ----------------------------------------------------------------- scan

  /// Candidate pairs, best first. Uses blocking (same phone, same phonetic
  /// name key) so it stays fast for tens of thousands of people.
  Future<List<DuplicatePair>> scan() async {
    final people =
        await (_db.select(_db.people)..where(
              (p) => p.deletedAt.isNull() & p.mergedIntoId.isNull() & p.isPlaceholder.equals(false),
            ))
            .get();
    final phones = await (_db.select(
      _db.personContacts,
    )..where((c) => c.deletedAt.isNull() & c.kind.equals('phone') & c.normalizedValue.isNotNull())).get();
    final ignored = await _ignored();

    final buckets = <String, Set<String>>{};
    for (final p in people) {
      for (final n in [p.fullName, ?p.fullNameAlt]) {
        final key = NameMatching.phoneticKey(n);
        if (key.isNotEmpty) (buckets['n:$key'] ??= {}).add(p.id);
      }
    }
    final phoneOf = <String, Set<String>>{};
    for (final c in phones) {
      (buckets['p:${c.normalizedValue}'] ??= {}).add(c.personId);
      (phoneOf[c.personId] ??= {}).add(c.normalizedValue!);
    }

    final byId = {for (final p in people) p.id: p};
    final seen = <String>{};
    final pairs = <DuplicatePair>[];
    for (final bucket in buckets.values.where((b) => b.length > 1 && b.length <= 50)) {
      final ids = bucket.toList()..sort();
      for (var i = 0; i < ids.length; i++) {
        for (var j = i + 1; j < ids.length; j++) {
          final key = '${ids[i]}|${ids[j]}';
          if (!seen.add(key) || ignored.contains(key)) continue;
          final a = byId[ids[i]];
          final b = byId[ids[j]];
          if (a == null || b == null || a.isSelf && b.isSelf) continue;
          final samePhone = (phoneOf[a.id] ?? const {}).intersection(phoneOf[b.id] ?? const {}).isNotEmpty;
          final score = DuplicateScorer.score(
            nameA: a.fullName,
            nameB: b.fullName,
            nameAltA: a.fullNameAlt,
            nameAltB: b.fullNameAlt,
            samePhone: samePhone,
            sameNativePlace: a.nativePlaceId != null && a.nativePlaceId == b.nativePlaceId,
            birthYearA: a.birthYear,
            birthYearB: b.birthYear,
          );
          if (score >= DuplicateScorer.threshold) pairs.add(DuplicatePair(a.id, b.id, score));
        }
      }
    }
    pairs.sort((x, y) => y.score.compareTo(x.score));
    return pairs;
  }

  /// "These are different people" — never suggest this pair again.
  Future<void> ignore(String a, String b) async {
    final key = ([a, b]..sort()).join('|');
    final ignored = await _ignored()
      ..add(key);
    await _db
        .into(_db.kvSettings)
        .insertOnConflictUpdate(KvSettingsCompanion.insert(key: _ignoredKey, value: jsonEncode(ignored.toList())));
  }

  Future<Set<String>> _ignored() async {
    final row = await (_db.select(_db.kvSettings)..where((k) => k.key.equals(_ignoredKey))).getSingleOrNull();
    return row == null ? <String>{} : (jsonDecode(row.value) as List<dynamic>).cast<String>().toSet();
  }

  // ---------------------------------------------------------------- merge

  /// Merges [mergedId] into [survivorId]. The survivor keeps its values;
  /// its empty fields are filled from the merged record.
  Future<void> merge({required String survivorId, required String mergedId}) => _db.transaction(() async {
    if (survivorId == mergedId) throw ArgumentError('Cannot merge a person with themselves');
    final now = _clock();
    final survivor = await _person(survivorId);
    final merged = await _person(mergedId);

    // 1. Audit snapshot (also enables a future undo).
    final snapshot = PersonMergeRow(
      id: _ids.newId(),
      createdAt: now,
      updatedAt: now,
      serverSeq: 0,
      survivorId: survivorId,
      mergedId: mergedId,
      snapshot: jsonEncode(OutboxWriter.toCloudJson(merged)),
    );
    await _db.into(_db.personMerges).insert(snapshot);
    await _outbox.enqueue(_db.personMerges, snapshot.id, snapshot);

    // 2. Fill the survivor's gaps.
    final filled = survivor.copyWith(
      fullNameAlt: Value(survivor.fullNameAlt ?? merged.fullNameAlt),
      nickname: Value(survivor.nickname ?? merged.nickname),
      surname: Value(survivor.surname ?? merged.surname),
      gender: survivor.gender == 'unknown' ? merged.gender : survivor.gender,
      isLiving: Value(survivor.isLiving ?? merged.isLiving),
      birthYear: Value(survivor.birthYear ?? merged.birthYear),
      birthMonth: Value(survivor.birthYear != null ? survivor.birthMonth : merged.birthMonth),
      birthDay: Value(survivor.birthYear != null ? survivor.birthDay : merged.birthDay),
      birthOrder: Value(survivor.birthOrder ?? merged.birthOrder),
      deathYear: Value(survivor.deathYear ?? merged.deathYear),
      deathMonth: Value(survivor.deathYear != null ? survivor.deathMonth : merged.deathMonth),
      deathDay: Value(survivor.deathYear != null ? survivor.deathDay : merged.deathDay),
      nativePlaceId: Value(survivor.nativePlaceId ?? merged.nativePlaceId),
      gotra: Value(survivor.gotra ?? merged.gotra),
      occupation: Value(survivor.occupation ?? merged.occupation),
      organization: Value(survivor.organization ?? merged.organization),
      designation: Value(survivor.designation ?? merged.designation),
      education: Value(survivor.education ?? merged.education),
      notes: Value(_joinNotes(survivor.notes, merged.notes)),
      isSelf: survivor.isSelf || merged.isSelf,
      isFavorite: survivor.isFavorite || merged.isFavorite,
      isPlaceholder: survivor.isPlaceholder && merged.isPlaceholder,
      updatedAt: now,
    );

    // 3. Retire the merged record first (keeps the one-"Me" index valid).
    final retired = merged.copyWith(
      mergedIntoId: Value(survivorId),
      deletedAt: Value(now),
      isSelf: false,
      updatedAt: now,
    );
    await _db.update(_db.people).replace(retired);
    await _outbox.enqueue(_db.people, mergedId, retired);
    await _db.update(_db.people).replace(filled);
    await _outbox.enqueue(_db.people, survivorId, filled);

    // Keep the merged name findable as an alias.
    if (merged.fullName.trim().toLowerCase() != survivor.fullName.trim().toLowerCase()) {
      final alias = PersonNameRow(
        id: _ids.newId(),
        createdAt: now,
        updatedAt: now,
        serverSeq: 0,
        personId: survivorId,
        name: merged.fullName,
        nameType: 'spelling',
      );
      await _db.into(_db.personNames).insert(alias);
      await _outbox.enqueue(_db.personNames, alias.id, alias);
    }

    // 4. Re-point everything that referenced the merged person.
    Future<void> repoint<T extends Table, D>(TableInfo<T, D> table, String column) async {
      final col = table.columnsByName[column]! as GeneratedColumn<String>;
      final deletedAt = table.columnsByName['deleted_at']! as GeneratedColumn<DateTime>;
      final idCol = table.columnsByName['id']! as GeneratedColumn<String>;
      final ids =
          await (_db.selectOnly(table)
                ..addColumns([idCol])
                ..where(col.equals(mergedId) & deletedAt.isNull()))
              .map((r) => r.read(idCol)!)
              .get();
      if (ids.isEmpty) return;
      await (_db.update(table)..where((_) => idCol.isIn(ids))).write(
        RawValuesInsertable<D>({column: Variable<String>(survivorId), 'updated_at': Variable<DateTime>(now)}),
      );
      for (final row in await (_db.select(table)..where((_) => idCol.isIn(ids))).get()) {
        final insertable = row as Insertable<D>;
        await _outbox.enqueue(table, _idOf(insertable.toColumns(false)['id']!), insertable);
      }
    }

    await repoint(_db.personContacts, 'person_id');
    await repoint(_db.personNames, 'person_id');
    await repoint(_db.personAddresses, 'person_id');
    await repoint(_db.personAttributes, 'person_id');
    await repoint(_db.personTags, 'person_id');
    await repoint(_db.parentChild, 'parent_id');
    await repoint(_db.parentChild, 'child_id');
    await repoint(_db.partnerships, 'person_a_id');
    await repoint(_db.partnerships, 'person_b_id');
    await repoint(_db.socialConnections, 'person_id');
    await repoint(_db.socialConnections, 'other_person_id');
    await repoint(_db.familyGroupMembers, 'person_id');
    await repoint(_db.interactionParticipants, 'person_id');
    await repoint(_db.media, 'person_id');
    await repoint(_db.reminders, 'person_id');

    // 5. Clean up links that became duplicates or self-references.
    await _dedupe(now);
    await _people.refreshSearchText(survivorId);
  });

  Future<void> _dedupe(DateTime now) async {
    Future<void> retire<T extends Table, D>(TableInfo<T, D> table, Iterable<D> rows) async {
      for (final r in rows) {
        final cols = (r as Insertable<D>).toColumns(false);
        final id = _idOf(cols['id']!);
        final idCol = table.columnsByName['id']! as GeneratedColumn<String>;
        await (_db.update(table)..where((_) => idCol.equals(id))).write(
          RawValuesInsertable<D>({'deleted_at': Variable<DateTime>(now), 'updated_at': Variable<DateTime>(now)}),
        );
        final updated = await (_db.select(table)..where((_) => idCol.equals(id))).getSingle();
        await _outbox.enqueue(table, id, updated as Insertable<D>);
      }
    }

    List<D> extras<D>(List<D> rows, String Function(D) key, bool Function(D) invalid) {
      final seen = <String>{};
      return [
        for (final r in rows)
          if (invalid(r) || !seen.add(key(r))) r,
      ];
    }

    // Contacts: drop repeated numbers, then keep a single primary phone.
    final contacts =
        await (_db.select(_db.personContacts)
              ..where((e) => e.deletedAt.isNull())
              ..orderBy([(e) => OrderingTerm.desc(e.isPrimary), (e) => OrderingTerm.asc(e.createdAt)]))
            .get();
    final contactExtras = extras(
      contacts,
      (e) => '${e.personId}|${e.kind}|${e.normalizedValue ?? e.value}',
      (_) => false,
    );
    await retire(_db.personContacts, contactExtras);
    final retiredIds = contactExtras.map((e) => e.id).toSet();
    final primarySeen = <String>{};
    for (final e in contacts.where((e) => !retiredIds.contains(e.id) && e.kind == 'phone' && e.isPrimary)) {
      if (primarySeen.add(e.personId)) continue;
      final row = e.copyWith(isPrimary: false, updatedAt: now);
      await _db.update(_db.personContacts).replace(row);
      await _outbox.enqueue(_db.personContacts, row.id, row);
    }

    final pc = await (_db.select(_db.parentChild)..where((e) => e.deletedAt.isNull())).get();
    await retire(_db.parentChild, extras(pc, (e) => '${e.parentId}>${e.childId}', (e) => e.parentId == e.childId));

    // Partnerships: restore canonical order first (server CHECK a < b).
    for (final e in await (_db.select(_db.partnerships)..where((e) => e.deletedAt.isNull())).get()) {
      if (e.personAId.compareTo(e.personBId) > 0) {
        final row = e.copyWith(personAId: e.personBId, personBId: e.personAId, updatedAt: now);
        await _db.update(_db.partnerships).replace(row);
        await _outbox.enqueue(_db.partnerships, row.id, row);
      }
    }
    final ps = await (_db.select(_db.partnerships)..where((e) => e.deletedAt.isNull())).get();
    await retire(
      _db.partnerships,
      extras(ps, (e) => '${e.personAId}|${e.personBId}', (e) => e.personAId == e.personBId),
    );

    final sc = await (_db.select(_db.socialConnections)..where((e) => e.deletedAt.isNull())).get();
    await retire(
      _db.socialConnections,
      extras(sc, (e) => '${e.personId}|${e.otherPersonId}|${e.connectionType}', (e) => e.personId == e.otherPersonId),
    );

    final pt = await (_db.select(_db.personTags)..where((e) => e.deletedAt.isNull())).get();
    await retire(_db.personTags, extras(pt, (e) => '${e.personId}|${e.tagId}', (_) => false));

    final ip = await (_db.select(_db.interactionParticipants)..where((e) => e.deletedAt.isNull())).get();
    await retire(_db.interactionParticipants, extras(ip, (e) => '${e.interactionId}|${e.personId}', (_) => false));

    final fm = await (_db.select(_db.familyGroupMembers)..where((e) => e.deletedAt.isNull())).get();
    await retire(_db.familyGroupMembers, extras(fm, (e) => '${e.familyGroupId}|${e.personId}', (_) => false));
  }

  Future<PersonRow> _person(String id) => (_db.select(_db.people)..where((p) => p.id.equals(id))).getSingle();

  static String _idOf(Expression<Object> e) => (e as Variable<String>).value!;

  static String? _joinNotes(String? a, String? b) {
    if (a == null) return b;
    if (b == null || a.contains(b)) return a;
    return '$a\n\n$b';
  }
}
