import 'dart:async';

import 'package:drift/drift.dart';
import 'package:kinship/kinship.dart';

import '../../../core/database/app_database.dart';
import '../../../core/sync/outbox_writer.dart';
import '../../../core/utils/id_generator.dart';
import '../../people/domain/people_repository.dart';
import '../../people/domain/person.dart';

/// Thrown when a write would break a family-graph rule (cycle, third
/// biological parent, …). [violations] carries the stable codes.
class GraphRuleException implements Exception {
  const GraphRuleException(this.violations);

  final List<GraphViolation> violations;

  @override
  String toString() => 'GraphRuleException(${violations.map((v) => v.code).join(', ')})';
}

/// Who the relative being added is.
sealed class RelativeTarget {
  const RelativeTarget();
}

final class ExistingTarget extends RelativeTarget {
  const ExistingTarget(this.personId);
  final String personId;
}

final class NewTarget extends RelativeTarget {
  const NewTarget(this.person);
  final NewPerson person;
}

/// A plan with ids resolved and validated, ready to commit.
final class PreparedPlan {
  const PreparedPlan._({
    required this.anchorId,
    required this.plan,
    required this.target,
    required this.targetId,
    required this.placeholderIds,
    required this.warnings,
  });

  final String anchorId;
  final RelativePlan plan;
  final RelativeTarget target;
  final String targetId;
  final Map<int, String> placeholderIds;

  /// Non-blocking issues (e.g. implausible ages) the user should confirm.
  final List<GraphViolation> warnings;
}

/// Reads the family graph and writes family/social edges.
class GraphRepository {
  GraphRepository({
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

  // ---------------------------------------------------------------- reads

  /// Emits a fresh graph whenever people or edges change.
  Stream<FamilyGraph> watchGraph() async* {
    yield await loadGraph();
    final updates = _db.tableUpdates(
      TableUpdateQuery.onAllTables([_db.people, _db.parentChild, _db.partnerships, _db.socialConnections]),
    );
    await for (final _ in updates) {
      yield await loadGraph();
    }
  }

  Future<FamilyGraph> loadGraph() async {
    final people = await (_db.select(_db.people)..where((p) => p.deletedAt.isNull() & p.mergedIntoId.isNull())).get();
    final parents = await (_db.select(_db.parentChild)..where((e) => e.deletedAt.isNull())).get();
    final partners = await (_db.select(_db.partnerships)..where((e) => e.deletedAt.isNull())).get();
    final social = await (_db.select(_db.socialConnections)..where((e) => e.deletedAt.isNull())).get();
    return FamilyGraph(
      people: [
        for (final p in people)
          KinPerson(
            id: p.id,
            gender: Gender.fromDb(p.gender),
            birthYear: p.birthYear,
            birthMonth: p.birthMonth,
            birthDay: p.birthDay,
            birthOrder: p.birthOrder,
            isPlaceholder: p.isPlaceholder,
          ),
      ],
      parentEdges: [
        for (final e in parents) ParentEdge(parentId: e.parentId, childId: e.childId, kind: ParentKind.fromDb(e.kind)),
      ],
      partnerships: [
        for (final e in partners)
          PartnerEdge(aId: e.personAId, bId: e.personBId, active: e.status == 'active' || e.status == 'widowed'),
      ],
      social: [for (final e in social) SocialEdge(aId: e.personId, bId: e.otherPersonId, type: e.connectionType)],
    );
  }

  // ------------------------------------------------------ add relatives

  /// Resolves ids and validates the whole plan on a simulated graph.
  /// Throws [GraphRuleException] if any step is blocked.
  Future<PreparedPlan> prepare({
    required String anchorId,
    required RelativePlan plan,
    required RelativeTarget target,
  }) async {
    final graph = await loadGraph();
    final targetId = switch (target) {
      ExistingTarget(:final personId) => personId,
      NewTarget() => _ids.newId(),
    };
    final placeholderIds = {for (final p in plan.placeholders) p.ref.index: _ids.newId()};
    String idOf(NodeRef r) => switch (r) {
      ExistingRef(:final id) => id,
      PlaceholderRef(:final index) => placeholderIds[index]!,
      TargetRef() => targetId,
    };

    var sim = graph.extendedWith(
      people: [
        if (target is NewTarget) KinPerson(id: targetId, gender: target.person.gender),
        for (final p in plan.placeholders) KinPerson(id: placeholderIds[p.ref.index]!, gender: p.gender),
      ],
    );
    final violations = <GraphViolation>[];
    for (final op in plan.ops) {
      switch (op) {
        case LinkParent(:final parent, :final child):
          violations.addAll(GraphValidator.parentEdge(sim, parentId: idOf(parent), childId: idOf(child)));
          sim = sim.extendedWith(
            parentEdges: [ParentEdge(parentId: idOf(parent), childId: idOf(child))],
          );
        case LinkPartners(:final a, :final b):
          violations.addAll(GraphValidator.partnership(sim, aId: idOf(a), bId: idOf(b)));
          sim = sim.extendedWith(
            partnerships: [PartnerEdge(aId: idOf(a), bId: idOf(b))],
          );
        case CreatePlaceholder() || SetSeniority():
          break;
      }
    }
    final blocks = violations.where((v) => v.blocks).toList();
    if (blocks.isNotEmpty) throw GraphRuleException(blocks);
    return PreparedPlan._(
      anchorId: anchorId,
      plan: plan,
      target: target,
      targetId: targetId,
      placeholderIds: placeholderIds,
      warnings: violations,
    );
  }

  /// Writes a prepared plan atomically. Returns the target person's id.
  Future<String> commit(PreparedPlan p) => _db.transaction(() async {
    final now = _clock();
    String idOf(NodeRef r) => switch (r) {
      ExistingRef(:final id) => id,
      PlaceholderRef(:final index) => p.placeholderIds[index]!,
      TargetRef() => p.targetId,
    };

    if (p.target case NewTarget(:final person)) {
      await _insertPerson(id: p.targetId, fullName: person.fullName, now: now, input: person);
    }
    final anchor = await (_db.select(_db.people)..where((x) => x.id.equals(p.anchorId))).getSingle();
    for (final op in p.plan.ops) {
      switch (op) {
        case CreatePlaceholder(:final ref, :final gender, :final relationKey):
          final names = placeholderNames(anchor.fullName, relationKey);
          await _insertPerson(
            id: p.placeholderIds[ref.index]!,
            fullName: names.en,
            fullNameAlt: names.hi,
            gender: gender,
            placeholder: true,
            now: now,
          );
        case LinkParent(:final parent, :final child):
          await addParentEdge(parentId: idOf(parent), childId: idOf(child), validated: true, now: now);
        case LinkPartners(:final a, :final b):
          await addPartnership(aId: idOf(a), bId: idOf(b), validated: true, now: now);
        case SetSeniority(:final elder, :final younger):
          await _applySeniority(idOf(elder), idOf(younger), now);
      }
    }
    return p.targetId;
  });

  /// "Ramesh's mother" / "रमेश की माता".
  static ({String en, String hi}) placeholderNames(String anchorName, String relationKey) {
    final name = nameForKey(relationKey);
    final en = name.en[0].toLowerCase() + name.en.substring(1);
    final last = Hop.parseKey(relationKey).last.gender;
    return (en: "$anchorName's $en", hi: '$anchorName ${last == Gender.female ? 'की' : 'के'} ${name.hi}');
  }

  /// Creates a standalone person (e.g. a new friend picked in a sheet).
  Future<String> createPerson(NewPerson person) async => (await _people.create(person)).id;

  // --------------------------------------------------- single edges

  Future<void> addParentEdge({
    required String parentId,
    required String childId,
    ParentKind kind = ParentKind.biological,
    bool validated = false,
    DateTime? now,
  }) => _db.transaction(() async {
    if (!validated) {
      final blocks = GraphValidator.parentEdge(
        await loadGraph(),
        parentId: parentId,
        childId: childId,
        kind: kind,
      ).where((v) => v.blocks).toList();
      if (blocks.isNotEmpty) throw GraphRuleException(blocks);
    }
    final t = now ?? _clock();
    final row = ParentChildRow(
      id: _ids.newId(),
      createdAt: t,
      updatedAt: t,
      serverSeq: 0,
      parentId: parentId,
      childId: childId,
      kind: kind.dbValue,
      certainty: 'confirmed',
    );
    await _db.into(_db.parentChild).insert(row);
    await _outbox.enqueue(_db.parentChild, row.id, row);
  });

  Future<void> addPartnership({
    required String aId,
    required String bId,
    String status = 'active',
    bool validated = false,
    DateTime? now,
  }) => _db.transaction(() async {
    if (!validated) {
      final blocks = GraphValidator.partnership(
        await loadGraph(),
        aId: aId,
        bId: bId,
      ).where((v) => v.blocks).toList();
      if (blocks.isNotEmpty) throw GraphRuleException(blocks);
    }
    final t = now ?? _clock();
    // Canonical order (matches the server CHECK person_a_id < person_b_id).
    final (a, b) = aId.toLowerCase().compareTo(bId.toLowerCase()) < 0 ? (aId, bId) : (bId, aId);
    final row = PartnershipRow(
      id: _ids.newId(),
      createdAt: t,
      updatedAt: t,
      serverSeq: 0,
      personAId: a,
      personBId: b,
      kind: 'marriage',
      status: status,
      startDateApprox: false,
    );
    await _db.into(_db.partnerships).insert(row);
    await _outbox.enqueue(_db.partnerships, row.id, row);
  });

  Future<void> addSocialConnection({
    required String personId,
    required String otherPersonId,
    required String type,
    String? description,
  }) => _db.transaction(() async {
    if (personId == otherPersonId) {
      throw const GraphRuleException([GraphViolation(GraphViolation.selfRelation, ViolationSeverity.block)]);
    }
    final now = _clock();
    final row = SocialConnectionRow(
      id: _ids.newId(),
      createdAt: now,
      updatedAt: now,
      serverSeq: 0,
      personId: personId,
      otherPersonId: otherPersonId,
      connectionType: type,
      description: description,
    );
    await _db.into(_db.socialConnections).insert(row);
    await _outbox.enqueue(_db.socialConnections, row.id, row);
  });

  /// Removes the link between two people (never the people themselves).
  Future<void> removeLink(String a, String b) => _db.transaction(() async {
    final now = _clock();
    final pc =
        await (_db.select(_db.parentChild)..where(
              (e) =>
                  e.deletedAt.isNull() &
                  ((e.parentId.equals(a) & e.childId.equals(b)) | (e.parentId.equals(b) & e.childId.equals(a))),
            ))
            .get();
    for (final r in pc) {
      final row = r.copyWith(deletedAt: Value(now), updatedAt: now);
      await _db.update(_db.parentChild).replace(row);
      await _outbox.enqueue(_db.parentChild, row.id, row);
    }
    final ps =
        await (_db.select(_db.partnerships)..where(
              (e) =>
                  e.deletedAt.isNull() &
                  ((e.personAId.equals(a) & e.personBId.equals(b)) | (e.personAId.equals(b) & e.personBId.equals(a))),
            ))
            .get();
    for (final r in ps) {
      final row = r.copyWith(deletedAt: Value(now), updatedAt: now);
      await _db.update(_db.partnerships).replace(row);
      await _outbox.enqueue(_db.partnerships, row.id, row);
    }
    final sc =
        await (_db.select(_db.socialConnections)..where(
              (e) =>
                  e.deletedAt.isNull() &
                  ((e.personId.equals(a) & e.otherPersonId.equals(b)) |
                      (e.personId.equals(b) & e.otherPersonId.equals(a))),
            ))
            .get();
    for (final r in sc) {
      final row = r.copyWith(deletedAt: Value(now), updatedAt: now);
      await _db.update(_db.socialConnections).replace(row);
      await _outbox.enqueue(_db.socialConnections, row.id, row);
    }
  });

  /// Marks a partnership as divorced / widowed / … .
  Future<void> setPartnershipStatus(String a, String b, String status) => _db.transaction(() async {
    final rows =
        await (_db.select(_db.partnerships)..where(
              (e) =>
                  e.deletedAt.isNull() &
                  ((e.personAId.equals(a) & e.personBId.equals(b)) | (e.personAId.equals(b) & e.personBId.equals(a))),
            ))
            .get();
    for (final r in rows) {
      final row = r.copyWith(status: status, updatedAt: _clock());
      await _db.update(_db.partnerships).replace(row);
      await _outbox.enqueue(_db.partnerships, row.id, row);
    }
  });

  // ------------------------------------------------------------ helpers

  Future<void> _insertPerson({
    required String id,
    required String fullName,
    required DateTime now,
    String? fullNameAlt,
    Gender gender = Gender.unknown,
    bool placeholder = false,
    NewPerson? input,
  }) async {
    final row = PersonRow(
      id: id,
      createdAt: now,
      updatedAt: now,
      serverSeq: 0,
      fullName: fullName.trim(),
      fullNameAlt: input?.fullNameAlt?.trim().isNotEmpty ?? false ? input!.fullNameAlt!.trim() : fullNameAlt,
      gender: (input?.gender ?? gender).dbValue,
      birthDateApprox: false,
      notes: input?.notes,
      nativePlaceId: input?.nativePlaceId,
      isSelf: false,
      isPlaceholder: placeholder,
      isFavorite: false,
      notifyBirthday: true,
      searchText: '',
    );
    await _db.into(_db.people).insert(row);
    await _outbox.enqueue(_db.people, id, row);
    final phone = input?.phone?.trim() ?? '';
    // Also rebuilds the person's search index.
    await _people.saveContacts(id, [if (phone.isNotEmpty) ContactMethod(kind: 'phone', value: phone, isPrimary: true)]);
  }

  /// Records seniority via birth order, only when neither person has one.
  Future<void> _applySeniority(String elderId, String youngerId, DateTime now) async {
    final rows = await (_db.select(_db.people)..where((p) => p.id.isIn([elderId, youngerId]))).get();
    if (rows.length != 2 || rows.any((r) => r.birthOrder != null)) return;
    for (final r in rows) {
      final row = r.copyWith(birthOrder: Value(r.id == elderId ? 1 : 2), updatedAt: now);
      await _db.update(_db.people).replace(row);
      await _outbox.enqueue(_db.people, row.id, row);
    }
  }
}
