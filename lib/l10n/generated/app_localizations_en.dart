// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get appTitle => 'Parichit';

  @override
  String get appTagline => 'Your people, your families, your connections.';

  @override
  String get navHome => 'Home';

  @override
  String get navPeople => 'People';

  @override
  String get navFamily => 'Family';

  @override
  String get navMeetings => 'Meetings';

  @override
  String get navMore => 'More';

  @override
  String get actionSave => 'Save';

  @override
  String get actionSaveAndAddAnother => 'Save & add another';

  @override
  String get actionCancel => 'Cancel';

  @override
  String get actionDelete => 'Delete';

  @override
  String get actionUndo => 'Undo';

  @override
  String get actionContinue => 'Continue';

  @override
  String get actionGetStarted => 'Get started';

  @override
  String get actionBack => 'Back';

  @override
  String get actionOk => 'OK';

  @override
  String get actionYes => 'Yes';

  @override
  String get actionNotNow => 'Not now';

  @override
  String get actionAddAnyway => 'Add anyway';

  @override
  String get actionDismiss => 'Dismiss';

  @override
  String get actionDone => 'Done';

  @override
  String get actionRestore => 'Restore';

  @override
  String get actionSeeAll => 'See all';

  @override
  String get actionMeet => 'Log meeting';

  @override
  String get actionCall => 'Call';

  @override
  String get actionWhatsApp => 'WhatsApp';

  @override
  String get onboardingWelcomeTitle => 'Welcome to Parichit';

  @override
  String get onboardingWelcomeBody =>
      'Keep your family tree and everyone you know in one private place — it works even without internet.';

  @override
  String get onboardingChooseLanguage => 'Choose your language';

  @override
  String get onboardingAboutYouTitle => 'First, tell us about you';

  @override
  String get onboardingAboutYouBody =>
      'Everyone you add will be connected to you, so Parichit can tell you exactly how you are related.';

  @override
  String get fieldFullName => 'Full name';

  @override
  String get fieldFullNameHint => 'e.g. Ramesh Sharma';

  @override
  String get fieldFullNameAlt => 'Name in Hindi (optional)';

  @override
  String get fieldFullNameAltHint => 'e.g. रमेश शर्मा';

  @override
  String get fieldNickname => 'Nickname';

  @override
  String get fieldNicknameHint => 'e.g. Pappu, Bablu';

  @override
  String get fieldSurname => 'Surname';

  @override
  String get fieldGender => 'Gender';

  @override
  String get genderMale => 'Male';

  @override
  String get genderFemale => 'Female';

  @override
  String get genderOther => 'Other';

  @override
  String get genderUnknown => 'Not specified';

  @override
  String get fieldPhone => 'Mobile number';

  @override
  String get fieldPhoneHint => '10-digit mobile number';

  @override
  String get fieldEmail => 'Email';

  @override
  String get fieldWhatsapp => 'On WhatsApp';

  @override
  String get fieldNotes => 'Notes';

  @override
  String get fieldNotesHint => 'Where you met, what you discussed…';

  @override
  String get fieldFavorite => 'Favourite';

  @override
  String get fieldBirthDate => 'Date of birth';

  @override
  String get fieldDeathDate => 'Date of passing';

  @override
  String get fieldBirthOrder => 'Birth order among siblings';

  @override
  String get fieldBirthOrderHelp => '1 = eldest. Used for Tau/Chacha, Jeth/Devar when birth dates are unknown.';

  @override
  String get fieldNotifyBirthday => 'Birthday reminder';

  @override
  String get fieldNativePlace => 'Native village / town';

  @override
  String get fieldGotra => 'Gotra';

  @override
  String get fieldOccupation => 'Occupation';

  @override
  String get fieldOrganization => 'Organisation / business';

  @override
  String get fieldDesignation => 'Designation';

  @override
  String get fieldEducation => 'Education';

  @override
  String get statusLiving => 'Living';

  @override
  String get statusDeceased => 'Passed away';

  @override
  String get dateYear => 'Year';

  @override
  String get dateMonth => 'Month';

  @override
  String get dateDay => 'Day';

  @override
  String get dateUnknown => 'Unknown';

  @override
  String get dateApproximate => 'Approximate (about)';

  @override
  String get validationNameRequired => 'Please enter a name';

  @override
  String get validationPhoneInvalid => 'Please enter a valid phone number';

  @override
  String ageYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count years',
      one: '1 year',
    );
    return '$_temp0';
  }

  @override
  String get dayToday => 'Today';

  @override
  String get dayTomorrow => 'Tomorrow';

  @override
  String get dayYesterday => 'Yesterday';

  @override
  String dayInDays(int count) {
    return 'In $count days';
  }

  @override
  String homeGreeting(String name) {
    return 'Namaste, $name';
  }

  @override
  String get homeSearchHint => 'Search people, villages, phone…';

  @override
  String get homeQuickAdd => 'Quick add';

  @override
  String get homeLogMeeting => 'Log meeting';

  @override
  String get homeFindRelation => 'Find relation';

  @override
  String get homeFamilyTree => 'Family tree';

  @override
  String homePeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people saved',
      one: '1 person saved',
      zero: 'No people yet',
    );
    return '$_temp0';
  }

  @override
  String get homeRecentlyAdded => 'Recently added';

  @override
  String get homeToday => 'Coming up this week';

  @override
  String get homeReconnect => 'Haven\'t met in a while';

  @override
  String get homeEmptyTitle => 'Start with someone you know';

  @override
  String get homeEmptyBody => 'Add a family member or someone you met today. It takes a few seconds.';

  @override
  String get peopleSearchHint => 'Search by name or phone';

  @override
  String get peopleEmptyTitle => 'No people yet';

  @override
  String get peopleEmptyBody => 'Tap + to add your first person.';

  @override
  String peopleNoResults(String query) {
    return 'No one matches \"$query\"';
  }

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count people',
      one: '1 person',
    );
    return '$_temp0';
  }

  @override
  String get filterFavorites => 'Favourites';

  @override
  String get filterFamily => 'Family';

  @override
  String get filterNotMet => 'Not met in 90 days';

  @override
  String get quickAddTitle => 'Quick add';

  @override
  String personSaved(String name) {
    return '$name saved';
  }

  @override
  String personDeleted(String name) {
    return '$name moved to trash';
  }

  @override
  String get personNotFound => 'This person no longer exists.';

  @override
  String get duplicateWarningTitle => 'Already saved?';

  @override
  String get duplicateCreateAnyway => 'Create anyway';

  @override
  String get editPersonTitle => 'Edit details';

  @override
  String get editSectionBasic => 'Basic';

  @override
  String get editSectionContacts => 'Phone & email';

  @override
  String get editSectionLife => 'Life events';

  @override
  String get editSectionOrigin => 'Origin';

  @override
  String get editSectionWork => 'Work & education';

  @override
  String get relationYou => 'You';

  @override
  String get personLatePrefix => 'Late';

  @override
  String get personSectionContacts => 'Contacts';

  @override
  String get personSectionNotes => 'Notes';

  @override
  String get personSectionFamily => 'Family';

  @override
  String get personSectionAbout => 'Details';

  @override
  String personSectionMeetings(int count) {
    return 'Meetings ($count)';
  }

  @override
  String get personNoMeetings => 'No meetings recorded yet.';

  @override
  String get placeholderBadge => 'Unknown person — tap to fill in';

  @override
  String get openProfile => 'Open profile';

  @override
  String get familyParents => 'Parents';

  @override
  String get familySpouse => 'Spouse';

  @override
  String get familyFormerSpouse => 'Former spouse';

  @override
  String get familySiblings => 'Siblings';

  @override
  String get familyChildren => 'Children';

  @override
  String familyExtended(int count) {
    return 'Extended family ($count)';
  }

  @override
  String get familyEmpty => 'No relatives added yet.';

  @override
  String get addRelative => 'Add relative';

  @override
  String addRelativeTitle(String name) {
    return 'Add to $name\'s family';
  }

  @override
  String get moreRelations => 'More relations';

  @override
  String get searchRelationsHint => 'Search: Chacha, Mama, Sasur…';

  @override
  String get relationGroupDirect => 'Immediate family';

  @override
  String get relationGroupPaternal => 'Father\'s side';

  @override
  String get relationGroupMaternal => 'Mother\'s side';

  @override
  String get relationGroupChildren => 'Children\'s families';

  @override
  String get relationGroupSiblings => 'Siblings\' families';

  @override
  String get relationGroupInLaws => 'Spouse\'s family (in-laws)';

  @override
  String pickPersonTitle(String name, String relation, String gender) {
    return 'Who is $name\'s $relation?';
  }

  @override
  String get pickPersonSearchHint => 'Search people you\'ve saved';

  @override
  String get createNewPerson => 'Create new person';

  @override
  String choosePersonTitle(String relation) {
    return 'Which $relation?';
  }

  @override
  String get someoneNotListed => 'Someone not in this list';

  @override
  String relativeAdded(String name, String relation, String anchor) {
    return '$name added as $anchor\'s $relation';
  }

  @override
  String get suggestTitle => 'One more thing';

  @override
  String suggestAlsoParent(String parent, String child) {
    return 'Is $parent also $child\'s parent?';
  }

  @override
  String suggestParentOfSiblings(String parent, String names) {
    return 'Is $parent also the parent of $names?';
  }

  @override
  String get warningTitle => 'Please check';

  @override
  String get cannotAddTitle => 'This relation can\'t be added';

  @override
  String get violationSelf => 'A person can\'t be their own relative.';

  @override
  String get violationCycle => 'This would make someone their own ancestor.';

  @override
  String get violationDuplicate => 'These two are already linked this way.';

  @override
  String get violationTooManyParents => 'This person already has two parents.';

  @override
  String get violationDuplicateParentGender => 'This person already has a father or mother of this gender.';

  @override
  String get violationParentTooYoung => 'The parent seems too young for this child.';

  @override
  String get violationCloseBlood => 'These two are close blood relatives.';

  @override
  String get violationPartnerAncestor => 'Someone can\'t marry their own ancestor or descendant.';

  @override
  String get removeLink => 'Remove this link';

  @override
  String get linkRemoved => 'Link removed';

  @override
  String get markDivorced => 'Mark as separated / divorced';

  @override
  String get networkTitle => 'Network';

  @override
  String get networkEmpty => 'No friends or contacts linked yet.';

  @override
  String get addConnection => 'Add connection';

  @override
  String get connectionTypeTitle => 'How are they connected?';

  @override
  String get connFriend => 'Friend';

  @override
  String get connColleague => 'Colleague';

  @override
  String get connBusiness => 'Business';

  @override
  String get connNeighbour => 'Neighbour';

  @override
  String get connClassmate => 'Classmate';

  @override
  String get connTeacher => 'Teacher';

  @override
  String get connMentor => 'Mentor';

  @override
  String get connIntroduced => 'Introduced by / to';

  @override
  String get connPolitical => 'Political';

  @override
  String get connCommunity => 'Community';

  @override
  String get connOther => 'Other';

  @override
  String get familyTreeTitle => 'Family tree';

  @override
  String get familyHubTreeBody => 'Explore generations; tap anyone to centre the tree on them.';

  @override
  String get relationFinderTitle => 'Find relation';

  @override
  String get familyHubFinderBody => 'See exactly how any two people are connected.';

  @override
  String get familyClustersTitle => 'Families';

  @override
  String get familyClusterYours => 'Your family';

  @override
  String familyClusterOf(String name) {
    return '$name\'s family';
  }

  @override
  String get treeChoosePerson => 'Choose a person';

  @override
  String get treeCenterOnMe => 'Centre on me';

  @override
  String get treeModeTree => 'Tree view';

  @override
  String get treeModeList => 'List view';

  @override
  String get treeGenerationsUp => 'Generations up';

  @override
  String get treeGenerationsDown => 'Generations down';

  @override
  String get finderPersonA => 'First person';

  @override
  String get finderPersonB => 'Second person';

  @override
  String get finderSelect => 'Select a person';

  @override
  String get finderSwap => 'Swap';

  @override
  String get finderIncludeFriends => 'Include friends & contacts';

  @override
  String get finderNotConnected => 'These two aren\'t connected yet.';

  @override
  String get finderAlternatives => 'Other connections';

  @override
  String finderCommonAncestor(String name) {
    return 'Common ancestor: $name';
  }

  @override
  String get meetingsTimeline => 'Timeline';

  @override
  String get meetingsUpcoming => 'Upcoming';

  @override
  String get meetingsEmptyTitle => 'No meetings yet';

  @override
  String get meetingsEmptyBody => 'Record who you met, where, and what you talked about.';

  @override
  String get meetingEdit => 'Meeting';

  @override
  String get meetingWho => 'Who was there?';

  @override
  String get meetingAddPerson => 'Add person';

  @override
  String get meetingNeedsPerson => 'Add at least one person.';

  @override
  String get meetingWhere => 'Place';

  @override
  String get meetingLocationDetail => 'Location details (optional)';

  @override
  String get meetingTitle => 'Title (optional)';

  @override
  String get meetingTitleHint => 'e.g. Amit\'s wedding';

  @override
  String get meetingNotesHint => 'What did you talk about?';

  @override
  String get meetingFollowUp => 'Remind me to follow up';

  @override
  String get meetingFollowUpNote => 'Follow-up note';

  @override
  String get meetingTypeInPerson => 'Met in person';

  @override
  String get meetingTypeVisit => 'Visit';

  @override
  String get meetingTypePhone => 'Phone call';

  @override
  String get meetingTypeVideo => 'Video call';

  @override
  String get meetingTypeMessage => 'Message';

  @override
  String get meetingTypeEvent => 'Event / function';

  @override
  String get meetingTypeOther => 'Other';

  @override
  String placeCreate(String name) {
    return 'Add \"$name\"';
  }

  @override
  String get upcomingNext60Days => 'Next 60 days';

  @override
  String get upcomingNothing => 'Nothing coming up.';

  @override
  String upcomingBirthday(String name, int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$name turns $years',
      zero: '$name\'s birthday',
    );
    return '$_temp0';
  }

  @override
  String upcomingAnniversary(String names, int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$names: $years years married',
      zero: '$names: anniversary',
    );
    return '$_temp0';
  }

  @override
  String upcomingBarsi(String names) {
    return '$names: barsi (death anniversary)';
  }

  @override
  String get reminderAdd => 'Add reminder';

  @override
  String get reminderWhat => 'What to remember';

  @override
  String get reminderRepeat => 'Repeat';

  @override
  String get repeatNone => 'Don\'t repeat';

  @override
  String get repeatWeekly => 'Every week';

  @override
  String get repeatMonthly => 'Every month';

  @override
  String get repeatYearly => 'Every year';

  @override
  String get tagsTitle => 'Tags';

  @override
  String get tagsEdit => 'Edit tags';

  @override
  String get tagsNone => 'No tags.';

  @override
  String get tagsNew => 'New tag';

  @override
  String get moreData => 'Your data';

  @override
  String get settingsTitle => 'Settings';

  @override
  String get settingsLanguage => 'Language';

  @override
  String get settingsLanguageSystem => 'Same as phone';

  @override
  String get settingsTheme => 'Theme';

  @override
  String get themeSystem => 'System';

  @override
  String get themeLight => 'Light';

  @override
  String get themeDark => 'Dark';

  @override
  String get settingsSecurity => 'Security';

  @override
  String get settingsAppLock => 'App lock';

  @override
  String get settingsAppLockBody => 'Fingerprint, face or phone PIN when opening Parichit.';

  @override
  String get lockTitle => 'Parichit is locked';

  @override
  String get lockUnlock => 'Unlock';

  @override
  String get lockReason => 'Unlock Parichit';

  @override
  String get lockUnsupported => 'This phone has no fingerprint, face or screen lock set up.';

  @override
  String get backupTitle => 'Backup & export';

  @override
  String get backupEncrypted => 'Encrypted backup';

  @override
  String get backupCreate => 'Create backup file';

  @override
  String get backupCreateBody => 'Everything, encrypted with your passphrase. Save it to Drive or send it to yourself.';

  @override
  String get backupRestore => 'Restore from backup';

  @override
  String get backupRestoreBody => 'Newer versions of each record are kept.';

  @override
  String backupRestored(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count records restored.',
      one: '1 record restored.',
      zero: 'Nothing new to restore.',
    );
    return '$_temp0';
  }

  @override
  String get backupPassphrase => 'Passphrase';

  @override
  String get backupPassphraseRepeat => 'Repeat passphrase';

  @override
  String get backupPassphraseHelp =>
      'Choose a passphrase (at least 6 characters). Without it the backup cannot be opened — write it down.';

  @override
  String get backupPassphraseEnter => 'Enter the passphrase used for this backup.';

  @override
  String get backupPassphraseTooShort => 'The passphrase needs at least 6 characters.';

  @override
  String get backupPassphraseMismatch => 'The passphrases don\'t match.';

  @override
  String get backupWrongPassphrase => 'Wrong passphrase, or not a Parichit backup.';

  @override
  String get exportTitle => 'Export';

  @override
  String get exportCsv => 'People (CSV / Excel)';

  @override
  String get exportCsvBody => 'A spreadsheet of everyone with phones, villages and relations.';

  @override
  String get exportGedcom => 'Family tree (GEDCOM)';

  @override
  String get exportGedcomBody => 'Open your tree in Ancestry, MyHeritage, FamilySearch or Gramps.';

  @override
  String get duplicatesTitle => 'Duplicates';

  @override
  String get duplicatesNone => 'No duplicates found.';

  @override
  String get duplicatesNotSame => 'Not the same';

  @override
  String get mergeAction => 'Merge';

  @override
  String get mergeKeepWhich => 'Keep which details?';

  @override
  String mergeDone(String merged, String survivor) {
    return '$merged merged into $survivor';
  }

  @override
  String get trashTitle => 'Trash';

  @override
  String get trashEmpty => 'Trash is empty.';

  @override
  String get settingsSync => 'Cloud backup';

  @override
  String get syncLocalOnly => 'Saved on this phone only. Cloud backup is not configured in this build.';

  @override
  String get syncSignedOutBody =>
      'Sign in to back up your family data and use it on other phones. The app keeps working offline.';

  @override
  String get syncSignInButton => 'Sign in to back up';

  @override
  String syncSignedInAs(String email) {
    return 'Signed in as $email';
  }

  @override
  String get syncSignOut => 'Sign out';

  @override
  String get syncNow => 'Sync now';

  @override
  String get syncStatusSynced => 'Synced';

  @override
  String get syncStatusSyncing => 'Syncing…';

  @override
  String syncStatusPending(int count) {
    return '$count waiting to sync';
  }

  @override
  String get syncStatusOffline => 'Offline';

  @override
  String get syncStatusError => 'Sync problem';

  @override
  String get syncStatusSignedOut => 'Not backed up';

  @override
  String syncLastSynced(String time) {
    return 'Last synced $time';
  }

  @override
  String get syncNeverSynced => 'Not synced yet';

  @override
  String get syncIssuesTitle => 'Sync issues';

  @override
  String syncIssuesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count changes were rejected',
      one: '1 change was rejected',
      zero: 'No sync issues',
    );
    return '$_temp0';
  }

  @override
  String get syncIssuesEmpty => 'Nothing to fix. All changes were accepted.';

  @override
  String get syncIssuesHelp =>
      'The cloud refused these changes. They stay on this phone and are not lost; discard them once you have checked.';

  @override
  String get syncDiscard => 'Discard';

  @override
  String get signInTitle => 'Sign in';

  @override
  String get signInBody => 'Enter your email. We will send you a sign-in code.';

  @override
  String get signInEmailLabel => 'Email';

  @override
  String get signInEmailInvalid => 'Enter a valid email address';

  @override
  String get signInSendCode => 'Send code';

  @override
  String signInCodeSent(String email) {
    return 'We sent a code to $email.';
  }

  @override
  String get signInCodeLabel => 'Code from the email';

  @override
  String get signInCodeInvalid => 'Enter the code from the email';

  @override
  String get signInVerify => 'Verify and sign in';

  @override
  String get signInChangeEmail => 'Use a different email';

  @override
  String signInFailed(String error) {
    return 'Could not sign in: $error';
  }

  @override
  String get onboardingRestore => 'Already use Parichit? Sign in to restore';

  @override
  String get settingsAbout => 'About Parichit';
}
