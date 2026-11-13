import 'package:flutter_test/flutter_test.dart';
import 'package:kinship/kinship.dart';
import 'package:parichit/core/database/app_database.dart';
import 'package:parichit/core/sync/outbox_writer.dart';
import 'package:parichit/core/sync/sync_engine.dart';
import 'package:parichit/core/sync/sync_remote.dart';
import 'package:parichit/features/people/data/drift_people_repository.dart';
import 'package:parichit/features/people/domain/person.dart';

import '../../helpers/test_database.dart';

/// In-memory stand-in for Supabase: keeps rows per table, stamps
/// `server_seq`, applies last-write-wins and can be told to fail.
class FakeRemote implements SyncRemote {
  final tables = <String, Map<String, Map<String, Object?>>>{};
  int _seq = 0;
  SyncRemoteException? failWith;
  final upserts = <(String, int)>[];

  /// Rejects any row for which this returns an exception.
  SyncRemoteException? Function(String table, Map<String, Object?> row)? reject;

  @override
  Future<void> upsert(String table, List<Map<String, Object?>> rows) async {
    if (failWith != null) throw failWith!;
    for (final row in rows) {
      final err = reject?.call(table, row);
      if (err != null) throw err;
    }
    upserts.add((table, rows.length));
    final store = tables.putIfAbsent(table, () => {});
    for (final row in rows) {
      final existing = store[row['id']];
      if (existing != null &&
          DateTime.parse(row['updated_at']! as String).isBefore(DateTime.parse(existing['updated_at']! as String))) {
        continue;
      }
      store[row['id']! as String] = {...?existing, ...row, 'server_seq': ++_seq, 'owner_id': 'owner'};
    }
  }

  @override
  Future<List<Map<String, Object?>>> fetchChanges(String table, int afterSeq, int limit) async {
    if (failWith != null) throw failWith!;
    final rows =
        (tables[table]?.values ?? const <Map<String, Object?>>[])
            .where((r) => (r['server_seq']! as int) > afterSeq)
            .toList()
          ..sort((a, b) => (a['server_seq']! as int).compareTo(b['server_seq']! as int));
    return rows.take(limit).toList();
  }
}

void main() {
  late AppDatabase db;
  late FakeRemote remote;
  late SyncEngine engine;
  late DriftPeopleRepository repo;
  late DateTime Function() clock;

  setUp(() {
    db = createTestDatabase();
    remote = FakeRemote();
    clock = steppingClock();
    engine = SyncEngine(db: db, remote: remote, clock: clock);
    repo = DriftPeopleRepository(
      db: db,
      outbox: OutboxWriter(db, clock: clock),
      ids: SequentialIds(),
      clock: clock,
    );
  });

  tearDown(() => db.close());

  Future<int> outboxCount() async => (await db.select(db.syncOutbox).get()).length;

  test('push sends local rows in FIFO order, clears the outbox, and pull is a no-op for own rows', () async {
    await repo.create(const NewPerson(fullName: 'Asha', gender: Gender.female, isSelf: true, phone: '9876543210'));
    expect(await outboxCount(), 2);

    final report = await engine.sync();

    expect(report.ok, isTrue);
    expect(report.pushed, 2);
    expect(await outboxCount(), 0);
    expect(remote.tables['people']!.keys, ['id-1']);
    expect(remote.tables['person_contacts']!.values.single['person_id'], 'id-1');
    // Parent table was pushed before the child (FK order).
    expect(remote.upserts.map((u) => u.$1), ['people', 'person_contacts']);
    // Device-only columns never reach the cloud.
    expect(remote.tables['people']!['id-1']!.containsKey('search_text'), isFalse);
    // Cursor advanced from the pulled copy of our own row.
    final people = await db.select(db.people).get();
    expect(people.single.serverSeq, greaterThan(0));
    expect(people.single.searchText, contains('asha'));
  });

  test('repeated edits are coalesced into one upsert with the latest snapshot', () async {
    final p = await repo.create(const NewPerson(fullName: 'Ravi', gender: Gender.male));
    await repo.softDelete(p.id);
    await repo.restore(p.id);
    expect(await outboxCount(), 3);

    await engine.sync();

    expect(remote.upserts.where((u) => u.$1 == 'people').single.$2, 1);
    expect(remote.tables['people']!['id-1']!['deleted_at'], isNull);
  });

  test('network failure keeps the outbox and reports a transient error', () async {
    await repo.create(const NewPerson(fullName: 'Meera', gender: Gender.female));
    remote.failWith = const SyncRemoteException(transient: true, message: 'offline');

    final report = await engine.sync();

    expect(report.ok, isFalse);
    expect(report.error!.transient, isTrue);
    expect(await outboxCount(), 1);
    expect((await db.select(db.syncOutbox).getSingle()).attempts, 1);

    remote.failWith = null;
    expect((await engine.sync()).ok, isTrue);
    expect(await outboxCount(), 0);
  });

  test('a rejected change moves to sync_issues and does not block the rest', () async {
    await repo.create(const NewPerson(fullName: 'Bad', gender: Gender.male));
    await repo.create(const NewPerson(fullName: 'Good', gender: Gender.male));
    remote.reject = (table, row) =>
        row['full_name'] == 'Bad' ? const SyncRemoteException(transient: false, code: 'P0001', message: 'nope') : null;

    final report = await engine.sync();

    expect(report.ok, isTrue);
    expect(report.rejected, 1);
    expect(remote.tables['people']!.keys, ['id-2']);
    final issues = await db.select(db.syncIssues).get();
    expect(issues.single.recordId, 'id-1');
    expect(issues.single.errorCode, 'P0001');
    expect(await outboxCount(), 0);
  });

  test('pull restores a new device from the cloud, including search text', () async {
    // Device A
    await repo.create(
      const NewPerson(fullName: 'Sunita Devi', fullNameAlt: 'सुनीता', gender: Gender.female, phone: '9812345678'),
    );
    await engine.sync();

    // Device B: empty database, same cloud.
    final dbB = createTestDatabase();
    addTearDown(dbB.close);
    final report = await SyncEngine(db: dbB, remote: remote, clock: clock).sync();

    expect(report.pulled, 2);
    final person = await dbB.select(dbB.people).getSingle();
    expect(person.fullName, 'Sunita Devi');
    expect(person.gender, 'female');
    expect(person.createdAt.isUtc, isTrue);
    expect(person.searchText, allOf(contains('sunita devi'), contains('9812345678')));
    expect((await dbB.select(dbB.personContacts).getSingle()).isPrimary, isTrue);
    // Pulling never creates outbox entries (no echo loop).
    expect(await dbB.select(dbB.syncOutbox).get(), isEmpty);
  });

  test('pull skips records that have a pending local change, and ignores older remote rows', () async {
    final p = await repo.create(const NewPerson(fullName: 'Local Name', gender: Gender.male));
    await engine.sync();

    // Remote copy edited elsewhere (newer), but we also have a pending local edit.
    final remoteRow = remote.tables['people']!['id-1']!;
    remote.tables['people']!['id-1'] = {
      ...remoteRow,
      'full_name': 'Remote Name',
      'updated_at': DateTime.utc(2030).toIso8601String(),
      'server_seq': 999,
    };
    await repo.softDelete(p.id); // pending local change
    await engine.sync(); // push first: local (older updated_at) loses at the server → remote kept
    final after = await db.select(db.people).getSingle();
    expect(after.fullName, 'Remote Name');
  });

  test('unique violation on an edge soft-deletes the local duplicate instead of raising an issue', () async {
    await repo.create(const NewPerson(fullName: 'Parent', gender: Gender.male));
    await repo.create(const NewPerson(fullName: 'Child', gender: Gender.male));
    await engine.sync();

    final now = clock();
    final edge = ParentChildCompanion.insert(
      id: 'edge-1',
      createdAt: now,
      updatedAt: now,
      parentId: 'id-1',
      childId: 'id-2',
    );
    await db.transaction(() async {
      await db.into(db.parentChild).insert(edge);
      await OutboxWriter(db, clock: clock).enqueue(db.parentChild, 'edge-1', edge);
    });
    remote.reject = (t, r) => const SyncRemoteException(transient: false, code: '23505', message: 'dup');

    final report = await engine.sync();

    expect(report.rejected, 0);
    expect(await db.select(db.syncIssues).get(), isEmpty);
    expect((await db.select(db.parentChild).getSingle()).deletedAt, isNotNull);
    expect(await outboxCount(), 0);
  });

  test('concurrent sync calls share one run', () async {
    await repo.create(const NewPerson(fullName: 'Once', gender: Gender.male));
    final a = engine.sync();
    final b = engine.sync();
    expect(identical(a, b), isTrue);
    await a;
    expect(remote.upserts.length, 1);
  });
}
