import 'package:kinship/kinship.dart';
import 'package:test/test.dart';

KinStep _s(StepKind kind, Gender g, {Seniority seniority = Seniority.unknown}) =>
    KinStep(kind: kind, toPersonId: '${kind.name}-${g.name}', toGender: g, seniority: seniority);

void main() {
  group('KinStep.token', () {
    test('parent, child and spouse tokens follow gender', () {
      expect(_s(StepKind.parent, Gender.male).token, 'F');
      expect(_s(StepKind.parent, Gender.female).token, 'M');
      expect(_s(StepKind.parent, Gender.unknown).token, 'P');
      expect(_s(StepKind.child, Gender.female).token, 'D');
      expect(_s(StepKind.spouse, Gender.female).token, 'W');
      expect(_s(StepKind.spouse, Gender.other).token, 'Sp');
    });

    test('sibling tokens carry seniority', () {
      expect(_s(StepKind.sibling, Gender.male, seniority: Seniority.elder).token, 'eB');
      expect(_s(StepKind.sibling, Gender.female, seniority: Seniority.younger).token, 'yZ');
      expect(_s(StepKind.sibling, Gender.male).token, 'B');
    });
  });

  group('KinPath', () {
    // Father's younger brother's daughter → चचेरी बहन.
    final cousin = KinPath([
      _s(StepKind.parent, Gender.male),
      _s(StepKind.sibling, Gender.male, seniority: Seniority.younger),
      _s(StepKind.child, Gender.female),
    ]);

    test('builds exact and plain keys', () {
      expect(cousin.key, 'F.yB.D');
      expect(cousin.plainKey, 'F.B.D');
    });

    test('computes generation difference', () {
      expect(cousin.generation, 0);
      expect(KinPath([_s(StepKind.parent, Gender.male), _s(StepKind.parent, Gender.female)]).generation, 2);
    });

    test('detects the family side', () {
      expect(cousin.side, RelationSide.paternal);
      expect(
        KinPath([_s(StepKind.parent, Gender.female), _s(StepKind.sibling, Gender.male)]).side,
        RelationSide.maternal,
      );
      expect(KinPath([_s(StepKind.spouse, Gender.female), _s(StepKind.parent, Gender.male)]).side, RelationSide.inLaws);
      expect(KinPath([_s(StepKind.parent, Gender.male)]).side, RelationSide.direct);
      expect(KinPath([_s(StepKind.child, Gender.male), _s(StepKind.child, Gender.female)]).side, RelationSide.direct);
    });
  });
}
