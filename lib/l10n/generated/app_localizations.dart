import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_hi.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'generated/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations)!;
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[Locale('en'), Locale('hi')];

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Parichit'**
  String get appTitle;

  /// No description provided for @appTagline.
  ///
  /// In en, this message translates to:
  /// **'Your people, your families, your connections.'**
  String get appTagline;

  /// No description provided for @navHome.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get navHome;

  /// No description provided for @navPeople.
  ///
  /// In en, this message translates to:
  /// **'People'**
  String get navPeople;

  /// No description provided for @navFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get navFamily;

  /// No description provided for @navMeetings.
  ///
  /// In en, this message translates to:
  /// **'Meetings'**
  String get navMeetings;

  /// No description provided for @navMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get navMore;

  /// No description provided for @actionSave.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get actionSave;

  /// No description provided for @actionSaveAndAddAnother.
  ///
  /// In en, this message translates to:
  /// **'Save & add another'**
  String get actionSaveAndAddAnother;

  /// No description provided for @actionCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get actionCancel;

  /// No description provided for @actionDelete.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get actionDelete;

  /// No description provided for @actionUndo.
  ///
  /// In en, this message translates to:
  /// **'Undo'**
  String get actionUndo;

  /// No description provided for @actionContinue.
  ///
  /// In en, this message translates to:
  /// **'Continue'**
  String get actionContinue;

  /// No description provided for @actionGetStarted.
  ///
  /// In en, this message translates to:
  /// **'Get started'**
  String get actionGetStarted;

  /// No description provided for @actionBack.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get actionBack;

  /// No description provided for @onboardingWelcomeTitle.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Parichit'**
  String get onboardingWelcomeTitle;

  /// No description provided for @onboardingWelcomeBody.
  ///
  /// In en, this message translates to:
  /// **'Keep your family tree and everyone you know in one private place — it works even without internet.'**
  String get onboardingWelcomeBody;

  /// No description provided for @onboardingChooseLanguage.
  ///
  /// In en, this message translates to:
  /// **'Choose your language'**
  String get onboardingChooseLanguage;

  /// No description provided for @onboardingAboutYouTitle.
  ///
  /// In en, this message translates to:
  /// **'First, tell us about you'**
  String get onboardingAboutYouTitle;

  /// No description provided for @onboardingAboutYouBody.
  ///
  /// In en, this message translates to:
  /// **'Everyone you add will be connected to you, so Parichit can tell you exactly how you are related.'**
  String get onboardingAboutYouBody;

  /// No description provided for @fieldFullName.
  ///
  /// In en, this message translates to:
  /// **'Full name'**
  String get fieldFullName;

  /// No description provided for @fieldFullNameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Ramesh Sharma'**
  String get fieldFullNameHint;

  /// No description provided for @fieldFullNameAlt.
  ///
  /// In en, this message translates to:
  /// **'Name in Hindi (optional)'**
  String get fieldFullNameAlt;

  /// No description provided for @fieldFullNameAltHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. रमेश शर्मा'**
  String get fieldFullNameAltHint;

  /// No description provided for @fieldGender.
  ///
  /// In en, this message translates to:
  /// **'Gender'**
  String get fieldGender;

  /// No description provided for @genderMale.
  ///
  /// In en, this message translates to:
  /// **'Male'**
  String get genderMale;

  /// No description provided for @genderFemale.
  ///
  /// In en, this message translates to:
  /// **'Female'**
  String get genderFemale;

  /// No description provided for @genderOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get genderOther;

  /// No description provided for @genderUnknown.
  ///
  /// In en, this message translates to:
  /// **'Not specified'**
  String get genderUnknown;

  /// No description provided for @fieldPhone.
  ///
  /// In en, this message translates to:
  /// **'Mobile number'**
  String get fieldPhone;

  /// No description provided for @fieldPhoneHint.
  ///
  /// In en, this message translates to:
  /// **'10-digit mobile number'**
  String get fieldPhoneHint;

  /// No description provided for @fieldNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get fieldNotes;

  /// No description provided for @fieldNotesHint.
  ///
  /// In en, this message translates to:
  /// **'Where you met, what you discussed…'**
  String get fieldNotesHint;

  /// No description provided for @validationNameRequired.
  ///
  /// In en, this message translates to:
  /// **'Please enter a name'**
  String get validationNameRequired;

  /// No description provided for @validationPhoneInvalid.
  ///
  /// In en, this message translates to:
  /// **'Please enter a valid phone number'**
  String get validationPhoneInvalid;

  /// No description provided for @homeGreeting.
  ///
  /// In en, this message translates to:
  /// **'Namaste, {name}'**
  String homeGreeting(String name);

  /// No description provided for @homeSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search people, villages, phone…'**
  String get homeSearchHint;

  /// No description provided for @homeQuickAdd.
  ///
  /// In en, this message translates to:
  /// **'Quick add'**
  String get homeQuickAdd;

  /// No description provided for @homeLogMeeting.
  ///
  /// In en, this message translates to:
  /// **'Log meeting'**
  String get homeLogMeeting;

  /// No description provided for @homeFindRelation.
  ///
  /// In en, this message translates to:
  /// **'Find relation'**
  String get homeFindRelation;

  /// No description provided for @homeFamilyTree.
  ///
  /// In en, this message translates to:
  /// **'Family tree'**
  String get homeFamilyTree;

  /// No description provided for @homePeopleCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No people yet} =1{1 person saved} other{{count} people saved}}'**
  String homePeopleCount(int count);

  /// No description provided for @homeRecentlyAdded.
  ///
  /// In en, this message translates to:
  /// **'Recently added'**
  String get homeRecentlyAdded;

  /// No description provided for @homeEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'Start with someone you know'**
  String get homeEmptyTitle;

  /// No description provided for @homeEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Add a family member or someone you met today. It takes a few seconds.'**
  String get homeEmptyBody;

  /// No description provided for @peopleSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search by name or phone'**
  String get peopleSearchHint;

  /// No description provided for @peopleEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No people yet'**
  String get peopleEmptyTitle;

  /// No description provided for @peopleEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Tap + to add your first person.'**
  String get peopleEmptyBody;

  /// No description provided for @peopleNoResults.
  ///
  /// In en, this message translates to:
  /// **'No one matches \"{query}\"'**
  String peopleNoResults(String query);

  /// No description provided for @quickAddTitle.
  ///
  /// In en, this message translates to:
  /// **'Quick add'**
  String get quickAddTitle;

  /// No description provided for @personSaved.
  ///
  /// In en, this message translates to:
  /// **'{name} saved'**
  String personSaved(String name);

  /// No description provided for @personDeleted.
  ///
  /// In en, this message translates to:
  /// **'{name} moved to trash'**
  String personDeleted(String name);

  /// No description provided for @personNotFound.
  ///
  /// In en, this message translates to:
  /// **'This person no longer exists.'**
  String get personNotFound;

  /// No description provided for @relationYou.
  ///
  /// In en, this message translates to:
  /// **'You'**
  String get relationYou;

  /// No description provided for @personLatePrefix.
  ///
  /// In en, this message translates to:
  /// **'Late'**
  String get personLatePrefix;

  /// No description provided for @personSectionContacts.
  ///
  /// In en, this message translates to:
  /// **'Contacts'**
  String get personSectionContacts;

  /// No description provided for @personSectionNotes.
  ///
  /// In en, this message translates to:
  /// **'Notes'**
  String get personSectionNotes;

  /// No description provided for @personSectionFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get personSectionFamily;

  /// No description provided for @personFamilyComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Adding relatives arrives in the relationship milestone.'**
  String get personFamilyComingSoon;

  /// No description provided for @actionCall.
  ///
  /// In en, this message translates to:
  /// **'Call'**
  String get actionCall;

  /// No description provided for @actionWhatsApp.
  ///
  /// In en, this message translates to:
  /// **'WhatsApp'**
  String get actionWhatsApp;

  /// No description provided for @comingSoonTitle.
  ///
  /// In en, this message translates to:
  /// **'Coming soon'**
  String get comingSoonTitle;

  /// No description provided for @familyComingSoon.
  ///
  /// In en, this message translates to:
  /// **'The family tree and relationship finder are being built next.'**
  String get familyComingSoon;

  /// No description provided for @meetingsComingSoon.
  ///
  /// In en, this message translates to:
  /// **'Meeting history and reminders will appear here.'**
  String get meetingsComingSoon;

  /// No description provided for @settingsTitle.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsTitle;

  /// No description provided for @settingsLanguage.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get settingsLanguage;

  /// No description provided for @settingsLanguageSystem.
  ///
  /// In en, this message translates to:
  /// **'Same as phone'**
  String get settingsLanguageSystem;

  /// No description provided for @settingsTheme.
  ///
  /// In en, this message translates to:
  /// **'Theme'**
  String get settingsTheme;

  /// No description provided for @themeSystem.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get themeSystem;

  /// No description provided for @themeLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get themeLight;

  /// No description provided for @themeDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get themeDark;

  /// No description provided for @settingsSync.
  ///
  /// In en, this message translates to:
  /// **'Cloud backup'**
  String get settingsSync;

  /// No description provided for @syncLocalOnly.
  ///
  /// In en, this message translates to:
  /// **'Saved on this phone only. Cloud backup is not configured in this build.'**
  String get syncLocalOnly;

  /// No description provided for @syncSignedOutBody.
  ///
  /// In en, this message translates to:
  /// **'Sign in to back up your family data and use it on other phones. The app keeps working offline.'**
  String get syncSignedOutBody;

  /// No description provided for @syncSignInButton.
  ///
  /// In en, this message translates to:
  /// **'Sign in to back up'**
  String get syncSignInButton;

  /// No description provided for @syncSignedInAs.
  ///
  /// In en, this message translates to:
  /// **'Signed in as {email}'**
  String syncSignedInAs(String email);

  /// No description provided for @syncSignOut.
  ///
  /// In en, this message translates to:
  /// **'Sign out'**
  String get syncSignOut;

  /// No description provided for @syncNow.
  ///
  /// In en, this message translates to:
  /// **'Sync now'**
  String get syncNow;

  /// No description provided for @syncStatusSynced.
  ///
  /// In en, this message translates to:
  /// **'Synced'**
  String get syncStatusSynced;

  /// No description provided for @syncStatusSyncing.
  ///
  /// In en, this message translates to:
  /// **'Syncing…'**
  String get syncStatusSyncing;

  /// No description provided for @syncStatusPending.
  ///
  /// In en, this message translates to:
  /// **'{count} waiting to sync'**
  String syncStatusPending(int count);

  /// No description provided for @syncStatusOffline.
  ///
  /// In en, this message translates to:
  /// **'Offline'**
  String get syncStatusOffline;

  /// No description provided for @syncStatusError.
  ///
  /// In en, this message translates to:
  /// **'Sync problem'**
  String get syncStatusError;

  /// No description provided for @syncStatusSignedOut.
  ///
  /// In en, this message translates to:
  /// **'Not backed up'**
  String get syncStatusSignedOut;

  /// No description provided for @syncLastSynced.
  ///
  /// In en, this message translates to:
  /// **'Last synced {time}'**
  String syncLastSynced(String time);

  /// No description provided for @syncNeverSynced.
  ///
  /// In en, this message translates to:
  /// **'Not synced yet'**
  String get syncNeverSynced;

  /// No description provided for @syncIssuesTitle.
  ///
  /// In en, this message translates to:
  /// **'Sync issues'**
  String get syncIssuesTitle;

  /// No description provided for @syncIssuesCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{No sync issues} =1{1 change was rejected} other{{count} changes were rejected}}'**
  String syncIssuesCount(int count);

  /// No description provided for @syncIssuesEmpty.
  ///
  /// In en, this message translates to:
  /// **'Nothing to fix. All changes were accepted.'**
  String get syncIssuesEmpty;

  /// No description provided for @syncIssuesHelp.
  ///
  /// In en, this message translates to:
  /// **'The cloud refused these changes. They stay on this phone and are not lost; discard them once you have checked.'**
  String get syncIssuesHelp;

  /// No description provided for @syncDiscard.
  ///
  /// In en, this message translates to:
  /// **'Discard'**
  String get syncDiscard;

  /// No description provided for @signInTitle.
  ///
  /// In en, this message translates to:
  /// **'Sign in'**
  String get signInTitle;

  /// No description provided for @signInBody.
  ///
  /// In en, this message translates to:
  /// **'Enter your email. We will send you a sign-in code.'**
  String get signInBody;

  /// No description provided for @signInEmailLabel.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get signInEmailLabel;

  /// No description provided for @signInEmailInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter a valid email address'**
  String get signInEmailInvalid;

  /// No description provided for @signInSendCode.
  ///
  /// In en, this message translates to:
  /// **'Send code'**
  String get signInSendCode;

  /// No description provided for @signInCodeSent.
  ///
  /// In en, this message translates to:
  /// **'We sent a code to {email}.'**
  String signInCodeSent(String email);

  /// No description provided for @signInCodeLabel.
  ///
  /// In en, this message translates to:
  /// **'Code from the email'**
  String get signInCodeLabel;

  /// No description provided for @signInCodeInvalid.
  ///
  /// In en, this message translates to:
  /// **'Enter the code from the email'**
  String get signInCodeInvalid;

  /// No description provided for @signInVerify.
  ///
  /// In en, this message translates to:
  /// **'Verify and sign in'**
  String get signInVerify;

  /// No description provided for @signInChangeEmail.
  ///
  /// In en, this message translates to:
  /// **'Use a different email'**
  String get signInChangeEmail;

  /// No description provided for @signInFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not sign in: {error}'**
  String signInFailed(String error);

  /// No description provided for @onboardingRestore.
  ///
  /// In en, this message translates to:
  /// **'Already use Parichit? Sign in to restore'**
  String get onboardingRestore;

  /// No description provided for @settingsAbout.
  ///
  /// In en, this message translates to:
  /// **'About Parichit'**
  String get settingsAbout;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'hi'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en':
      return AppLocalizationsEn();
    case 'hi':
      return AppLocalizationsHi();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.',
  );
}
