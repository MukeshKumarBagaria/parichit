// ignore: unused_import
import 'package:intl/intl.dart' as intl;

import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get appTitle => 'परिचित';

  @override
  String get appTagline => 'आपके लोग, आपके परिवार, आपके रिश्ते।';

  @override
  String get navHome => 'मुख्य';

  @override
  String get navPeople => 'लोग';

  @override
  String get navFamily => 'परिवार';

  @override
  String get navMeetings => 'मुलाक़ातें';

  @override
  String get navMore => 'अधिक';

  @override
  String get actionSave => 'सहेजें';

  @override
  String get actionSaveAndAddAnother => 'सहेजें और एक और जोड़ें';

  @override
  String get actionCancel => 'रद्द करें';

  @override
  String get actionDelete => 'हटाएँ';

  @override
  String get actionUndo => 'वापस लें';

  @override
  String get actionContinue => 'आगे बढ़ें';

  @override
  String get actionGetStarted => 'शुरू करें';

  @override
  String get actionBack => 'पीछे';

  @override
  String get actionOk => 'ठीक है';

  @override
  String get actionYes => 'हाँ';

  @override
  String get actionNotNow => 'अभी नहीं';

  @override
  String get actionAddAnyway => 'फिर भी जोड़ें';

  @override
  String get actionDismiss => 'हटाएँ';

  @override
  String get actionDone => 'हो गया';

  @override
  String get actionRestore => 'वापस लाएँ';

  @override
  String get actionSeeAll => 'सभी देखें';

  @override
  String get actionMeet => 'मुलाक़ात लिखें';

  @override
  String get actionCall => 'कॉल';

  @override
  String get actionWhatsApp => 'व्हाट्सऐप';

  @override
  String get onboardingWelcomeTitle => 'परिचित में आपका स्वागत है';

  @override
  String get onboardingWelcomeBody => 'अपना परिवार और जान-पहचान के सभी लोग एक निजी जगह पर रखें — बिना इंटरनेट के भी।';

  @override
  String get onboardingChooseLanguage => 'अपनी भाषा चुनें';

  @override
  String get onboardingAboutYouTitle => 'पहले अपने बारे में बताइए';

  @override
  String get onboardingAboutYouBody =>
      'आप जिसे भी जोड़ेंगे वह आपसे जुड़ा होगा, ताकि परिचित बता सके कि आपका उनसे क्या रिश्ता है।';

  @override
  String get fieldFullName => 'पूरा नाम';

  @override
  String get fieldFullNameHint => 'जैसे Ramesh Sharma';

  @override
  String get fieldFullNameAlt => 'हिंदी में नाम (वैकल्पिक)';

  @override
  String get fieldFullNameAltHint => 'जैसे रमेश शर्मा';

  @override
  String get fieldNickname => 'उपनाम / घर का नाम';

  @override
  String get fieldNicknameHint => 'जैसे पप्पू, बबलू';

  @override
  String get fieldSurname => 'कुलनाम';

  @override
  String get fieldGender => 'लिंग';

  @override
  String get genderMale => 'पुरुष';

  @override
  String get genderFemale => 'महिला';

  @override
  String get genderOther => 'अन्य';

  @override
  String get genderUnknown => 'नहीं बताया';

  @override
  String get fieldPhone => 'मोबाइल नंबर';

  @override
  String get fieldPhoneHint => '10 अंकों का मोबाइल नंबर';

  @override
  String get fieldEmail => 'ईमेल';

  @override
  String get fieldWhatsapp => 'व्हाट्सऐप पर है';

  @override
  String get fieldNotes => 'नोट्स';

  @override
  String get fieldNotesHint => 'कहाँ मिले, क्या बात हुई…';

  @override
  String get fieldFavorite => 'पसंदीदा';

  @override
  String get fieldBirthDate => 'जन्म तिथि';

  @override
  String get fieldDeathDate => 'देहांत की तिथि';

  @override
  String get fieldBirthOrder => 'भाई-बहनों में जन्म क्रम';

  @override
  String get fieldBirthOrderHelp => '1 = सबसे बड़े। जन्म तिथि न होने पर ताऊ/चाचा, जेठ/देवर तय करने में काम आता है।';

  @override
  String get fieldNotifyBirthday => 'जन्मदिन की याद दिलाएँ';

  @override
  String get fieldNativePlace => 'पैतृक गाँव / शहर';

  @override
  String get fieldGotra => 'गोत्र';

  @override
  String get fieldOccupation => 'व्यवसाय';

  @override
  String get fieldOrganization => 'संस्था / कारोबार';

  @override
  String get fieldDesignation => 'पद';

  @override
  String get fieldEducation => 'शिक्षा';

  @override
  String get statusLiving => 'जीवित';

  @override
  String get statusDeceased => 'स्वर्गवासी';

  @override
  String get dateYear => 'वर्ष';

  @override
  String get dateMonth => 'महीना';

  @override
  String get dateDay => 'दिन';

  @override
  String get dateUnknown => 'पता नहीं';

  @override
  String get dateApproximate => 'लगभग';

  @override
  String get validationNameRequired => 'कृपया नाम लिखें';

  @override
  String get validationPhoneInvalid => 'कृपया सही फ़ोन नंबर लिखें';

  @override
  String ageYears(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count वर्ष',
      one: '1 वर्ष',
    );
    return '$_temp0';
  }

  @override
  String get dayToday => 'आज';

  @override
  String get dayTomorrow => 'कल';

  @override
  String get dayYesterday => 'बीता कल';

  @override
  String dayInDays(int count) {
    return '$count दिन में';
  }

  @override
  String homeGreeting(String name) {
    return 'नमस्ते, $name';
  }

  @override
  String get homeSearchHint => 'लोग, गाँव, फ़ोन खोजें…';

  @override
  String get homeQuickAdd => 'जल्दी जोड़ें';

  @override
  String get homeLogMeeting => 'मुलाक़ात लिखें';

  @override
  String get homeFindRelation => 'रिश्ता खोजें';

  @override
  String get homeFamilyTree => 'वंश वृक्ष';

  @override
  String homePeopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count लोग सहेजे गए',
      one: '1 व्यक्ति सहेजा गया',
      zero: 'अभी कोई नहीं',
    );
    return '$_temp0';
  }

  @override
  String get homeRecentlyAdded => 'हाल ही में जोड़े गए';

  @override
  String get homeToday => 'इस सप्ताह';

  @override
  String get homeReconnect => 'काफ़ी समय से नहीं मिले';

  @override
  String get homeEmptyTitle => 'किसी जान-पहचान वाले से शुरू करें';

  @override
  String get homeEmptyBody => 'परिवार के किसी सदस्य या आज मिले किसी व्यक्ति को जोड़ें। बस कुछ सेकंड लगेंगे।';

  @override
  String get peopleSearchHint => 'नाम या फ़ोन से खोजें';

  @override
  String get peopleEmptyTitle => 'अभी कोई व्यक्ति नहीं';

  @override
  String get peopleEmptyBody => 'पहला व्यक्ति जोड़ने के लिए + दबाएँ।';

  @override
  String peopleNoResults(String query) {
    return '\"$query\" से कोई नहीं मिला';
  }

  @override
  String peopleCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count लोग',
      one: '1 व्यक्ति',
    );
    return '$_temp0';
  }

  @override
  String get filterFavorites => 'पसंदीदा';

  @override
  String get filterFamily => 'परिवार';

  @override
  String get filterNotMet => '90 दिन से नहीं मिले';

  @override
  String get quickAddTitle => 'जल्दी जोड़ें';

  @override
  String personSaved(String name) {
    return '$name सहेजे गए';
  }

  @override
  String personDeleted(String name) {
    return '$name ट्रैश में भेजे गए';
  }

  @override
  String get personNotFound => 'यह व्यक्ति अब मौजूद नहीं है।';

  @override
  String get duplicateWarningTitle => 'पहले से सहेजे हैं?';

  @override
  String get duplicateCreateAnyway => 'फिर भी बनाएँ';

  @override
  String get editPersonTitle => 'जानकारी बदलें';

  @override
  String get editSectionBasic => 'मूल जानकारी';

  @override
  String get editSectionContacts => 'फ़ोन और ईमेल';

  @override
  String get editSectionLife => 'जीवन की घटनाएँ';

  @override
  String get editSectionOrigin => 'मूल स्थान';

  @override
  String get editSectionWork => 'काम और शिक्षा';

  @override
  String get relationYou => 'आप';

  @override
  String get personLatePrefix => 'स्व.';

  @override
  String get personSectionContacts => 'संपर्क';

  @override
  String get personSectionNotes => 'नोट्स';

  @override
  String get personSectionFamily => 'परिवार';

  @override
  String get personSectionAbout => 'विवरण';

  @override
  String personSectionMeetings(int count) {
    return 'मुलाक़ातें ($count)';
  }

  @override
  String get personNoMeetings => 'अभी कोई मुलाक़ात दर्ज नहीं।';

  @override
  String get placeholderBadge => 'अज्ञात व्यक्ति — जानकारी भरें';

  @override
  String get openProfile => 'प्रोफ़ाइल खोलें';

  @override
  String get familyParents => 'माता-पिता';

  @override
  String get familySpouse => 'जीवनसाथी';

  @override
  String get familyFormerSpouse => 'पूर्व जीवनसाथी';

  @override
  String get familySiblings => 'भाई-बहन';

  @override
  String get familyChildren => 'संतान';

  @override
  String familyExtended(int count) {
    return 'विस्तृत परिवार ($count)';
  }

  @override
  String get familyEmpty => 'अभी कोई रिश्तेदार नहीं जोड़ा गया।';

  @override
  String get addRelative => 'रिश्तेदार जोड़ें';

  @override
  String addRelativeTitle(String name) {
    return '$name के परिवार में जोड़ें';
  }

  @override
  String get moreRelations => 'और रिश्ते';

  @override
  String get searchRelationsHint => 'खोजें: चाचा, मामा, ससुर…';

  @override
  String get relationGroupDirect => 'निकट परिवार';

  @override
  String get relationGroupPaternal => 'पितृ पक्ष';

  @override
  String get relationGroupMaternal => 'मातृ पक्ष';

  @override
  String get relationGroupChildren => 'बच्चों का परिवार';

  @override
  String get relationGroupSiblings => 'भाई-बहनों का परिवार';

  @override
  String get relationGroupInLaws => 'ससुराल';

  @override
  String pickPersonTitle(String name, String relation, String gender) {
    String _temp0 = intl.Intl.selectLogic(
      gender,
      {
        'female': 'की',
        'other': 'के',
      },
    );
    return '$name $_temp0 $relation कौन हैं?';
  }

  @override
  String get pickPersonSearchHint => 'सहेजे गए लोगों में खोजें';

  @override
  String get createNewPerson => 'नया व्यक्ति बनाएँ';

  @override
  String choosePersonTitle(String relation) {
    return 'कौन से $relation?';
  }

  @override
  String get someoneNotListed => 'कोई और (सूची में नहीं)';

  @override
  String relativeAdded(String name, String relation, String anchor) {
    return '$name को $anchor के $relation के रूप में जोड़ा गया';
  }

  @override
  String get suggestTitle => 'एक और बात';

  @override
  String suggestAlsoParent(String parent, String child) {
    return 'क्या $parent भी $child के माता/पिता हैं?';
  }

  @override
  String suggestParentOfSiblings(String parent, String names) {
    return 'क्या $parent $names के भी माता/पिता हैं?';
  }

  @override
  String get warningTitle => 'कृपया जाँचें';

  @override
  String get cannotAddTitle => 'यह रिश्ता नहीं जुड़ सकता';

  @override
  String get violationSelf => 'कोई व्यक्ति स्वयं का रिश्तेदार नहीं हो सकता।';

  @override
  String get violationCycle => 'इससे कोई व्यक्ति अपना ही पूर्वज बन जाएगा।';

  @override
  String get violationDuplicate => 'ये दोनों पहले से इसी तरह जुड़े हैं।';

  @override
  String get violationTooManyParents => 'इस व्यक्ति के पहले से दो माता-पिता हैं।';

  @override
  String get violationDuplicateParentGender => 'इस व्यक्ति के पहले से इस लिंग के पिता या माता हैं।';

  @override
  String get violationParentTooYoung => 'इस संतान के लिए माता/पिता की उम्र बहुत कम लगती है।';

  @override
  String get violationCloseBlood => 'ये दोनों निकट रक्त संबंधी हैं।';

  @override
  String get violationPartnerAncestor => 'कोई अपने ही पूर्वज या वंशज से विवाह नहीं कर सकता।';

  @override
  String get removeLink => 'यह संबंध हटाएँ';

  @override
  String get linkRemoved => 'संबंध हटाया गया';

  @override
  String get markDivorced => 'अलग / तलाक़शुदा चिह्नित करें';

  @override
  String get networkTitle => 'जान-पहचान';

  @override
  String get networkEmpty => 'अभी कोई मित्र या संपर्क नहीं जुड़ा।';

  @override
  String get addConnection => 'संपर्क जोड़ें';

  @override
  String get connectionTypeTitle => 'कैसे जुड़े हैं?';

  @override
  String get connFriend => 'मित्र';

  @override
  String get connColleague => 'सहकर्मी';

  @override
  String get connBusiness => 'व्यापार';

  @override
  String get connNeighbour => 'पड़ोसी';

  @override
  String get connClassmate => 'सहपाठी';

  @override
  String get connTeacher => 'शिक्षक';

  @override
  String get connMentor => 'मार्गदर्शक';

  @override
  String get connIntroduced => 'परिचय कराया';

  @override
  String get connPolitical => 'राजनीतिक';

  @override
  String get connCommunity => 'समाज';

  @override
  String get connOther => 'अन्य';

  @override
  String get familyTreeTitle => 'वंश वृक्ष';

  @override
  String get familyHubTreeBody => 'पीढ़ियाँ देखें; किसी पर भी टैप करके वृक्ष उन पर केंद्रित करें।';

  @override
  String get relationFinderTitle => 'रिश्ता खोजें';

  @override
  String get familyHubFinderBody => 'देखें कि कोई भी दो लोग आपस में कैसे जुड़े हैं।';

  @override
  String get familyClustersTitle => 'परिवार';

  @override
  String get familyClusterYours => 'आपका परिवार';

  @override
  String familyClusterOf(String name) {
    return '$name का परिवार';
  }

  @override
  String get treeChoosePerson => 'व्यक्ति चुनें';

  @override
  String get treeCenterOnMe => 'मुझ पर केंद्रित करें';

  @override
  String get treeModeTree => 'वृक्ष रूप';

  @override
  String get treeModeList => 'सूची रूप';

  @override
  String get treeGenerationsUp => 'ऊपर की पीढ़ियाँ';

  @override
  String get treeGenerationsDown => 'नीचे की पीढ़ियाँ';

  @override
  String get finderPersonA => 'पहला व्यक्ति';

  @override
  String get finderPersonB => 'दूसरा व्यक्ति';

  @override
  String get finderSelect => 'व्यक्ति चुनें';

  @override
  String get finderSwap => 'अदला-बदली';

  @override
  String get finderIncludeFriends => 'मित्र व संपर्क भी शामिल करें';

  @override
  String get finderNotConnected => 'ये दोनों अभी जुड़े नहीं हैं।';

  @override
  String get finderAlternatives => 'अन्य संबंध';

  @override
  String finderCommonAncestor(String name) {
    return 'समान पूर्वज: $name';
  }

  @override
  String get meetingsTimeline => 'समयरेखा';

  @override
  String get meetingsUpcoming => 'आगामी';

  @override
  String get meetingsEmptyTitle => 'अभी कोई मुलाक़ात नहीं';

  @override
  String get meetingsEmptyBody => 'किससे, कहाँ मिले और क्या बात हुई — लिख लें।';

  @override
  String get meetingEdit => 'मुलाक़ात';

  @override
  String get meetingWho => 'कौन-कौन थे?';

  @override
  String get meetingAddPerson => 'व्यक्ति जोड़ें';

  @override
  String get meetingNeedsPerson => 'कम से कम एक व्यक्ति जोड़ें।';

  @override
  String get meetingWhere => 'स्थान';

  @override
  String get meetingLocationDetail => 'स्थान का विवरण (वैकल्पिक)';

  @override
  String get meetingTitle => 'शीर्षक (वैकल्पिक)';

  @override
  String get meetingTitleHint => 'जैसे अमित की शादी';

  @override
  String get meetingNotesHint => 'क्या बात हुई?';

  @override
  String get meetingFollowUp => 'फ़ॉलो-अप की याद दिलाएँ';

  @override
  String get meetingFollowUpNote => 'फ़ॉलो-अप नोट';

  @override
  String get meetingTypeInPerson => 'आमने-सामने';

  @override
  String get meetingTypeVisit => 'घर जाना';

  @override
  String get meetingTypePhone => 'फ़ोन कॉल';

  @override
  String get meetingTypeVideo => 'वीडियो कॉल';

  @override
  String get meetingTypeMessage => 'संदेश';

  @override
  String get meetingTypeEvent => 'कार्यक्रम / समारोह';

  @override
  String get meetingTypeOther => 'अन्य';

  @override
  String placeCreate(String name) {
    return '\"$name\" जोड़ें';
  }

  @override
  String get upcomingNext60Days => 'अगले 60 दिन';

  @override
  String get upcomingNothing => 'कुछ आगामी नहीं।';

  @override
  String upcomingBirthday(String name, int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$name का $yearsवाँ जन्मदिन',
      zero: '$name का जन्मदिन',
    );
    return '$_temp0';
  }

  @override
  String upcomingAnniversary(String names, int years) {
    String _temp0 = intl.Intl.pluralLogic(
      years,
      locale: localeName,
      other: '$names: विवाह के $years वर्ष',
      zero: '$names: विवाह वर्षगाँठ',
    );
    return '$_temp0';
  }

  @override
  String upcomingBarsi(String names) {
    return '$names: बरसी';
  }

  @override
  String get reminderAdd => 'रिमाइंडर जोड़ें';

  @override
  String get reminderWhat => 'क्या याद रखना है';

  @override
  String get reminderRepeat => 'दोहराएँ';

  @override
  String get repeatNone => 'नहीं दोहराएँ';

  @override
  String get repeatWeekly => 'हर सप्ताह';

  @override
  String get repeatMonthly => 'हर महीने';

  @override
  String get repeatYearly => 'हर साल';

  @override
  String get tagsTitle => 'टैग';

  @override
  String get tagsEdit => 'टैग बदलें';

  @override
  String get tagsNone => 'कोई टैग नहीं।';

  @override
  String get tagsNew => 'नया टैग';

  @override
  String get moreData => 'आपका डेटा';

  @override
  String get settingsTitle => 'सेटिंग्स';

  @override
  String get settingsLanguage => 'भाषा';

  @override
  String get settingsLanguageSystem => 'फ़ोन के अनुसार';

  @override
  String get settingsTheme => 'थीम';

  @override
  String get themeSystem => 'सिस्टम';

  @override
  String get themeLight => 'लाइट';

  @override
  String get themeDark => 'डार्क';

  @override
  String get settingsSecurity => 'सुरक्षा';

  @override
  String get settingsAppLock => 'ऐप लॉक';

  @override
  String get settingsAppLockBody => 'परिचित खोलते समय फ़िंगरप्रिंट, चेहरा या फ़ोन पिन।';

  @override
  String get lockTitle => 'परिचित लॉक है';

  @override
  String get lockUnlock => 'अनलॉक करें';

  @override
  String get lockReason => 'परिचित अनलॉक करें';

  @override
  String get lockUnsupported => 'इस फ़ोन पर फ़िंगरप्रिंट, चेहरा या स्क्रीन लॉक सेट नहीं है।';

  @override
  String get settingsSync => 'क्लाउड बैकअप और सिंक';

  @override
  String get settingsAbout => 'परिचित के बारे में';

  @override
  String get syncLocal => 'इसी फ़ोन पर';

  @override
  String get syncSyncing => 'सिंक हो रहा है…';

  @override
  String get syncOffline => 'ऑफ़लाइन';

  @override
  String get syncError => 'सिंक में समस्या';

  @override
  String get syncDone => 'सिंक हो गया';

  @override
  String syncPending(int count) {
    return '$count बाक़ी';
  }

  @override
  String get syncNotConfiguredTitle => 'क्लाउड सिंक सेट नहीं है';

  @override
  String get syncNotConfiguredBody =>
      'इस बिल्ड में Supabase प्रोजेक्ट नहीं जुड़ा है, इसलिए सब कुछ इसी फ़ोन पर रहता है। कॉपी रखने के लिए बैकअप और एक्सपोर्ट का उपयोग करें।';

  @override
  String get syncSignInTitle => 'क्लाउड बैकअप चालू करें';

  @override
  String get syncSignInBody =>
      'बैकअप और फ़ोनों के बीच सिंक के लिए ईमेल से साइन इन करें। हम आपको 6 अंकों का कोड भेजेंगे।';

  @override
  String get syncSendCode => 'कोड भेजें';

  @override
  String get syncCode => '6 अंकों का कोड';

  @override
  String get syncVerify => 'जाँचें और साइन इन करें';

  @override
  String get syncAccount => 'खाता';

  @override
  String get syncSignOut => 'साइन आउट';

  @override
  String get syncStatus => 'स्थिति';

  @override
  String get syncNow => 'अभी सिंक करें';

  @override
  String syncPendingChanges(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count बदलाव अपलोड होने बाक़ी हैं।',
      one: '1 बदलाव अपलोड होना बाक़ी है।',
      zero: 'सब कुछ अपलोड हो गया है।',
    );
    return '$_temp0';
  }

  @override
  String syncLastSynced(String time) {
    return 'पिछला सिंक: $time';
  }

  @override
  String get syncOfflineBody => 'इंटरनेट नहीं है — बदलाव सहेजे गए हैं और अपने-आप अपलोड हो जाएँगे।';

  @override
  String syncIssues(int count) {
    return 'अपलोड नहीं हो सके ($count)';
  }

  @override
  String get backupTitle => 'बैकअप और एक्सपोर्ट';

  @override
  String get backupEncrypted => 'एन्क्रिप्टेड बैकअप';

  @override
  String get backupCreate => 'बैकअप फ़ाइल बनाएँ';

  @override
  String get backupCreateBody => 'सब कुछ, आपके पासफ़्रेज़ से एन्क्रिप्टेड। ड्राइव में सहेजें या स्वयं को भेजें।';

  @override
  String get backupRestore => 'बैकअप से वापस लाएँ';

  @override
  String get backupRestoreBody => 'हर रिकॉर्ड का नया संस्करण रखा जाता है।';

  @override
  String backupRestored(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count रिकॉर्ड वापस लाए गए।',
      one: '1 रिकॉर्ड वापस लाया गया।',
      zero: 'वापस लाने को कुछ नया नहीं।',
    );
    return '$_temp0';
  }

  @override
  String get backupPassphrase => 'पासफ़्रेज़';

  @override
  String get backupPassphraseRepeat => 'पासफ़्रेज़ दोबारा लिखें';

  @override
  String get backupPassphraseHelp =>
      'एक पासफ़्रेज़ चुनें (कम से कम 6 अक्षर)। इसके बिना बैकअप नहीं खुलेगा — इसे लिखकर रखें।';

  @override
  String get backupPassphraseEnter => 'इस बैकअप का पासफ़्रेज़ लिखें।';

  @override
  String get backupPassphraseTooShort => 'पासफ़्रेज़ में कम से कम 6 अक्षर होने चाहिए।';

  @override
  String get backupPassphraseMismatch => 'दोनों पासफ़्रेज़ मेल नहीं खाते।';

  @override
  String get backupWrongPassphrase => 'पासफ़्रेज़ ग़लत है, या यह परिचित बैकअप नहीं है।';

  @override
  String get exportTitle => 'एक्सपोर्ट';

  @override
  String get exportCsv => 'लोग (CSV / Excel)';

  @override
  String get exportCsvBody => 'सभी लोगों की सूची — फ़ोन, गाँव और रिश्तों सहित।';

  @override
  String get exportGedcom => 'वंश वृक्ष (GEDCOM)';

  @override
  String get exportGedcomBody => 'अपना वृक्ष Ancestry, MyHeritage, FamilySearch या Gramps में खोलें।';

  @override
  String get duplicatesTitle => 'दोहराए गए लोग';

  @override
  String get duplicatesNone => 'कोई दोहराव नहीं मिला।';

  @override
  String get duplicatesNotSame => 'ये अलग हैं';

  @override
  String get mergeAction => 'मिलाएँ';

  @override
  String get mergeKeepWhich => 'किसकी जानकारी रखें?';

  @override
  String mergeDone(String merged, String survivor) {
    return '$merged को $survivor में मिलाया गया';
  }

  @override
  String get trashTitle => 'ट्रैश';

  @override
  String get trashEmpty => 'ट्रैश ख़ाली है।';
}
