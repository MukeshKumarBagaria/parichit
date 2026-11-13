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
  String get fieldNotes => 'Notes';

  @override
  String get fieldNotesHint => 'Where you met, what you discussed…';

  @override
  String get validationNameRequired => 'Please enter a name';

  @override
  String get validationPhoneInvalid => 'Please enter a valid phone number';

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
  String get personFamilyComingSoon => 'Adding relatives arrives in the relationship milestone.';

  @override
  String get actionCall => 'Call';

  @override
  String get actionWhatsApp => 'WhatsApp';

  @override
  String get comingSoonTitle => 'Coming soon';

  @override
  String get familyComingSoon => 'The family tree and relationship finder are being built next.';

  @override
  String get meetingsComingSoon => 'Meeting history and reminders will appear here.';

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
