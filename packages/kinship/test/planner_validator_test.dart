import 'package:kinship/kinship.dart';
import 'package:test/test.dart';

import 'fixture.dart';

void main() {
  final graph = sharmaFamily();

  group('relation templates', () {
    test('every template has a bilingual term', () {
      for (final t in relationTemplates) {
        expect(t.term.hi, isNotEmpty, reason: t.key);
        expect(t.term.en, isNotEmpty, reason: t.key);
      }
    });

    test('nameForKey names placeholders', () {
      expect(nameForKey('M').en, 'Mother');
      expect(nameForKey('M.B').hi, 'मामा');
      expect(nameForKey('F.eB').roman, 'Tau');
    });
  });

  group('RelativePlanner', () {
    final planner = RelativePlanner(graph);

    test('Mama: reuses mother and links the target to her parents', () {
      final r = planner.plan(anchorId: 'me', template: templateFor('M.B')!) as RelativePlan;
      expect(r.placeholders, isEmpty);
      expect(r.ops.map((o) => o.toString()), [
        'LinkParent(Existing(gopal) → Target)',
        'LinkParent(Existing(lakshmi) → Target)',
      ]);
    });

    test('Chachi: walks father → younger brother → spouse', () {
      final r = planner.plan(anchorId: 'me', template: templateFor('F.yB.W')!) as RelativePlan;
      expect(r.ops.single.toString(), 'LinkPartners(Existing(dinesh) ↔ Target)');
    });

    test('asks which son when there are several', () {
      final r = planner.plan(anchorId: 'mahesh', template: templateFor('S.W')!);
      expect(r, isA<NeedsChoice>());
      final choice = r as NeedsChoice;
      expect(choice.candidates, unorderedEquals(['me', 'rohit']));
      expect(choice.viaKey, 'S');

      final answered = planner.plan(anchorId: 'mahesh', template: templateFor('S.W')!, choices: {0: 'rohit'});
      expect((answered as RelativePlan).ops.single.toString(), 'LinkPartners(Existing(rohit) ↔ Target)');
    });

    test('"someone else" creates a placeholder', () {
      final r = planner.plan(anchorId: 'mahesh', template: templateFor('S.W')!, choices: {0: null}) as RelativePlan;
      expect(r.ops.map((o) => o.toString()), [
        'CreatePlaceholder(Placeholder#0, male, S)',
        'LinkParent(Existing(mahesh) → Placeholder#0)',
        'LinkPartners(Placeholder#0 ↔ Target)',
      ]);
    });

    test('Tau with no known grandparents: placeholder parent + seniority', () {
      final g =
          (GraphBuilder()
                ..person('kid', Gender.male)
                ..person('dad', Gender.male)
                ..child('dad', 'kid'))
              .build();
      final r = RelativePlanner(g).plan(anchorId: 'kid', template: templateFor('F.eB')!) as RelativePlan;
      expect(r.ops.map((o) => o.toString()), [
        'CreatePlaceholder(Placeholder#0, unknown, F.P)',
        'LinkParent(Placeholder#0 → Existing(dad))',
        'LinkParent(Placeholder#0 → Target)',
        'SetSeniority(Target > Existing(dad))',
      ]);
    });

    test('long relation on an empty profile: Mama’s son-in-law', () {
      final g = (GraphBuilder()..person('solo', Gender.female)).build();
      // Not a template, but the planner works for any key.
      final r = RelativePlanner(g)
          .plan(anchorId: 'solo', template: RelationTemplate('M.B.D.H', RelationGroup.maternal));
      final plan = r as RelativePlan;
      expect(plan.placeholders.map((p) => p.relationKey), ['M', 'M.B', 'M.P', 'M.B.D']);
      expect(plan.ops.last.toString(), 'LinkPartners(Placeholder#3 ↔ Target)');
    });

    test('sibling hop skips siblings with the wrong seniority', () {
      // me has elder sister priya and younger brother rohit: "elder brother" has no match.
      final r = planner.plan(anchorId: 'me', template: RelationTemplate('eB.W', RelationGroup.siblings));
      expect((r as RelativePlan).placeholders.single.relationKey, 'eB');
    });
  });

  group('GraphValidator', () {
    test('blocks cycles, duplicates and a third biological parent', () {
      List<String> codes(List<GraphViolation> v) => v.map((x) => x.code).toList();
      expect(
        codes(GraphValidator.parentEdge(graph, parentId: 'me', childId: 'ramPrasad')),
        contains(GraphViolation.cycle),
      );
      expect(
        codes(GraphValidator.parentEdge(graph, parentId: 'mahesh', childId: 'me')),
        contains(GraphViolation.duplicateEdge),
      );
      expect(
        codes(GraphValidator.parentEdge(graph, parentId: 'suresh', childId: 'me')),
        containsAll([GraphViolation.tooManyBioParents, GraphViolation.duplicateBioParentGender]),
      );
      expect(GraphValidator.parentEdge(graph, parentId: 'me', childId: 'me').single.code, GraphViolation.selfRelation);
      expect(GraphValidator.parentEdge(graph, parentId: 'mahesh', childId: 'karan', kind: ParentKind.step), isEmpty);
    });

    test('warns about implausible ages', () {
      final v = GraphValidator.parentEdge(graph, parentId: 'rohit', childId: 'priya', kind: ParentKind.adoptive);
      expect(v.single.code, GraphViolation.parentTooYoung);
      expect(v.single.blocks, isFalse);
    });

    test('partnerships', () {
      expect(GraphValidator.partnership(graph, aId: 'me', bId: 'mahesh').single.code, GraphViolation.partnerIsAncestor);
      expect(GraphValidator.partnership(graph, aId: 'me', bId: 'priya').single.code, GraphViolation.closeBloodMarriage);
      expect(GraphValidator.partnership(graph, aId: 'me', bId: 'anjali').single.code, GraphViolation.duplicateEdge);
      expect(GraphValidator.partnership(graph, aId: 'rohit', bId: 'pooja'), isEmpty);
    });
  });
}
