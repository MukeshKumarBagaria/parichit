import 'package:flutter/widgets.dart';
import 'package:kinship/kinship.dart';

import '../../../core/l10n/l10n.dart';

extension RelationTextX on BuildContext {
  bool get isHindi => Localizations.localeOf(this).languageCode == 'hi';

  /// A dictionary term in the current language (Hindi, or the familiar
  /// romanised term such as "Chacha" in English).
  String termLabel(KinTerm t) => isHindi ? t.hi : (t.roman ?? t.en);

  String relationLabel(RelationName n) => n.label(hindi: isHindi);

  /// Secondary line: the other language/description, e.g. "Father's younger brother".
  String relationDetail(RelationName n) => isHindi ? (n.roman ?? n.en) : (n.roman != null ? n.en : n.hi);

  String violationMessage(GraphViolation v) {
    final l = l10n;
    return switch (v.code) {
      GraphViolation.selfRelation => l.violationSelf,
      GraphViolation.cycle => l.violationCycle,
      GraphViolation.duplicateEdge => l.violationDuplicate,
      GraphViolation.tooManyBioParents => l.violationTooManyParents,
      GraphViolation.duplicateBioParentGender => l.violationDuplicateParentGender,
      GraphViolation.parentTooYoung => l.violationParentTooYoung,
      GraphViolation.closeBloodMarriage => l.violationCloseBlood,
      GraphViolation.partnerIsAncestor => l.violationPartnerAncestor,
      _ => v.code,
    };
  }

  String connectionTypeLabel(String type) {
    final l = l10n;
    return switch (type) {
      'friend' => l.connFriend,
      'colleague' => l.connColleague,
      'business' => l.connBusiness,
      'neighbour' => l.connNeighbour,
      'classmate' => l.connClassmate,
      'teacher' => l.connTeacher,
      'mentor' => l.connMentor,
      'introduced' => l.connIntroduced,
      'political' => l.connPolitical,
      'community' => l.connCommunity,
      _ => l.connOther,
    };
  }

  String relationGroupLabel(RelationGroup g) {
    final l = l10n;
    return switch (g) {
      RelationGroup.direct => l.relationGroupDirect,
      RelationGroup.paternal => l.relationGroupPaternal,
      RelationGroup.maternal => l.relationGroupMaternal,
      RelationGroup.children => l.relationGroupChildren,
      RelationGroup.siblings => l.relationGroupSiblings,
      RelationGroup.inLaws => l.relationGroupInLaws,
    };
  }
}

const connectionTypes = [
  'friend',
  'colleague',
  'business',
  'neighbour',
  'classmate',
  'teacher',
  'mentor',
  'introduced',
  'political',
  'community',
  'other',
];
