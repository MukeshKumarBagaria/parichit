import 'dart:typed_data';

import 'package:drift/drift.dart' show OrderingTerm;
import 'package:flutter_test/flutter_test.dart';
import 'package:kinship/kinship.dart';
import 'package:parichit/core/database/app_database.dart';
import 'package:parichit/core/sync/outbox_writer.dart';
import 'package:parichit/core/sync/sync_engine.dart';
import 'package:parichit/core/utils/name_matching.dart';
import 'package:parichit/features/backup/data/backup_codec.dart';
import 'package:parichit/features/backup/data/exporters.dart';
import 'package:parichit/features/duplicates/data/merge_repository.dart';
import 'package:parichit/features/family_tree/domain/tree_layout.dart';
import 'package:parichit/features/interactions/data/interactions_repository.dart';
import 'package:parichit/features/interactions/domain/interaction.dart';
import 'package:parichit/features/people/data/drift_people_repository.dart';
import 'package:parichit/features/people/domain/person.dart';
import 'package:parichit/features/relationships/data/graph_repository.dart';
import 'package:parichit/features/reminders/domain/upcoming.dart';
import 'package:parichit/features/tags/data/tags_repository.dart';

import '../helpers/fake_remote.dart';
import '../helpers/test_database.dart';

/// Everything wired against one in-memory database.
class _World {
  _World() {
    db = createTestDatabase();
    outbox = OutboxWriter(db, clock: clock);
    people = DriftPeopleRepository(db: db, outbox: outbox, ids: ids, clock: clock);
    graph = GraphRepository(db: db, outbox: outbox, ids: ids, people: people, clock: clock);
  }

  final ids = SequentialIds();
  final clock = steppingClock();
  late final AppDatabase db;
  late final OutboxWriter outbox;
  late final DriftPeopleRepository people;
  late final GraphRepository graph;

  Future<String> person(String name, {Gender gender = Gender.unknown, bool self = false, String? phone}) async =>
      (await people.create(NewPerson(fullName: name, gender: gender, isSelf: self, phone: phone))).id;

  Future<RelationName> relation(String from, String to) async =>
      RelationNamer.name(PathFinder(await graph.loadGraph()).find(from, to)!);

  /// Adds a relative through the same plan → prepare → commit path the UI uses.
  Future<String> addRelative(String anchor, String key, NewPerson target) async {
    final plan = RelativePlanner(await graph.loadGraph()).plan(anchorId: anchor, template: templateFor(key)!);
    return graph.commit(await graph.prepare(anchorId: anchor, plan: plan as RelativePlan, target: NewTarget(target)));
  }
}

void main() {
  group('name matching', () {
    test('transliterates and matches spellings across scripts', () {
      expect(NameMatching.transliterate('रमेश'), 'ramesh');
      expect(NameMatching.phoneticKey('Shrivastava'), NameMatching.phoneticKey('Srivastav'));
      expect(NameMatching.phoneticKey('रमेश'), NameMatching.phoneticKey('Ramesh'));
      expect(NameMatching.jaroWinkler('martha', 'marhta'), greaterThan(0.95));
    });
  });

  group('graph repository', () {
    late _World w;
    setUp(() => w = _World());
    tearDown(() => w.db.close());

    test('adding a Mama creates the link through a placeholder grandparent', () async {
      final me = await w.person('Me Sharma', gender: Gender.male, self: true);
      final mom = await w.person('Sunita', gender: Gender.female);
      await w.graph.addParentEdge(parentId: mom, childId: me);

      final mama = await w.addRelative(
        me,
        'M.B',
        const NewPerson(fullName: 'Ramesh Mama', gender: Gender.male, phone: '9829012345'),
      );

      expect((await w.relation(me, mama)).hi, 'मामा');
      final placeholders = await (w.db.select(w.db.people)..where((p) => p.isPlaceholder.equals(true))).get();
      expect(placeholders.single.fullName, "Me Sharma's mother's parent");
      expect((await w.people.watchAll(query: '9829').first).map((p) => p.id), contains(mama));
    });

    test('blocks cycles', () async {
      final a = await w.person('A');
      final b = await w.person('B');
      await w.graph.addParentEdge(parentId: a, childId: b);
      expect(
        () => w.graph.addParentEdge(parentId: b, childId: a),
        throwsA(isA<GraphRuleException>().having((e) => e.violations.first.code, 'code', GraphViolation.cycle)),
      );
    });

    test('soft delete cascades to edges and restore brings them back', () async {
      final kid = await w.person('Kid');
      final mom = await w.person('Mom', gender: Gender.female);
      await w.graph.addParentEdge(parentId: mom, childId: kid);

      await w.people.softDelete(mom);
      expect((await w.graph.loadGraph()).parentsOf(kid), isEmpty);
      await w.people.restore(mom);
      expect((await w.graph.loadGraph()).parentsOf(kid), [mom]);
    });

    test('partnerships are stored in canonical order', () async {
      final a = await w.person('A');
      final b = await w.person('B');
      await w.graph.addPartnership(aId: b, bId: a);
      final row = (await w.db.select(w.db.partnerships).get()).single;
      expect(row.personAId.compareTo(row.personBId), lessThan(0));
    });
  });

  group('duplicates & merge', () {
    test('finds a duplicate and merging connects the families', () async {
      final w = _World();
      addTearDown(w.db.close);
      final me = await w.person('Me', gender: Gender.male, self: true);
      final mom = await w.person('Sunita', gender: Gender.female);
      await w.graph.addParentEdge(parentId: mom, childId: me);
      final mama = await w.addRelative(
        me,
        'M.B',
        const NewPerson(fullName: 'Ramesh', gender: Gender.male, phone: '9829012345'),
      );

      // The same man saved separately, with his son.
      final dup = await w.person('Ramesh', phone: '+91 98290 12345');
      final son = await w.person('Arjun', gender: Gender.male);
      await w.graph.addParentEdge(parentId: dup, childId: son);

      final merge = MergeRepository(db: w.db, outbox: w.outbox, ids: w.ids, people: w.people, clock: w.clock);
      final pairs = await merge.scan();
      expect(pairs.any((p) => {p.aId, p.bId}.containsAll({mama, dup})), isTrue);

      await merge.merge(survivorId: mama, mergedId: dup);
      expect((await w.relation(me, son)).hi, 'ममेरा भाई');
      expect((await w.graph.loadGraph()).contains(dup), isFalse);
      // One primary phone survives — the person is listed exactly once.
      expect((await w.people.watchAll().first).where((p) => p.id == mama), hasLength(1));
    });
  });

  group('meetings, reminders, tags', () {
    test('meeting with several people creates a follow-up reminder', () async {
      final w = _World();
      addTearDown(w.db.close);
      final a = await w.person('A');
      final b = await w.person('B');
      final repo = InteractionsRepository(db: w.db, outbox: w.outbox, ids: w.ids, clock: w.clock);
      final id = await repo.create(
        InteractionDraft(occurredAt: DateTime(2026, 11), participantIds: [a, b], followUpOn: DateTime(2026, 11, 20)),
      );
      final forB = await repo.watchAll(personId: b).first;
      expect(forB.single.id, id);
      expect(forB.single.participantIds, unorderedEquals([a, b]));
      expect((await repo.watchLastMet().first).keys, containsAll([a, b]));
      expect((await w.db.select(w.db.reminders).get()).single.reminderType, 'follow_up');
    });

    test('agenda computes birthdays and includes reminders', () {
      final now = DateTime.utc(2026);
      final items = Agenda.build(
        today: DateTime(2026, 11, 13),
        days: 30,
        people: [
          Person(
            id: 'b',
            fullName: 'B',
            createdAt: now,
            updatedAt: now,
            birthDate: const PartialDate(year: 1990, month: 11, day: 15),
          ),
        ],
        marriages: const [],
        reminders: [ReminderInfo(id: 'r', title: 'Call', dueAt: DateTime(2026, 11, 20, 9))],
      );
      expect(items.map((i) => i.kind), [UpcomingKind.birthday, UpcomingKind.reminder]);
      expect(items.first.years, 36);
    });

    test('tags can be assigned', () async {
      final w = _World();
      addTearDown(w.db.close);
      final p = await w.person('P');
      final tags = TagsRepository(db: w.db, outbox: w.outbox, ids: w.ids, clock: w.clock);
      await tags.ensureDefaults();
      final first = (await tags.watchAll().first).first;
      await tags.setTags(p, {first.id});
      expect((await tags.watchAssignments().first)[p], {first.id});
    });
  });

  group('sync engine', () {
    test('push drains the outbox and a second device pulls the same family', () async {
      final w = _World();
      addTearDown(w.db.close);
      final me = await w.person('Me', gender: Gender.male, self: true);
      final dad = await w.person('Dad', gender: Gender.male);
      await w.graph.addParentEdge(parentId: dad, childId: me);

      final remote = FakeRemote();
      final engine = SyncEngine(w.db, remote, clock: w.clock);
      await engine.syncOnce();
      expect(await engine.watchPendingCount().first, 0);
      expect(remote.tables['people'], hasLength(2));

      final device2 = createTestDatabase();
      addTearDown(device2.close);
      await SyncEngine(device2, remote, clock: w.clock).pull();
      final out2 = OutboxWriter(device2);
      final g2 = await GraphRepository(
        db: device2,
        outbox: out2,
        ids: SequentialIds(),
        people: DriftPeopleRepository(db: device2, outbox: out2, ids: SequentialIds()),
      ).loadGraph();
      expect(g2.parentsOf(me), [dad]);
      final row = await (device2.select(device2.people)..where((p) => p.id.equals(me))).getSingle();
      expect(row.isSelf, isTrue);
    });

    test('a pending local edit is not overwritten by a pull', () async {
      final w = _World();
      addTearDown(w.db.close);
      final p = await w.person('Original');
      final remote = FakeRemote();
      final engine = SyncEngine(w.db, remote, clock: w.clock);
      await engine.syncOnce();

      await w.people.update(p, const PersonDraft(fullName: 'Local edit'));
      remote.tables['people']![p] = {
        ...remote.tables['people']![p]!,
        'full_name': 'Remote',
        'server_seq': ++remote.seq,
      };
      await engine.pull();
      expect((await w.people.watchById(p).first)!.fullName, 'Local edit');
    });

    test('a rejected row is isolated into sync issues', () async {
      final w = _World();
      addTearDown(w.db.close);
      final bad = await w.person('Bad');
      final good = await w.person('Good');
      final remote = FakeRemote()..rejectIds.add(bad);
      final engine = SyncEngine(w.db, remote, clock: w.clock);
      final (_, rejected) = await engine.push();
      expect(rejected, 1);
      expect(remote.tables['people']!.keys, contains(good));
      expect(await engine.watchIssues().first, hasLength(1));
    });

    test('network failure keeps the outbox intact', () async {
      final w = _World();
      addTearDown(w.db.close);
      await w.person('Someone');
      final engine = SyncEngine(w.db, FakeRemote()..offline = true, clock: w.clock);
      await expectLater(engine.push(), throwsException);
      expect(await engine.watchPendingCount().first, greaterThan(0));
    });

    test('outbox is pushed in FIFO order', () async {
      final w = _World();
      addTearDown(w.db.close);
      await w.person('With phone', phone: '9829012345');
      final entries = await (w.db.select(w.db.syncOutbox)..orderBy([(o) => OrderingTerm.asc(o.seq)])).get();
      expect(entries.map((e) => e.entity), ['people', 'person_contacts']);
    });
  });

  group('backup & export', () {
    test('encrypted backup round-trips and rejects a wrong passphrase', () async {
      final bytes = await BackupCodec.encode({
        'people': [
          {'id': 'x', 'full_name': 'रमेश'},
        ],
      }, 'secret123');
      final decoded = await BackupCodec.decode(Uint8List.fromList(bytes), 'secret123');
      expect(decoded['people']!.single['full_name'], 'रमेश');
      await expectLater(
        BackupCodec.decode(Uint8List.fromList(bytes), 'wrong!!'),
        throwsA(isA<BackupFormatException>()),
      );
    });

    test('GEDCOM and CSV exports', () async {
      final w = _World();
      addTearDown(w.db.close);
      final dad = await w.person('Mahesh Sharma', gender: Gender.male);
      final mom = await w.person('Sunita Sharma', gender: Gender.female);
      final kid = await w.person('Rahul Sharma', gender: Gender.male);
      await w.graph.addPartnership(aId: dad, bId: mom);
      await w.graph.addParentEdge(parentId: dad, childId: kid);
      await w.graph.addParentEdge(parentId: mom, childId: kid);

      final people = await w.db.select(w.db.people).get();
      final ged = GedcomExporter.export(
        people: people,
        parentEdges: await w.db.select(w.db.parentChild).get(),
        partnerships: await w.db.select(w.db.partnerships).get(),
      );
      expect(ged, startsWith('0 HEAD'));
      expect(ged, contains('1 NAME Rahul /Sharma/'));
      expect(ged, contains('1 HUSB'));
      expect(ged, contains('1 WIFE'));
      expect(ged, contains('1 CHIL'));
      expect(ged.trim(), endsWith('0 TRLR'));

      final csv = CsvExporter.people(people: people, phones: {}, places: {}, relationToMe: {kid: 'बेटा'}, tags: {});
      expect(csv.split('\n').first, contains('Relation to me'));
      expect(csv, contains('बेटा'));
    });
  });

  group('tree layout', () {
    test('parents above, spouse beside, no overlapping cards', () async {
      final w = _World();
      addTearDown(w.db.close);
      final me = await w.person('Me', gender: Gender.male);
      final mom = await w.person('Mom', gender: Gender.female);
      final dad = await w.person('Dad', gender: Gender.male);
      final wife = await w.person('Wife', gender: Gender.female);
      final sis = await w.person('Sister', gender: Gender.female);
      final son = await w.person('Son', gender: Gender.male);
      for (final p in [mom, dad]) {
        await w.graph.addParentEdge(parentId: p, childId: me);
        await w.graph.addParentEdge(parentId: p, childId: sis);
      }
      await w.graph.addPartnership(aId: me, bId: wife);
      await w.graph.addParentEdge(parentId: me, childId: son);

      final engine = TreeLayoutEngine(await w.graph.loadGraph());
      final layout = engine.layout(me);
      expect(layout.nodes.map((n) => n.personId), containsAll([me, mom, dad, wife, sis, son]));
      expect(layout.nodeFor(mom)!.y, lessThan(layout.nodeFor(me)!.y));
      expect(layout.nodeFor(son)!.y, greaterThan(layout.nodeFor(me)!.y));
      expect(layout.nodeFor(wife)!.y, layout.nodeFor(me)!.y);
      for (final a in layout.nodes) {
        for (final b in layout.nodes) {
          if (identical(a, b)) continue;
          final overlap = (a.x - b.x).abs() < engine.nodeWidth && (a.y - b.y).abs() < engine.nodeHeight;
          expect(overlap, isFalse, reason: '${a.personId} overlaps ${b.personId}');
        }
      }
    });
  });
}
