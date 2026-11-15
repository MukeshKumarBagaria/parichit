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

  /// No description provided for @actionOk.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get actionOk;

  /// No description provided for @actionYes.
  ///
  /// In en, this message translates to:
  /// **'Yes'**
  String get actionYes;

  /// No description provided for @actionNotNow.
  ///
  /// In en, this message translates to:
  /// **'Not now'**
  String get actionNotNow;

  /// No description provided for @actionAddAnyway.
  ///
  /// In en, this message translates to:
  /// **'Add anyway'**
  String get actionAddAnyway;

  /// No description provided for @actionDismiss.
  ///
  /// In en, this message translates to:
  /// **'Dismiss'**
  String get actionDismiss;

  /// No description provided for @actionDone.
  ///
  /// In en, this message translates to:
  /// **'Done'**
  String get actionDone;

  /// No description provided for @actionRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore'**
  String get actionRestore;

  /// No description provided for @actionSeeAll.
  ///
  /// In en, this message translates to:
  /// **'See all'**
  String get actionSeeAll;

  /// No description provided for @actionMeet.
  ///
  /// In en, this message translates to:
  /// **'Log meeting'**
  String get actionMeet;

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

  /// No description provided for @fieldNickname.
  ///
  /// In en, this message translates to:
  /// **'Nickname'**
  String get fieldNickname;

  /// No description provided for @fieldNicknameHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Pappu, Bablu'**
  String get fieldNicknameHint;

  /// No description provided for @fieldSurname.
  ///
  /// In en, this message translates to:
  /// **'Surname'**
  String get fieldSurname;

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

  /// No description provided for @fieldEmail.
  ///
  /// In en, this message translates to:
  /// **'Email'**
  String get fieldEmail;

  /// No description provided for @fieldWhatsapp.
  ///
  /// In en, this message translates to:
  /// **'On WhatsApp'**
  String get fieldWhatsapp;

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

  /// No description provided for @fieldFavorite.
  ///
  /// In en, this message translates to:
  /// **'Favourite'**
  String get fieldFavorite;

  /// No description provided for @fieldBirthDate.
  ///
  /// In en, this message translates to:
  /// **'Date of birth'**
  String get fieldBirthDate;

  /// No description provided for @fieldDeathDate.
  ///
  /// In en, this message translates to:
  /// **'Date of passing'**
  String get fieldDeathDate;

  /// No description provided for @fieldBirthOrder.
  ///
  /// In en, this message translates to:
  /// **'Birth order among siblings'**
  String get fieldBirthOrder;

  /// No description provided for @fieldBirthOrderHelp.
  ///
  /// In en, this message translates to:
  /// **'1 = eldest. Used for Tau/Chacha, Jeth/Devar when birth dates are unknown.'**
  String get fieldBirthOrderHelp;

  /// No description provided for @fieldNotifyBirthday.
  ///
  /// In en, this message translates to:
  /// **'Birthday reminder'**
  String get fieldNotifyBirthday;

  /// No description provided for @fieldNativePlace.
  ///
  /// In en, this message translates to:
  /// **'Native village / town'**
  String get fieldNativePlace;

  /// No description provided for @fieldGotra.
  ///
  /// In en, this message translates to:
  /// **'Gotra'**
  String get fieldGotra;

  /// No description provided for @fieldOccupation.
  ///
  /// In en, this message translates to:
  /// **'Occupation'**
  String get fieldOccupation;

  /// No description provided for @fieldOrganization.
  ///
  /// In en, this message translates to:
  /// **'Organisation / business'**
  String get fieldOrganization;

  /// No description provided for @fieldDesignation.
  ///
  /// In en, this message translates to:
  /// **'Designation'**
  String get fieldDesignation;

  /// No description provided for @fieldEducation.
  ///
  /// In en, this message translates to:
  /// **'Education'**
  String get fieldEducation;

  /// No description provided for @statusLiving.
  ///
  /// In en, this message translates to:
  /// **'Living'**
  String get statusLiving;

  /// No description provided for @statusDeceased.
  ///
  /// In en, this message translates to:
  /// **'Passed away'**
  String get statusDeceased;

  /// No description provided for @dateYear.
  ///
  /// In en, this message translates to:
  /// **'Year'**
  String get dateYear;

  /// No description provided for @dateMonth.
  ///
  /// In en, this message translates to:
  /// **'Month'**
  String get dateMonth;

  /// No description provided for @dateDay.
  ///
  /// In en, this message translates to:
  /// **'Day'**
  String get dateDay;

  /// No description provided for @dateUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unknown'**
  String get dateUnknown;

  /// No description provided for @dateApproximate.
  ///
  /// In en, this message translates to:
  /// **'Approximate (about)'**
  String get dateApproximate;

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

  /// No description provided for @ageYears.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 year} other{{count} years}}'**
  String ageYears(int count);

  /// No description provided for @dayToday.
  ///
  /// In en, this message translates to:
  /// **'Today'**
  String get dayToday;

  /// No description provided for @dayTomorrow.
  ///
  /// In en, this message translates to:
  /// **'Tomorrow'**
  String get dayTomorrow;

  /// No description provided for @dayYesterday.
  ///
  /// In en, this message translates to:
  /// **'Yesterday'**
  String get dayYesterday;

  /// No description provided for @dayInDays.
  ///
  /// In en, this message translates to:
  /// **'In {count} days'**
  String dayInDays(int count);

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

  /// No description provided for @homeToday.
  ///
  /// In en, this message translates to:
  /// **'Coming up this week'**
  String get homeToday;

  /// No description provided for @homeReconnect.
  ///
  /// In en, this message translates to:
  /// **'Haven\'t met in a while'**
  String get homeReconnect;

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

  /// No description provided for @peopleCount.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =1{1 person} other{{count} people}}'**
  String peopleCount(int count);

  /// No description provided for @filterFavorites.
  ///
  /// In en, this message translates to:
  /// **'Favourites'**
  String get filterFavorites;

  /// No description provided for @filterFamily.
  ///
  /// In en, this message translates to:
  /// **'Family'**
  String get filterFamily;

  /// No description provided for @filterNotMet.
  ///
  /// In en, this message translates to:
  /// **'Not met in 90 days'**
  String get filterNotMet;

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

  /// No description provided for @duplicateWarningTitle.
  ///
  /// In en, this message translates to:
  /// **'Already saved?'**
  String get duplicateWarningTitle;

  /// No description provided for @duplicateCreateAnyway.
  ///
  /// In en, this message translates to:
  /// **'Create anyway'**
  String get duplicateCreateAnyway;

  /// No description provided for @editPersonTitle.
  ///
  /// In en, this message translates to:
  /// **'Edit details'**
  String get editPersonTitle;

  /// No description provided for @editSectionBasic.
  ///
  /// In en, this message translates to:
  /// **'Basic'**
  String get editSectionBasic;

  /// No description provided for @editSectionContacts.
  ///
  /// In en, this message translates to:
  /// **'Phone & email'**
  String get editSectionContacts;

  /// No description provided for @editSectionLife.
  ///
  /// In en, this message translates to:
  /// **'Life events'**
  String get editSectionLife;

  /// No description provided for @editSectionOrigin.
  ///
  /// In en, this message translates to:
  /// **'Origin'**
  String get editSectionOrigin;

  /// No description provided for @editSectionWork.
  ///
  /// In en, this message translates to:
  /// **'Work & education'**
  String get editSectionWork;

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

  /// No description provided for @personSectionAbout.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get personSectionAbout;

  /// No description provided for @personSectionMeetings.
  ///
  /// In en, this message translates to:
  /// **'Meetings ({count})'**
  String personSectionMeetings(int count);

  /// No description provided for @personNoMeetings.
  ///
  /// In en, this message translates to:
  /// **'No meetings recorded yet.'**
  String get personNoMeetings;

  /// No description provided for @placeholderBadge.
  ///
  /// In en, this message translates to:
  /// **'Unknown person — tap to fill in'**
  String get placeholderBadge;

  /// No description provided for @openProfile.
  ///
  /// In en, this message translates to:
  /// **'Open profile'**
  String get openProfile;

  /// No description provided for @familyParents.
  ///
  /// In en, this message translates to:
  /// **'Parents'**
  String get familyParents;

  /// No description provided for @familySpouse.
  ///
  /// In en, this message translates to:
  /// **'Spouse'**
  String get familySpouse;

  /// No description provided for @familyFormerSpouse.
  ///
  /// In en, this message translates to:
  /// **'Former spouse'**
  String get familyFormerSpouse;

  /// No description provided for @familySiblings.
  ///
  /// In en, this message translates to:
  /// **'Siblings'**
  String get familySiblings;

  /// No description provided for @familyChildren.
  ///
  /// In en, this message translates to:
  /// **'Children'**
  String get familyChildren;

  /// No description provided for @familyExtended.
  ///
  /// In en, this message translates to:
  /// **'Extended family ({count})'**
  String familyExtended(int count);

  /// No description provided for @familyEmpty.
  ///
  /// In en, this message translates to:
  /// **'No relatives added yet.'**
  String get familyEmpty;

  /// No description provided for @addRelative.
  ///
  /// In en, this message translates to:
  /// **'Add relative'**
  String get addRelative;

  /// No description provided for @addRelativeTitle.
  ///
  /// In en, this message translates to:
  /// **'Add to {name}\'s family'**
  String addRelativeTitle(String name);

  /// No description provided for @moreRelations.
  ///
  /// In en, this message translates to:
  /// **'More relations'**
  String get moreRelations;

  /// No description provided for @searchRelationsHint.
  ///
  /// In en, this message translates to:
  /// **'Search: Chacha, Mama, Sasur…'**
  String get searchRelationsHint;

  /// No description provided for @relationGroupDirect.
  ///
  /// In en, this message translates to:
  /// **'Immediate family'**
  String get relationGroupDirect;

  /// No description provided for @relationGroupPaternal.
  ///
  /// In en, this message translates to:
  /// **'Father\'s side'**
  String get relationGroupPaternal;

  /// No description provided for @relationGroupMaternal.
  ///
  /// In en, this message translates to:
  /// **'Mother\'s side'**
  String get relationGroupMaternal;

  /// No description provided for @relationGroupChildren.
  ///
  /// In en, this message translates to:
  /// **'Children\'s families'**
  String get relationGroupChildren;

  /// No description provided for @relationGroupSiblings.
  ///
  /// In en, this message translates to:
  /// **'Siblings\' families'**
  String get relationGroupSiblings;

  /// No description provided for @relationGroupInLaws.
  ///
  /// In en, this message translates to:
  /// **'Spouse\'s family (in-laws)'**
  String get relationGroupInLaws;

  /// No description provided for @pickPersonTitle.
  ///
  /// In en, this message translates to:
  /// **'Who is {name}\'s {relation}?'**
  String pickPersonTitle(String name, String relation, String gender);

  /// No description provided for @pickPersonSearchHint.
  ///
  /// In en, this message translates to:
  /// **'Search people you\'ve saved'**
  String get pickPersonSearchHint;

  /// No description provided for @createNewPerson.
  ///
  /// In en, this message translates to:
  /// **'Create new person'**
  String get createNewPerson;

  /// No description provided for @choosePersonTitle.
  ///
  /// In en, this message translates to:
  /// **'Which {relation}?'**
  String choosePersonTitle(String relation);

  /// No description provided for @someoneNotListed.
  ///
  /// In en, this message translates to:
  /// **'Someone not in this list'**
  String get someoneNotListed;

  /// No description provided for @relativeAdded.
  ///
  /// In en, this message translates to:
  /// **'{name} added as {anchor}\'s {relation}'**
  String relativeAdded(String name, String relation, String anchor);

  /// No description provided for @suggestTitle.
  ///
  /// In en, this message translates to:
  /// **'One more thing'**
  String get suggestTitle;

  /// No description provided for @suggestAlsoParent.
  ///
  /// In en, this message translates to:
  /// **'Is {parent} also {child}\'s parent?'**
  String suggestAlsoParent(String parent, String child);

  /// No description provided for @suggestParentOfSiblings.
  ///
  /// In en, this message translates to:
  /// **'Is {parent} also the parent of {names}?'**
  String suggestParentOfSiblings(String parent, String names);

  /// No description provided for @warningTitle.
  ///
  /// In en, this message translates to:
  /// **'Please check'**
  String get warningTitle;

  /// No description provided for @cannotAddTitle.
  ///
  /// In en, this message translates to:
  /// **'This relation can\'t be added'**
  String get cannotAddTitle;

  /// No description provided for @violationSelf.
  ///
  /// In en, this message translates to:
  /// **'A person can\'t be their own relative.'**
  String get violationSelf;

  /// No description provided for @violationCycle.
  ///
  /// In en, this message translates to:
  /// **'This would make someone their own ancestor.'**
  String get violationCycle;

  /// No description provided for @violationDuplicate.
  ///
  /// In en, this message translates to:
  /// **'These two are already linked this way.'**
  String get violationDuplicate;

  /// No description provided for @violationTooManyParents.
  ///
  /// In en, this message translates to:
  /// **'This person already has two parents.'**
  String get violationTooManyParents;

  /// No description provided for @violationDuplicateParentGender.
  ///
  /// In en, this message translates to:
  /// **'This person already has a father or mother of this gender.'**
  String get violationDuplicateParentGender;

  /// No description provided for @violationParentTooYoung.
  ///
  /// In en, this message translates to:
  /// **'The parent seems too young for this child.'**
  String get violationParentTooYoung;

  /// No description provided for @violationCloseBlood.
  ///
  /// In en, this message translates to:
  /// **'These two are close blood relatives.'**
  String get violationCloseBlood;

  /// No description provided for @violationPartnerAncestor.
  ///
  /// In en, this message translates to:
  /// **'Someone can\'t marry their own ancestor or descendant.'**
  String get violationPartnerAncestor;

  /// No description provided for @removeLink.
  ///
  /// In en, this message translates to:
  /// **'Remove this link'**
  String get removeLink;

  /// No description provided for @linkRemoved.
  ///
  /// In en, this message translates to:
  /// **'Link removed'**
  String get linkRemoved;

  /// No description provided for @markDivorced.
  ///
  /// In en, this message translates to:
  /// **'Mark as separated / divorced'**
  String get markDivorced;

  /// No description provided for @networkTitle.
  ///
  /// In en, this message translates to:
  /// **'Network'**
  String get networkTitle;

  /// No description provided for @networkEmpty.
  ///
  /// In en, this message translates to:
  /// **'No friends or contacts linked yet.'**
  String get networkEmpty;

  /// No description provided for @addConnection.
  ///
  /// In en, this message translates to:
  /// **'Add connection'**
  String get addConnection;

  /// No description provided for @connectionTypeTitle.
  ///
  /// In en, this message translates to:
  /// **'How are they connected?'**
  String get connectionTypeTitle;

  /// No description provided for @connFriend.
  ///
  /// In en, this message translates to:
  /// **'Friend'**
  String get connFriend;

  /// No description provided for @connColleague.
  ///
  /// In en, this message translates to:
  /// **'Colleague'**
  String get connColleague;

  /// No description provided for @connBusiness.
  ///
  /// In en, this message translates to:
  /// **'Business'**
  String get connBusiness;

  /// No description provided for @connNeighbour.
  ///
  /// In en, this message translates to:
  /// **'Neighbour'**
  String get connNeighbour;

  /// No description provided for @connClassmate.
  ///
  /// In en, this message translates to:
  /// **'Classmate'**
  String get connClassmate;

  /// No description provided for @connTeacher.
  ///
  /// In en, this message translates to:
  /// **'Teacher'**
  String get connTeacher;

  /// No description provided for @connMentor.
  ///
  /// In en, this message translates to:
  /// **'Mentor'**
  String get connMentor;

  /// No description provided for @connIntroduced.
  ///
  /// In en, this message translates to:
  /// **'Introduced by / to'**
  String get connIntroduced;

  /// No description provided for @connPolitical.
  ///
  /// In en, this message translates to:
  /// **'Political'**
  String get connPolitical;

  /// No description provided for @connCommunity.
  ///
  /// In en, this message translates to:
  /// **'Community'**
  String get connCommunity;

  /// No description provided for @connOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get connOther;

  /// No description provided for @familyTreeTitle.
  ///
  /// In en, this message translates to:
  /// **'Family tree'**
  String get familyTreeTitle;

  /// No description provided for @familyHubTreeBody.
  ///
  /// In en, this message translates to:
  /// **'Explore generations; tap anyone to centre the tree on them.'**
  String get familyHubTreeBody;

  /// No description provided for @relationFinderTitle.
  ///
  /// In en, this message translates to:
  /// **'Find relation'**
  String get relationFinderTitle;

  /// No description provided for @familyHubFinderBody.
  ///
  /// In en, this message translates to:
  /// **'See exactly how any two people are connected.'**
  String get familyHubFinderBody;

  /// No description provided for @familyClustersTitle.
  ///
  /// In en, this message translates to:
  /// **'Families'**
  String get familyClustersTitle;

  /// No description provided for @familyClusterYours.
  ///
  /// In en, this message translates to:
  /// **'Your family'**
  String get familyClusterYours;

  /// No description provided for @familyClusterOf.
  ///
  /// In en, this message translates to:
  /// **'{name}\'s family'**
  String familyClusterOf(String name);

  /// No description provided for @treeChoosePerson.
  ///
  /// In en, this message translates to:
  /// **'Choose a person'**
  String get treeChoosePerson;

  /// No description provided for @treeCenterOnMe.
  ///
  /// In en, this message translates to:
  /// **'Centre on me'**
  String get treeCenterOnMe;

  /// No description provided for @treeModeTree.
  ///
  /// In en, this message translates to:
  /// **'Tree view'**
  String get treeModeTree;

  /// No description provided for @treeModeList.
  ///
  /// In en, this message translates to:
  /// **'List view'**
  String get treeModeList;

  /// No description provided for @treeGenerationsUp.
  ///
  /// In en, this message translates to:
  /// **'Generations up'**
  String get treeGenerationsUp;

  /// No description provided for @treeGenerationsDown.
  ///
  /// In en, this message translates to:
  /// **'Generations down'**
  String get treeGenerationsDown;

  /// No description provided for @finderPersonA.
  ///
  /// In en, this message translates to:
  /// **'First person'**
  String get finderPersonA;

  /// No description provided for @finderPersonB.
  ///
  /// In en, this message translates to:
  /// **'Second person'**
  String get finderPersonB;

  /// No description provided for @finderSelect.
  ///
  /// In en, this message translates to:
  /// **'Select a person'**
  String get finderSelect;

  /// No description provided for @finderSwap.
  ///
  /// In en, this message translates to:
  /// **'Swap'**
  String get finderSwap;

  /// No description provided for @finderIncludeFriends.
  ///
  /// In en, this message translates to:
  /// **'Include friends & contacts'**
  String get finderIncludeFriends;

  /// No description provided for @finderNotConnected.
  ///
  /// In en, this message translates to:
  /// **'These two aren\'t connected yet.'**
  String get finderNotConnected;

  /// No description provided for @finderAlternatives.
  ///
  /// In en, this message translates to:
  /// **'Other connections'**
  String get finderAlternatives;

  /// No description provided for @finderCommonAncestor.
  ///
  /// In en, this message translates to:
  /// **'Common ancestor: {name}'**
  String finderCommonAncestor(String name);

  /// No description provided for @meetingsTimeline.
  ///
  /// In en, this message translates to:
  /// **'Timeline'**
  String get meetingsTimeline;

  /// No description provided for @meetingsUpcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get meetingsUpcoming;

  /// No description provided for @meetingsEmptyTitle.
  ///
  /// In en, this message translates to:
  /// **'No meetings yet'**
  String get meetingsEmptyTitle;

  /// No description provided for @meetingsEmptyBody.
  ///
  /// In en, this message translates to:
  /// **'Record who you met, where, and what you talked about.'**
  String get meetingsEmptyBody;

  /// No description provided for @meetingEdit.
  ///
  /// In en, this message translates to:
  /// **'Meeting'**
  String get meetingEdit;

  /// No description provided for @meetingWho.
  ///
  /// In en, this message translates to:
  /// **'Who was there?'**
  String get meetingWho;

  /// No description provided for @meetingAddPerson.
  ///
  /// In en, this message translates to:
  /// **'Add person'**
  String get meetingAddPerson;

  /// No description provided for @meetingNeedsPerson.
  ///
  /// In en, this message translates to:
  /// **'Add at least one person.'**
  String get meetingNeedsPerson;

  /// No description provided for @meetingWhere.
  ///
  /// In en, this message translates to:
  /// **'Place'**
  String get meetingWhere;

  /// No description provided for @meetingLocationDetail.
  ///
  /// In en, this message translates to:
  /// **'Location details (optional)'**
  String get meetingLocationDetail;

  /// No description provided for @meetingTitle.
  ///
  /// In en, this message translates to:
  /// **'Title (optional)'**
  String get meetingTitle;

  /// No description provided for @meetingTitleHint.
  ///
  /// In en, this message translates to:
  /// **'e.g. Amit\'s wedding'**
  String get meetingTitleHint;

  /// No description provided for @meetingNotesHint.
  ///
  /// In en, this message translates to:
  /// **'What did you talk about?'**
  String get meetingNotesHint;

  /// No description provided for @meetingFollowUp.
  ///
  /// In en, this message translates to:
  /// **'Remind me to follow up'**
  String get meetingFollowUp;

  /// No description provided for @meetingFollowUpNote.
  ///
  /// In en, this message translates to:
  /// **'Follow-up note'**
  String get meetingFollowUpNote;

  /// No description provided for @meetingTypeInPerson.
  ///
  /// In en, this message translates to:
  /// **'Met in person'**
  String get meetingTypeInPerson;

  /// No description provided for @meetingTypeVisit.
  ///
  /// In en, this message translates to:
  /// **'Visit'**
  String get meetingTypeVisit;

  /// No description provided for @meetingTypePhone.
  ///
  /// In en, this message translates to:
  /// **'Phone call'**
  String get meetingTypePhone;

  /// No description provided for @meetingTypeVideo.
  ///
  /// In en, this message translates to:
  /// **'Video call'**
  String get meetingTypeVideo;

  /// No description provided for @meetingTypeMessage.
  ///
  /// In en, this message translates to:
  /// **'Message'**
  String get meetingTypeMessage;

  /// No description provided for @meetingTypeEvent.
  ///
  /// In en, this message translates to:
  /// **'Event / function'**
  String get meetingTypeEvent;

  /// No description provided for @meetingTypeOther.
  ///
  /// In en, this message translates to:
  /// **'Other'**
  String get meetingTypeOther;

  /// No description provided for @placeCreate.
  ///
  /// In en, this message translates to:
  /// **'Add \"{name}\"'**
  String placeCreate(String name);

  /// No description provided for @upcomingNext60Days.
  ///
  /// In en, this message translates to:
  /// **'Next 60 days'**
  String get upcomingNext60Days;

  /// No description provided for @upcomingNothing.
  ///
  /// In en, this message translates to:
  /// **'Nothing coming up.'**
  String get upcomingNothing;

  /// No description provided for @upcomingBirthday.
  ///
  /// In en, this message translates to:
  /// **'{years, plural, =0{{name}\'s birthday} other{{name} turns {years}}}'**
  String upcomingBirthday(String name, int years);

  /// No description provided for @upcomingAnniversary.
  ///
  /// In en, this message translates to:
  /// **'{years, plural, =0{{names}: anniversary} other{{names}: {years} years married}}'**
  String upcomingAnniversary(String names, int years);

  /// No description provided for @upcomingBarsi.
  ///
  /// In en, this message translates to:
  /// **'{names}: barsi (death anniversary)'**
  String upcomingBarsi(String names);

  /// No description provided for @reminderAdd.
  ///
  /// In en, this message translates to:
  /// **'Add reminder'**
  String get reminderAdd;

  /// No description provided for @reminderWhat.
  ///
  /// In en, this message translates to:
  /// **'What to remember'**
  String get reminderWhat;

  /// No description provided for @reminderRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat'**
  String get reminderRepeat;

  /// No description provided for @repeatNone.
  ///
  /// In en, this message translates to:
  /// **'Don\'t repeat'**
  String get repeatNone;

  /// No description provided for @repeatWeekly.
  ///
  /// In en, this message translates to:
  /// **'Every week'**
  String get repeatWeekly;

  /// No description provided for @repeatMonthly.
  ///
  /// In en, this message translates to:
  /// **'Every month'**
  String get repeatMonthly;

  /// No description provided for @repeatYearly.
  ///
  /// In en, this message translates to:
  /// **'Every year'**
  String get repeatYearly;

  /// No description provided for @tagsTitle.
  ///
  /// In en, this message translates to:
  /// **'Tags'**
  String get tagsTitle;

  /// No description provided for @tagsEdit.
  ///
  /// In en, this message translates to:
  /// **'Edit tags'**
  String get tagsEdit;

  /// No description provided for @tagsNone.
  ///
  /// In en, this message translates to:
  /// **'No tags.'**
  String get tagsNone;

  /// No description provided for @tagsNew.
  ///
  /// In en, this message translates to:
  /// **'New tag'**
  String get tagsNew;

  /// No description provided for @moreData.
  ///
  /// In en, this message translates to:
  /// **'Your data'**
  String get moreData;

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

  /// No description provided for @settingsSecurity.
  ///
  /// In en, this message translates to:
  /// **'Security'**
  String get settingsSecurity;

  /// No description provided for @settingsAppLock.
  ///
  /// In en, this message translates to:
  /// **'App lock'**
  String get settingsAppLock;

  /// No description provided for @settingsAppLockBody.
  ///
  /// In en, this message translates to:
  /// **'Fingerprint, face or phone PIN when opening Parichit.'**
  String get settingsAppLockBody;

  /// No description provided for @lockTitle.
  ///
  /// In en, this message translates to:
  /// **'Parichit is locked'**
  String get lockTitle;

  /// No description provided for @lockUnlock.
  ///
  /// In en, this message translates to:
  /// **'Unlock'**
  String get lockUnlock;

  /// No description provided for @lockReason.
  ///
  /// In en, this message translates to:
  /// **'Unlock Parichit'**
  String get lockReason;

  /// No description provided for @lockUnsupported.
  ///
  /// In en, this message translates to:
  /// **'This phone has no fingerprint, face or screen lock set up.'**
  String get lockUnsupported;

  /// No description provided for @backupTitle.
  ///
  /// In en, this message translates to:
  /// **'Backup & export'**
  String get backupTitle;

  /// No description provided for @backupEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Encrypted backup'**
  String get backupEncrypted;

  /// No description provided for @backupCreate.
  ///
  /// In en, this message translates to:
  /// **'Create backup file'**
  String get backupCreate;

  /// No description provided for @backupCreateBody.
  ///
  /// In en, this message translates to:
  /// **'Everything, encrypted with your passphrase. Save it to Drive or send it to yourself.'**
  String get backupCreateBody;

  /// No description provided for @backupRestore.
  ///
  /// In en, this message translates to:
  /// **'Restore from backup'**
  String get backupRestore;

  /// No description provided for @backupRestoreBody.
  ///
  /// In en, this message translates to:
  /// **'Newer versions of each record are kept.'**
  String get backupRestoreBody;

  /// No description provided for @backupRestored.
  ///
  /// In en, this message translates to:
  /// **'{count, plural, =0{Nothing new to restore.} =1{1 record restored.} other{{count} records restored.}}'**
  String backupRestored(int count);

  /// No description provided for @backupPassphrase.
  ///
  /// In en, this message translates to:
  /// **'Passphrase'**
  String get backupPassphrase;

  /// No description provided for @backupPassphraseRepeat.
  ///
  /// In en, this message translates to:
  /// **'Repeat passphrase'**
  String get backupPassphraseRepeat;

  /// No description provided for @backupPassphraseHelp.
  ///
  /// In en, this message translates to:
  /// **'Choose a passphrase (at least 6 characters). Without it the backup cannot be opened — write it down.'**
  String get backupPassphraseHelp;

  /// No description provided for @backupPassphraseEnter.
  ///
  /// In en, this message translates to:
  /// **'Enter the passphrase used for this backup.'**
  String get backupPassphraseEnter;

  /// No description provided for @backupPassphraseTooShort.
  ///
  /// In en, this message translates to:
  /// **'The passphrase needs at least 6 characters.'**
  String get backupPassphraseTooShort;

  /// No description provided for @backupPassphraseMismatch.
  ///
  /// In en, this message translates to:
  /// **'The passphrases don\'t match.'**
  String get backupPassphraseMismatch;

  /// No description provided for @backupWrongPassphrase.
  ///
  /// In en, this message translates to:
  /// **'Wrong passphrase, or not a Parichit backup.'**
  String get backupWrongPassphrase;

  /// No description provided for @exportTitle.
  ///
  /// In en, this message translates to:
  /// **'Export'**
  String get exportTitle;

  /// No description provided for @exportCsv.
  ///
  /// In en, this message translates to:
  /// **'People (CSV / Excel)'**
  String get exportCsv;

  /// No description provided for @exportCsvBody.
  ///
  /// In en, this message translates to:
  /// **'A spreadsheet of everyone with phones, villages and relations.'**
  String get exportCsvBody;

  /// No description provided for @exportGedcom.
  ///
  /// In en, this message translates to:
  /// **'Family tree (GEDCOM)'**
  String get exportGedcom;

  /// No description provided for @exportGedcomBody.
  ///
  /// In en, this message translates to:
  /// **'Open your tree in Ancestry, MyHeritage, FamilySearch or Gramps.'**
  String get exportGedcomBody;

  /// No description provided for @duplicatesTitle.
  ///
  /// In en, this message translates to:
  /// **'Duplicates'**
  String get duplicatesTitle;

  /// No description provided for @duplicatesNone.
  ///
  /// In en, this message translates to:
  /// **'No duplicates found.'**
  String get duplicatesNone;

  /// No description provided for @duplicatesNotSame.
  ///
  /// In en, this message translates to:
  /// **'Not the same'**
  String get duplicatesNotSame;

  /// No description provided for @mergeAction.
  ///
  /// In en, this message translates to:
  /// **'Merge'**
  String get mergeAction;

  /// No description provided for @mergeKeepWhich.
  ///
  /// In en, this message translates to:
  /// **'Keep which details?'**
  String get mergeKeepWhich;

  /// No description provided for @mergeDone.
  ///
  /// In en, this message translates to:
  /// **'{merged} merged into {survivor}'**
  String mergeDone(String merged, String survivor);

  /// No description provided for @trashTitle.
  ///
  /// In en, this message translates to:
  /// **'Trash'**
  String get trashTitle;

  /// No description provided for @trashEmpty.
  ///
  /// In en, this message translates to:
  /// **'Trash is empty.'**
  String get trashEmpty;

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

  /// No description provided for @accountConfirmWord.
  ///
  /// In en, this message translates to:
  /// **'DELETE'**
  String get accountConfirmWord;

  /// No description provided for @accountConfirmHint.
  ///
  /// In en, this message translates to:
  /// **'Type {word} to confirm'**
  String accountConfirmHint(String word);

  /// No description provided for @accountDeleteButton.
  ///
  /// In en, this message translates to:
  /// **'Delete my cloud account'**
  String get accountDeleteButton;

  /// No description provided for @accountDeleteTitle.
  ///
  /// In en, this message translates to:
  /// **'Delete cloud account?'**
  String get accountDeleteTitle;

  /// No description provided for @accountDeleteBody.
  ///
  /// In en, this message translates to:
  /// **'This permanently deletes your Parichit account and every record stored in the cloud. Data on this phone stays until you erase it. This cannot be undone.'**
  String get accountDeleteBody;

  /// No description provided for @accountDeleted.
  ///
  /// In en, this message translates to:
  /// **'Your cloud account and its data were deleted.'**
  String get accountDeleted;

  /// No description provided for @accountDeleteFailed.
  ///
  /// In en, this message translates to:
  /// **'Could not delete the account: {error}'**
  String accountDeleteFailed(String error);

  /// No description provided for @eraseDeviceButton.
  ///
  /// In en, this message translates to:
  /// **'Erase all data on this phone'**
  String get eraseDeviceButton;

  /// No description provided for @eraseDeviceTitle.
  ///
  /// In en, this message translates to:
  /// **'Erase this phone?'**
  String get eraseDeviceTitle;

  /// No description provided for @eraseDeviceBody.
  ///
  /// In en, this message translates to:
  /// **'Everyone, every relation, meeting and setting stored on this phone will be deleted and you will be signed out. Your cloud backup (if any) is not affected. This cannot be undone.'**
  String get eraseDeviceBody;
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
