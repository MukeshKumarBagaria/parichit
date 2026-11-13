import 'package:kinship/kinship.dart';
import 'package:test/test.dart';

import 'fixture.dart';

void main() {
  final graph = sharmaFamily();
  final finder = PathFinder(graph);

  RelationName rel(String from, String to) {
    final path = finder.find(from, to);
    expect(path, isNotNull, reason: '$from → $to should be connected');
    return RelationNamer.name(path!);
  }

  /// [expected] = (from, to, path key, Hindi term, side).
  void expectRelations(List<(String, String, String, String, RelationSide)> expected) {
    for (final (from, to, key, hi, side) in expected) {
      final path = finder.find(from, to)!;
      final name = RelationNamer.name(path);
      expect((path.key, name.hi, name.side), (key, hi, side), reason: '$to is $from\'s …');
    }
  }

  group('blood relations (paternal & maternal)', () {
    test('parents, grandparents, siblings with seniority', () {
      expectRelations([
        ('me', 'mahesh', 'F', 'पिता', RelationSide.direct),
        ('me', 'sunita', 'M', 'माता', RelationSide.direct),
        ('me', 'ramPrasad', 'F.F', 'दादा', RelationSide.paternal),
        ('me', 'savitri', 'F.M', 'दादी', RelationSide.paternal),
        ('me', 'gopal', 'M.F', 'नाना', RelationSide.maternal),
        ('me', 'lakshmi', 'M.M', 'नानी', RelationSide.maternal),
        ('me', 'priya', 'eZ', 'दीदी', RelationSide.direct),
        ('me', 'rohit', 'yB', 'छोटा भाई', RelationSide.direct),
        ('rohit', 'me', 'eB', 'बड़े भैया', RelationSide.direct),
      ]);
    });

    test('uncles and aunts on both sides use the right Hindi term', () {
      expectRelations([
        ('me', 'dinesh', 'F.yB', 'चाचा', RelationSide.paternal), // younger than father
        ('me', 'usha', 'F.yB.W', 'चाची', RelationSide.paternal),
        ('me', 'kamla', 'F.yZ', 'बुआ', RelationSide.paternal),
        ('me', 'hari', 'F.yZ.H', 'फूफा', RelationSide.paternal),
        ('me', 'ramesh', 'M.yB', 'मामा', RelationSide.maternal),
        ('me', 'rekha', 'M.yB.W', 'मामी', RelationSide.maternal),
        ('me', 'geeta', 'M.yZ', 'मौसी', RelationSide.maternal),
        ('me', 'vinod', 'M.yZ.H', 'मौसा', RelationSide.maternal),
      ]);
    });

    test('cousins', () {
      expectRelations([
        ('me', 'neha', 'F.yB.D', 'चचेरी बहन', RelationSide.paternal),
        ('me', 'karan', 'F.yZ.S', 'फुफेरा भाई', RelationSide.paternal),
        ('me', 'arjun', 'M.yB.S', 'ममेरा भाई', RelationSide.maternal),
      ]);
    });

    test('Tau when the uncle is older than the father', () {
      final b = GraphBuilder()
        ..person('gf', Gender.male)
        ..person('dad', Gender.male, born: 1960)
        ..person('uncle', Gender.male, born: 1955)
        ..person('kid', Gender.male)
        ..child('gf', 'dad')
        ..child('gf', 'uncle')
        ..child('dad', 'kid');
      final name = RelationNamer.name(PathFinder(b.build()).find('kid', 'uncle')!);
      expect((name.hi, name.roman), ('ताऊ', 'Tau'));
    });

    test('unknown seniority falls back to the combined term', () {
      final b = GraphBuilder()
        ..person('gf', Gender.male)
        ..person('dad', Gender.male)
        ..person('uncle', Gender.male)
        ..person('kid', Gender.male)
        ..child('gf', 'dad')
        ..child('gf', 'uncle')
        ..child('dad', 'kid');
      expect(RelationNamer.name(PathFinder(b.build()).find('kid', 'uncle')!).hi, 'चाचा / ताऊ');
    });

    test('birth order decides seniority when dates are unknown', () {
      final b = GraphBuilder()
        ..person('p', Gender.male)
        ..person('a', Gender.male, order: 2)
        ..person('b', Gender.male, order: 1)
        ..child('p', 'a')
        ..child('p', 'b');
      expect(PathFinder(b.build()).find('a', 'b')!.key, 'eB');
    });
  });

  group('in-laws', () {
    test("husband's view of the wife's family", () {
      expectRelations([
        ('me', 'anjali', 'W', 'पत्नी', RelationSide.direct),
        ('me', 'suresh', 'W.F', 'ससुर', RelationSide.inLaws),
        ('me', 'kavita', 'W.M', 'सास', RelationSide.inLaws),
        ('me', 'vikas', 'W.B', 'साला', RelationSide.inLaws),
        ('me', 'neeta', 'W.B.W', 'सलहज', RelationSide.inLaws),
        ('me', 'pooja', 'W.Z', 'साली', RelationSide.inLaws),
        ('me', 'amit', 'W.Z.H', 'साढ़ू', RelationSide.inLaws),
      ]);
    });

    test("wife's view of the husband's family", () {
      expectRelations([
        ('anjali', 'me', 'H', 'पति', RelationSide.direct),
        ('anjali', 'mahesh', 'H.F', 'ससुर', RelationSide.inLaws),
        ('anjali', 'rohit', 'H.yB', 'देवर', RelationSide.inLaws),
        ('anjali', 'priya', 'H.eZ', 'ननद', RelationSide.inLaws),
        ('anjali', 'sanjay', 'H.eZ.H', 'ननदोई', RelationSide.inLaws),
      ]);
    });

    test("children's spouses and their parents", () {
      expectRelations([
        ('me', 'diya', 'S.W', 'बहू', RelationSide.direct),
        ('me', 'mohan', 'S.W.F', 'समधी', RelationSide.direct),
        ('dinesh', 'rohitGupta', 'D.H', 'दामाद', RelationSide.direct),
        ('dinesh', 'sunilGupta', 'D.H.F', 'समधी', RelationSide.direct),
        ('me', 'sanjay', 'eZ.H', 'जीजा', RelationSide.direct),
      ]);
    });
  });

  group('families connect automatically', () {
    test('the Gupta family is reached through a cousin’s marriage', () {
      // Neha (chacheri behen) married Rohit Gupta → his father is connected.
      final path = finder.find('me', 'sunilGupta', includeSocial: false)!;
      expect(path.key, 'F.yB.D.H.F');
      final name = RelationNamer.name(path);
      expect(name.isNamed, isFalse);
      expect(name.en, "Jija's father");
      expect(name.hi, 'जीजा का पिता');
    });

    test('everyone in both families gets a relation to me in one pass', () {
      final all = finder.findAllFrom('me');
      expect(all.keys, containsAll(['sunilGupta', 'rohitGupta', 'mohan', 'amit', 'om']));
      expect(all.length, graph.size - 1);
    });

    test('a single new edge joins two separate families', () {
      final b = GraphBuilder()
        ..person('me', Gender.male)
        ..person('dad', Gender.male)
        ..person('stranger', Gender.male)
        ..person('strangerSon', Gender.male)
        ..child('dad', 'me')
        ..child('stranger', 'strangerSon');
      expect(PathFinder(b.build()).find('me', 'stranger'), isNull);

      b
        ..person('sis', Gender.female)
        ..child('dad', 'sis')
        ..marry('sis', 'strangerSon');
      final name = RelationNamer.name(PathFinder(b.build()).find('me', 'stranger')!);
      expect(name.en, "Behnoi's father");
      expect(name.hi, 'बहनोई का पिता');
    });

    test('family clusters exclude social-only contacts', () {
      final clusters = graph.familyClusters();
      expect(clusters.first, containsAll(['me', 'sunilGupta', 'mohan', 'vinod']));
      expect(clusters.first, isNot(contains('rajiv')));
    });
  });

  group('described (unnamed) relations', () {
    test('longest named prefix + Hindi possessive agreement', () {
      final b = GraphBuilder()
        ..person('me', Gender.male)
        ..person('mom', Gender.female)
        ..person('nana', Gender.male)
        ..person('mama', Gender.male)
        ..person('cousin', Gender.male)
        ..person('cousinWife', Gender.female)
        ..child('nana', 'mom')
        ..child('nana', 'mama')
        ..child('mom', 'me')
        ..child('mama', 'cousin')
        ..marry('cousin', 'cousinWife');
      final name = RelationNamer.name(PathFinder(b.build()).find('me', 'cousinWife')!);
      expect(name.en, "Mamera bhai's wife");
      expect(name.hi, 'ममेरे भाई की पत्नी');
    });

    test('social ties are described too', () {
      expect(rel('me', 'rajiv').en, 'Friend');
      expect(rel('me', 'om').en, "Friend's father");
      expect(rel('me', 'om').hi, 'मित्र का पिता');
      expect(rel('me', 'om').side, RelationSide.social);
    });
  });

  group('half and step relations', () {
    final b = GraphBuilder()
      ..person('dad', Gender.male)
      ..person('mom', Gender.female)
      ..person('stepMom', Gender.female)
      ..person('me', Gender.male)
      ..person('halfBro', Gender.male)
      ..childOf('me', 'dad', 'mom')
      ..childOf('halfBro', 'dad', 'stepMom')
      ..marry('dad', 'mom', active: false)
      ..marry('dad', 'stepMom');
    final g = b.build();
    final f = PathFinder(g);

    test('half-sibling', () {
      final name = RelationNamer.name(f.find('me', 'halfBro')!);
      expect((name.en, name.hi), ('Half-brother', 'सौतेला भाई'));
    });

    test("father's wife who is not my mother is my stepmother", () {
      expect(RelationNamer.name(f.find('me', 'stepMom')!).hi, 'सौतेली माँ');
    });

    test('explicit step-parent edge', () {
      final g2 =
          (GraphBuilder()
                ..person('kid', Gender.female)
                ..person('stepDad', Gender.male)
                ..child('stepDad', 'kid', kind: ParentKind.step))
              .build();
      expect(RelationNamer.name(PathFinder(g2).find('kid', 'stepDad')!).en, 'Stepfather');
    });
  });

  group('path facts', () {
    test('generation and common ancestor', () {
      final cousin = finder.find('me', 'neha', includeSocial: false)!;
      expect(cousin.generation, 0);
      expect(cousin.isBlood, isTrue);
      expect(cousin.commonAncestorId, anyOf('ramPrasad', 'savitri'));
      expect(finder.find('me', 'ramPrasad')!.generation, 2);
      expect(finder.find('me', 'aarav')!.generation, -1);
    });

    test('self and unconnected people', () {
      expect(finder.find('me', 'me')!.isEmpty, isTrue);
      expect(RelationNamer.name(finder.find('me', 'me')!).en, 'You');
      expect(finder.find('me', 'nobody'), isNull);
    });

    test('alternative paths are found', () {
      final b = GraphBuilder()
        ..person('me', Gender.male)
        ..person('dad', Gender.male)
        ..person('x', Gender.male)
        ..child('dad', 'me')
        ..social('dad', 'x', 'friend')
        ..social('me', 'x', 'colleague');
      final paths = PathFinder(b.build()).findAll('me', 'x');
      expect(paths.map((p) => p.key), containsAll(['~colleague', 'F.~friend']));
    });

    test('blood paths win ties over marriage paths', () {
      // Brother is reachable via parents (blood) — never via "wife's husband".
      expect(finder.find('priya', 'rohit')!.key, 'yB');
    });
  });
}
