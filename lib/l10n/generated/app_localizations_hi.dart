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
  String get fieldNotes => 'नोट्स';

  @override
  String get fieldNotesHint => 'कहाँ मिले, क्या बात हुई…';

  @override
  String get validationNameRequired => 'कृपया नाम लिखें';

  @override
  String get validationPhoneInvalid => 'कृपया सही फ़ोन नंबर लिखें';

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
  String get personFamilyComingSoon => 'रिश्तेदार जोड़ने की सुविधा अगले चरण में आएगी।';

  @override
  String get actionCall => 'कॉल';

  @override
  String get actionWhatsApp => 'व्हाट्सऐप';

  @override
  String get comingSoonTitle => 'जल्द आ रहा है';

  @override
  String get familyComingSoon => 'वंश वृक्ष और रिश्ता खोजक अगले चरण में बन रहे हैं।';

  @override
  String get meetingsComingSoon => 'मुलाक़ातों का इतिहास और रिमाइंडर यहाँ दिखेंगे।';

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
  String get settingsSync => 'क्लाउड बैकअप';

  @override
  String get syncLocalOnly => 'अभी केवल इसी फ़ोन पर सहेजा गया है। इस बिल्ड में क्लाउड बैकअप चालू नहीं है।';

  @override
  String get syncSignedOutBody =>
      'अपना पारिवारिक डेटा बैकअप करने और दूसरे फ़ोन पर इस्तेमाल करने के लिए साइन इन करें। ऐप ऑफ़लाइन भी चलता रहेगा।';

  @override
  String get syncSignInButton => 'बैकअप के लिए साइन इन करें';

  @override
  String syncSignedInAs(String email) {
    return '$email से साइन इन';
  }

  @override
  String get syncSignOut => 'साइन आउट';

  @override
  String get syncNow => 'अभी सिंक करें';

  @override
  String get syncStatusSynced => 'सिंक हो गया';

  @override
  String get syncStatusSyncing => 'सिंक हो रहा है…';

  @override
  String syncStatusPending(int count) {
    return '$count बदलाव सिंक के इंतज़ार में';
  }

  @override
  String get syncStatusOffline => 'ऑफ़लाइन';

  @override
  String get syncStatusError => 'सिंक में समस्या';

  @override
  String get syncStatusSignedOut => 'बैकअप नहीं हुआ';

  @override
  String syncLastSynced(String time) {
    return 'आख़िरी सिंक $time';
  }

  @override
  String get syncNeverSynced => 'अभी सिंक नहीं हुआ';

  @override
  String get syncIssuesTitle => 'सिंक समस्याएँ';

  @override
  String syncIssuesCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count बदलाव अस्वीकार हुए',
      one: '1 बदलाव अस्वीकार हुआ',
      zero: 'कोई सिंक समस्या नहीं',
    );
    return '$_temp0';
  }

  @override
  String get syncIssuesEmpty => 'कुछ ठीक करने की ज़रूरत नहीं। सभी बदलाव स्वीकार हो गए।';

  @override
  String get syncIssuesHelp =>
      'क्लाउड ने ये बदलाव स्वीकार नहीं किए। ये इसी फ़ोन पर सुरक्षित हैं; जाँचने के बाद इन्हें हटा दें।';

  @override
  String get syncDiscard => 'हटाएँ';

  @override
  String get signInTitle => 'साइन इन';

  @override
  String get signInBody => 'अपना ईमेल दर्ज करें। हम आपको साइन-इन कोड भेजेंगे।';

  @override
  String get signInEmailLabel => 'ईमेल';

  @override
  String get signInEmailInvalid => 'सही ईमेल पता दर्ज करें';

  @override
  String get signInSendCode => 'कोड भेजें';

  @override
  String signInCodeSent(String email) {
    return 'हमने $email पर कोड भेजा है।';
  }

  @override
  String get signInCodeLabel => 'ईमेल में आया कोड';

  @override
  String get signInCodeInvalid => 'ईमेल में आया कोड दर्ज करें';

  @override
  String get signInVerify => 'जाँचें और साइन इन करें';

  @override
  String get signInChangeEmail => 'दूसरा ईमेल इस्तेमाल करें';

  @override
  String signInFailed(String error) {
    return 'साइन इन नहीं हो सका: $error';
  }

  @override
  String get onboardingRestore => 'पहले से परिचित इस्तेमाल करते हैं? बहाल करने के लिए साइन इन करें';

  @override
  String get settingsAbout => 'परिचित के बारे में';
}
