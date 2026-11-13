import 'package:kinship/kinship.dart';

/// Builder for test graphs: `b.person('me', Gender.male, born: 1985)`.
class GraphBuilder {
  final _people = <String, KinPerson>{};
  final _parents = <ParentEdge>[];
  final _partners = <PartnerEdge>[];
  final _social = <SocialEdge>[];

  void person(String id, Gender g, {int? born, int? order, bool placeholder = false}) =>
      _people[id] = KinPerson(id: id, gender: g, birthYear: born, birthOrder: order, isPlaceholder: placeholder);

  void child(String parent, String child, {ParentKind kind = ParentKind.biological}) =>
      _parents.add(ParentEdge(parentId: parent, childId: child, kind: kind));

  /// Child of both parents.
  void childOf(String child, String father, String mother) {
    this.child(father, child);
    this.child(mother, child);
  }

  void marry(String a, String b, {bool active = true}) => _partners.add(PartnerEdge(aId: a, bId: b, active: active));

  void social(String a, String b, String type) => _social.add(SocialEdge(aId: a, bId: b, type: type));

  FamilyGraph build() =>
      FamilyGraph(people: _people.values, parentEdges: _parents, partnerships: _partners, social: _social);
}

/// A realistic multi-family fixture.
///
///                Ram Prasad ═ Savitri                    Gopal ═ Lakshmi
///          ┌──────────┼──────────────┐               ┌───────┴────────┐
///   Mahesh(1958) Kamla(1960) Dinesh(1962)       Sunita(1962)  Ramesh(1965)  Geeta
///     ═ Sunita     ═ Hari      ═ Usha              (= Mahesh)  ═ Rekha       ═ Vinod
///       │            │           │                                │
///   ┌───┼────┐     Karan        Neha ═ Rohit Gupta              Arjun ═ Riya
/// Priya Me  Rohit                       │
///  ═Sanjay ═Anjali                Sunil Gupta (father)
///          │
///        Aarav ═ Diya (father Mohan)
///
/// Anjali's family: Suresh ═ Kavita → Anjali, Vikas (═ Neeta), Pooja (═ Amit)
/// Social: me —friend— Rajiv; Rajiv's father Om.
FamilyGraph sharmaFamily() {
  final b = GraphBuilder()
    // Grandparents
    ..person('ramPrasad', Gender.male, born: 1930)
    ..person('savitri', Gender.female, born: 1934)
    ..person('gopal', Gender.male, born: 1932)
    ..person('lakshmi', Gender.female, born: 1936)
    // Parents' generation
    ..person('mahesh', Gender.male, born: 1958)
    ..person('kamla', Gender.female, born: 1960)
    ..person('dinesh', Gender.male, born: 1962)
    ..person('sunita', Gender.female, born: 1962)
    ..person('ramesh', Gender.male, born: 1965)
    ..person('geeta', Gender.female, born: 1968)
    ..person('hari', Gender.male)
    ..person('usha', Gender.female)
    ..person('rekha', Gender.female)
    ..person('vinod', Gender.male)
    // My generation
    ..person('priya', Gender.female, born: 1982)
    ..person('me', Gender.male, born: 1985)
    ..person('rohit', Gender.male, born: 1990)
    ..person('sanjay', Gender.male)
    ..person('karan', Gender.male)
    ..person('neha', Gender.female)
    ..person('rohitGupta', Gender.male)
    ..person('sunilGupta', Gender.male)
    ..person('arjun', Gender.male)
    ..person('riya', Gender.female)
    // Wife's family
    ..person('anjali', Gender.female, born: 1987)
    ..person('suresh', Gender.male)
    ..person('kavita', Gender.female)
    ..person('vikas', Gender.male)
    ..person('neeta', Gender.female)
    ..person('pooja', Gender.female)
    ..person('amit', Gender.male)
    // Next generation
    ..person('aarav', Gender.male, born: 2012)
    ..person('diya', Gender.female)
    ..person('mohan', Gender.male)
    // Social
    ..person('rajiv', Gender.male)
    ..person('om', Gender.male);

  b
    ..marry('ramPrasad', 'savitri')
    ..childOf('mahesh', 'ramPrasad', 'savitri')
    ..childOf('kamla', 'ramPrasad', 'savitri')
    ..childOf('dinesh', 'ramPrasad', 'savitri')
    ..marry('gopal', 'lakshmi')
    ..childOf('sunita', 'gopal', 'lakshmi')
    ..childOf('ramesh', 'gopal', 'lakshmi')
    ..childOf('geeta', 'gopal', 'lakshmi')
    ..marry('mahesh', 'sunita')
    ..marry('kamla', 'hari')
    ..marry('dinesh', 'usha')
    ..marry('ramesh', 'rekha')
    ..marry('geeta', 'vinod')
    ..childOf('priya', 'mahesh', 'sunita')
    ..childOf('me', 'mahesh', 'sunita')
    ..childOf('rohit', 'mahesh', 'sunita')
    ..marry('priya', 'sanjay')
    ..childOf('karan', 'hari', 'kamla')
    ..childOf('neha', 'dinesh', 'usha')
    ..marry('neha', 'rohitGupta')
    ..child('sunilGupta', 'rohitGupta')
    ..childOf('arjun', 'ramesh', 'rekha')
    ..marry('arjun', 'riya')
    ..marry('me', 'anjali')
    ..marry('suresh', 'kavita')
    ..childOf('anjali', 'suresh', 'kavita')
    ..childOf('vikas', 'suresh', 'kavita')
    ..childOf('pooja', 'suresh', 'kavita')
    ..marry('vikas', 'neeta')
    ..marry('pooja', 'amit')
    ..childOf('aarav', 'me', 'anjali')
    ..marry('aarav', 'diya')
    ..child('mohan', 'diya')
    ..social('me', 'rajiv', 'friend')
    ..child('om', 'rajiv');
  return b.build();
}
