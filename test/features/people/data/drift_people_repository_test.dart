import 'dart:convert';

import 'package:drift/drift.dart' show OrderingTerm;
import 'package:flutter_test/flutter_test.dart';
import 'package:kinship/kinship.dart';
import 'package:parichit/core/database/app_database.dart';
import 'package:parichit/core/sync/outbox_writer.dart';
import 'package:parichit/features/people/data/drift_people_repository.dart';
import 'package:parichit/features/people/domain/person.dart';

import '../../../helpers/test_database.dart';

void main() {
  late AppDatabase db;
  late DriftPeopleRepository repo;

  setUp(() {
    db = createTestDatabase();
    final clock = steppingClock();
    repo = DriftPeopleRepository(
      db: db,
      outbox: OutboxWriter(db, clock: clock),
      ids: SequentialIds(),
      clock: clock,
    );
  });

  tearDown(() => db.close());

  Future<List<OutboxEntry>> outbox() => (db.select(db.syncOutbox)..orderBy([(t) => OrderingTerm.asc(t.seq)])).get();

  group('create', () {
    test('saves the person and their primary phone', () async {
      final person = await repo.create(
        const NewPerson(
          fullName: '  Ramesh Sharma ',
          fullNameAlt: 'रमेश शर्मा',
          gender: Gender.male,
          phone: '98290 12345',
        ),
      );

      expect(person.fullName, 'Ramesh Sharma');
      final stored = await repo.watchById(person.id).first;
      expect(stored, isNotNull);
      expect(stored!.fullNameAlt, 'रमेश शर्मा');
      expect(stored.gender, Gender.male);
      expect(stored.primaryPhone, '+919829012345');
    });

    test('queues every written row in the sync outbox, in order', () async {
      final person = await repo.create(const NewPerson(fullName: 'Ramesh', phone: '9829012345'));

      final entries = await outbox();
      expect(entries.map((e) => e.entity), ['people', 'person_contacts']);
      expect(entries.first.recordId, person.id);

      final payload = jsonDecode(entries.first.payload) as Map<String, dynamic>;
      expect(payload['full_name'], 'Ramesh');
      expect(payload['is_self'], false);
      expect(payload.containsKey('server_seq'), isFalse, reason: 'local-only column');
      expect(payload.containsKey('search_text'), isFalse, reason: 'local-only column');
      expect(payload['created_at'], endsWith('Z'), reason: 'timestamps are sent in UTC');
    });

    test('rejects an empty name', () {
      expect(() => repo.create(const NewPerson(fullName: '   ')), throwsArgumentError);
    });
  });

  group('search', () {
    setUp(() async {
      await repo.create(const NewPerson(fullName: 'Ramesh Sharma', fullNameAlt: 'रमेश शर्मा', phone: '9829012345'));
      await repo.create(const NewPerson(fullName: 'Sunita Gupta'));
    });

    Future<List<String>> names(String q) async => (await repo.watchAll(query: q).first).map((p) => p.fullName).toList();

    test('matches English and Hindi names, case-insensitively', () async {
      expect(await names('RAMESH'), ['Ramesh Sharma']);
      expect(await names('रमेश'), ['Ramesh Sharma']);
      expect(await names('gupta'), ['Sunita Gupta']);
    });

    test('matches phone digits', () async {
      expect(await names('82901'), ['Ramesh Sharma']);
    });

    test('returns everyone, alphabetically, for an empty query', () async {
      expect(await names(''), ['Ramesh Sharma', 'Sunita Gupta']);
    });

    test('treats % and _ literally', () async {
      expect(await names('%'), isEmpty);
    });
  });

  group('softDelete / restore', () {
    test('hides the person and their contacts, and restore brings both back', () async {
      final p = await repo.create(const NewPerson(fullName: 'Amit', phone: '9829012345'));

      await repo.softDelete(p.id);
      expect(await repo.watchById(p.id).first, isNull);
      expect(await repo.watchCount().first, 0);

      await repo.restore(p.id);
      final restored = await repo.watchById(p.id).first;
      expect(restored, isNotNull);
      expect(restored!.primaryPhone, '+919829012345');
    });

    test('never deletes your own profile', () async {
      final me = await repo.create(const NewPerson(fullName: 'Me', isSelf: true));
      expect(() => repo.softDelete(me.id), throwsStateError);
    });
  });
}
