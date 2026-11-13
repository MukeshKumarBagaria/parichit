import '../../../core/database/app_database.dart';

/// CSV of people for spreadsheets (Excel opens UTF-8 CSV with a BOM).
abstract final class CsvExporter {
  static String people({
    required List<PersonRow> people,
    required Map<String, List<String>> phones,
    required Map<String, String> places,
    required Map<String, String> relationToMe,
    required Map<String, List<String>> tags,
  }) {
    const header = [
      'Name',
      'Name (other script)',
      'Nickname',
      'Gender',
      'Relation to me',
      'Phones',
      'Birth year',
      'Birth month',
      'Birth day',
      'Living',
      'Native place',
      'Gotra',
      'Occupation',
      'Organisation',
      'Tags',
      'Notes',
    ];
    final buf = StringBuffer('﻿')..writeln(header.map(_cell).join(','));
    for (final p in people) {
      buf.writeln(
        [
          p.fullName,
          p.fullNameAlt,
          p.nickname,
          p.gender,
          relationToMe[p.id],
          phones[p.id]?.join(' / '),
          p.birthYear,
          p.birthMonth,
          p.birthDay,
          switch (p.isLiving) {
            true => 'yes',
            false => 'no',
            null => '',
          },
          places[p.nativePlaceId],
          p.gotra,
          p.occupation,
          p.organization,
          tags[p.id]?.join(' / '),
          p.notes,
        ].map(_cell).join(','),
      );
    }
    return buf.toString();
  }

  static String _cell(Object? v) {
    final s = v?.toString() ?? '';
    final escaped = s.replaceAll('"', '""');
    return RegExp(r'[",\n\r]').hasMatch(s) || s.startsWith(RegExp(r'[=+\-@]')) ? '"$escaped"' : escaped;
  }
}

/// GEDCOM 5.5.1 export — the universal family-tree exchange format
/// (Ancestry, FamilySearch, MyHeritage, Gramps…).
abstract final class GedcomExporter {
  static String export({
    required List<PersonRow> people,
    required List<ParentChildRow> parentEdges,
    required List<PartnershipRow> partnerships,
  }) {
    final indi = {for (final (i, p) in people.indexed) p.id: '@I${i + 1}@'};
    final genderOf = {for (final p in people) p.id: p.gender};
    final lines = <String>[
      '0 HEAD',
      '1 SOUR PARICHIT',
      '2 NAME Parichit',
      '1 GEDC',
      '2 VERS 5.5.1',
      '2 FORM LINEAGE-LINKED',
      '1 CHAR UTF-8',
    ];

    // Families: one per partnership, plus one per distinct parent set of
    // children whose parents are not recorded as partners.
    final families = <String, ({List<String> parents, List<String> children, PartnershipRow? marriage})>{};
    String familyKey(Iterable<String> parents) => (parents.toList()..sort()).join('+');
    for (final m in partnerships) {
      if (!indi.containsKey(m.personAId) || !indi.containsKey(m.personBId)) continue;
      families[familyKey([m.personAId, m.personBId])] = (
        parents: [m.personAId, m.personBId],
        children: <String>[],
        marriage: m,
      );
    }
    final parentsOf = <String, List<String>>{};
    for (final e in parentEdges) {
      if (indi.containsKey(e.parentId) && indi.containsKey(e.childId)) (parentsOf[e.childId] ??= []).add(e.parentId);
    }
    for (final entry in parentsOf.entries) {
      final key = familyKey(entry.value);
      families
          .putIfAbsent(key, () => (parents: entry.value, children: <String>[], marriage: null))
          .children
          .add(entry.key);
    }
    final famId = {for (final (i, k) in families.keys.indexed) k: '@F${i + 1}@'};

    for (final p in people) {
      final words = p.fullName.trim().split(RegExp(r'\s+'));
      final surname = p.surname ?? (words.length > 1 ? words.last : '');
      final given = p.surname == null && words.length > 1 ? words.sublist(0, words.length - 1).join(' ') : p.fullName;
      lines
        ..add('0 ${indi[p.id]} INDI')
        ..add('1 NAME $given /$surname/');
      if (p.fullNameAlt != null) lines.add('1 NAME ${p.fullNameAlt}');
      if (p.nickname != null) lines.add('2 NICK ${p.nickname}');
      lines.add(
        '1 SEX ${switch (p.gender) {
          'male' => 'M',
          'female' => 'F',
          _ => 'U',
        }}',
      );
      final birth = _date(p.birthYear, p.birthMonth, p.birthDay, approx: p.birthDateApprox);
      if (birth != null) lines.addAll(['1 BIRT', '2 DATE $birth']);
      final death = _date(p.deathYear, p.deathMonth, p.deathDay);
      if (death != null || p.isLiving == false) {
        lines.addAll(['1 DEAT${death == null ? ' Y' : ''}', if (death != null) '2 DATE $death']);
      }
      if (p.occupation != null) lines.add('1 OCCU ${p.occupation}');
      for (final f in families.entries) {
        if (f.value.parents.contains(p.id)) lines.add('1 FAMS ${famId[f.key]}');
        if (f.value.children.contains(p.id)) lines.add('1 FAMC ${famId[f.key]}');
      }
      if (p.notes != null) lines.add('1 NOTE ${p.notes!.replaceAll('\n', ' ')}');
    }
    for (final f in families.entries) {
      lines.add('0 ${famId[f.key]} FAM');
      final parents = f.value.parents;
      for (final (i, id) in parents.indexed) {
        final role = switch (genderOf[id]) {
          'male' => 'HUSB',
          'female' => 'WIFE',
          _ => i == 0 ? 'HUSB' : 'WIFE',
        };
        lines.add('1 $role ${indi[id]}');
      }
      for (final c in f.value.children) {
        lines.add('1 CHIL ${indi[c]}');
      }
      final m = f.value.marriage;
      if (m != null) {
        lines.add('1 MARR');
        final d = _date(m.startYear, m.startMonth, m.startDay, approx: m.startDateApprox);
        if (d != null) lines.add('2 DATE $d');
        if (m.status == 'divorced') lines.add('1 DIV Y');
      }
    }
    lines.add('0 TRLR');
    return '${lines.join('\n')}\n';
  }

  static const _months = ['JAN', 'FEB', 'MAR', 'APR', 'MAY', 'JUN', 'JUL', 'AUG', 'SEP', 'OCT', 'NOV', 'DEC'];

  static String? _date(int? y, int? m, int? d, {bool approx = false}) {
    if (y == null) return null;
    final text = [?d, if (m != null) _months[m - 1], y].join(' ');
    return approx ? 'ABT $text' : text;
  }
}
