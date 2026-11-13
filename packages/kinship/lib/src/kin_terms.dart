/// A named relation in both languages.
final class KinTerm {
  const KinTerm(this.en, this.hi, [this.roman]);

  /// English description, e.g. "Father's younger brother".
  final String en;

  /// Hindi (Devanagari), e.g. "चाचा".
  final String hi;

  /// Hindi term in Latin script for English-language UI, e.g. "Chacha".
  /// Null when the English word is the natural one (Father, Son …).
  final String? roman;
}

/// Bilingual kinship dictionary keyed by path key (see `KinPath.key`).
/// Exact keys (with e/y seniority) are tried first, then plain keys.
const kinTerms = <String, KinTerm>{
  // ----------------------------------------------------------- direct
  'F': KinTerm('Father', 'पिता', 'Pitaji'),
  'M': KinTerm('Mother', 'माता', 'Mataji'),
  'P': KinTerm('Parent', 'माता/पिता'),
  'S': KinTerm('Son', 'बेटा', 'Beta'),
  'D': KinTerm('Daughter', 'बेटी', 'Beti'),
  'C': KinTerm('Child', 'संतान'),
  'H': KinTerm('Husband', 'पति', 'Pati'),
  'W': KinTerm('Wife', 'पत्नी', 'Patni'),
  'Sp': KinTerm('Spouse', 'जीवनसाथी'),
  'B': KinTerm('Brother', 'भाई', 'Bhai'),
  'eB': KinTerm('Elder brother', 'बड़े भैया', 'Bhaiya'),
  'yB': KinTerm('Younger brother', 'छोटा भाई', 'Chhota bhai'),
  'Z': KinTerm('Sister', 'बहन', 'Behen'),
  'eZ': KinTerm('Elder sister', 'दीदी', 'Didi'),
  'yZ': KinTerm('Younger sister', 'छोटी बहन', 'Chhoti behen'),
  'Sb': KinTerm('Sibling', 'भाई-बहन'),

  // ----------------------------------------------- grandparents & up
  'F.F': KinTerm('Paternal grandfather', 'दादा', 'Dada'),
  'F.M': KinTerm('Paternal grandmother', 'दादी', 'Dadi'),
  'M.F': KinTerm('Maternal grandfather', 'नाना', 'Nana'),
  'M.M': KinTerm('Maternal grandmother', 'नानी', 'Nani'),
  'F.F.F': KinTerm('Paternal great-grandfather', 'परदादा', 'Pardada'),
  'F.F.M': KinTerm('Paternal great-grandmother', 'परदादी', 'Pardadi'),
  'M.F.F': KinTerm('Maternal great-grandfather', 'परनाना', 'Parnana'),
  'M.F.M': KinTerm('Maternal great-grandmother', 'परनानी', 'Parnani'),
  'F.F.B': KinTerm("Grandfather's brother", 'दादा', 'Dada'),
  'F.F.B.W': KinTerm("Grandfather's brother's wife", 'दादी', 'Dadi'),
  'F.F.Z': KinTerm("Grandfather's sister", 'बुआ दादी', 'Bua dadi'),
  'M.F.B': KinTerm("Maternal grandfather's brother", 'नाना', 'Nana'),
  'M.F.B.W': KinTerm("Maternal grandfather's brother's wife", 'नानी', 'Nani'),

  // --------------------------------------------- children's children
  'S.S': KinTerm("Grandson (son's son)", 'पोता', 'Pota'),
  'S.D': KinTerm("Granddaughter (son's daughter)", 'पोती', 'Poti'),
  'D.S': KinTerm("Grandson (daughter's son)", 'नाती', 'Nati'),
  'D.D': KinTerm("Granddaughter (daughter's daughter)", 'नातिन', 'Natin'),
  'S.S.S': KinTerm('Great-grandson', 'परपोता', 'Parpota'),
  'S.S.D': KinTerm('Great-granddaughter', 'परपोती', 'Parpoti'),
  'S.S.W': KinTerm("Grandson's wife", 'पोत बहू', 'Pot bahu'),
  'D.S.W': KinTerm("Daughter's son's wife", 'नात बहू', 'Nat bahu'),

  // ----------------------------------------- father's side (paternal)
  'F.eB': KinTerm("Father's elder brother", 'ताऊ', 'Tau'),
  'F.eB.W': KinTerm("Father's elder brother's wife", 'ताई', 'Tai'),
  'F.yB': KinTerm("Father's younger brother", 'चाचा', 'Chacha'),
  'F.yB.W': KinTerm("Father's younger brother's wife", 'चाची', 'Chachi'),
  'F.B': KinTerm("Father's brother", 'चाचा / ताऊ', 'Chacha / Tau'),
  'F.B.W': KinTerm("Father's brother's wife", 'चाची / ताई', 'Chachi / Tai'),
  'F.Z': KinTerm("Father's sister", 'बुआ', 'Bua'),
  'F.Z.H': KinTerm("Father's sister's husband", 'फूफा', 'Phupha'),
  'F.B.S': KinTerm('Cousin (paternal uncle’s son)', 'चचेरा भाई', 'Chachera bhai'),
  'F.B.D': KinTerm('Cousin (paternal uncle’s daughter)', 'चचेरी बहन', 'Chacheri behen'),
  'F.Z.S': KinTerm('Cousin (paternal aunt’s son)', 'फुफेरा भाई', 'Phuphera bhai'),
  'F.Z.D': KinTerm('Cousin (paternal aunt’s daughter)', 'फुफेरी बहन', 'Phupheri behen'),
  'F.B.S.W': KinTerm("Cousin's wife", 'भाभी', 'Bhabhi'),
  'F.B.D.H': KinTerm("Cousin's husband", 'जीजा', 'Jija'),

  // ----------------------------------------- mother's side (maternal)
  'M.B': KinTerm("Mother's brother", 'मामा', 'Mama'),
  'M.B.W': KinTerm("Mother's brother's wife", 'मामी', 'Mami'),
  'M.Z': KinTerm("Mother's sister", 'मौसी', 'Mausi'),
  'M.Z.H': KinTerm("Mother's sister's husband", 'मौसा', 'Mausa'),
  'M.B.S': KinTerm('Cousin (maternal uncle’s son)', 'ममेरा भाई', 'Mamera bhai'),
  'M.B.D': KinTerm('Cousin (maternal uncle’s daughter)', 'ममेरी बहन', 'Mameri behen'),
  'M.Z.S': KinTerm('Cousin (maternal aunt’s son)', 'मौसेरा भाई', 'Mausera bhai'),
  'M.Z.D': KinTerm('Cousin (maternal aunt’s daughter)', 'मौसेरी बहन', 'Mauseri behen'),

  // --------------------------------------------- nieces & nephews
  'B.S': KinTerm("Brother's son", 'भतीजा', 'Bhatija'),
  'B.D': KinTerm("Brother's daughter", 'भतीजी', 'Bhatiji'),
  'Z.S': KinTerm("Sister's son", 'भांजा', 'Bhanja'),
  'Z.D': KinTerm("Sister's daughter", 'भांजी', 'Bhanji'),
  'B.S.W': KinTerm("Nephew's wife", 'भतीज बहू', 'Bhatij bahu'),
  'Z.S.W': KinTerm("Nephew's wife", 'भांज बहू', 'Bhanj bahu'),
  'B.D.H': KinTerm("Niece's husband", 'भतीज दामाद', 'Bhatij damad'),
  'Z.D.H': KinTerm("Niece's husband", 'भांज दामाद', 'Bhanj damad'),
  'B.S.S': KinTerm("Brother's grandson", 'पोता', 'Pota'),
  'B.S.D': KinTerm("Brother's granddaughter", 'पोती', 'Poti'),

  // --------------------------------------------- siblings' spouses
  'B.W': KinTerm("Brother's wife", 'भाभी', 'Bhabhi'),
  'Z.H': KinTerm("Sister's husband", 'बहनोई', 'Behnoi'),
  'eZ.H': KinTerm("Elder sister's husband", 'जीजा', 'Jija'),

  // --------------------------------------------- children's spouses
  'S.W': KinTerm('Daughter-in-law', 'बहू', 'Bahu'),
  'D.H': KinTerm('Son-in-law', 'दामाद', 'Damad'),
  'S.W.F': KinTerm("Son's father-in-law", 'समधी', 'Samdhi'),
  'S.W.M': KinTerm("Son's mother-in-law", 'समधन', 'Samdhan'),
  'D.H.F': KinTerm("Daughter's father-in-law", 'समधी', 'Samdhi'),
  'D.H.M': KinTerm("Daughter's mother-in-law", 'समधन', 'Samdhan'),

  // ------------------------------------------------- spouse's family
  'W.F': KinTerm('Father-in-law', 'ससुर', 'Sasur'),
  'W.M': KinTerm('Mother-in-law', 'सास', 'Saas'),
  'H.F': KinTerm('Father-in-law', 'ससुर', 'Sasur'),
  'H.M': KinTerm('Mother-in-law', 'सास', 'Saas'),
  'Sp.F': KinTerm('Father-in-law', 'ससुर', 'Sasur'),
  'Sp.M': KinTerm('Mother-in-law', 'सास', 'Saas'),
  'W.B': KinTerm("Wife's brother", 'साला', 'Sala'),
  'W.B.W': KinTerm("Wife's brother's wife", 'सलहज', 'Salhaj'),
  'W.Z': KinTerm("Wife's sister", 'साली', 'Saali'),
  'W.Z.H': KinTerm("Wife's sister's husband", 'साढ़ू', 'Saadhu'),
  'W.F.F': KinTerm("Wife's grandfather", 'ददिया ससुर', 'Dadiya sasur'),
  'W.F.M': KinTerm("Wife's grandmother", 'ददिया सास', 'Dadiya saas'),
  'H.F.F': KinTerm("Husband's grandfather", 'ददिया ससुर', 'Dadiya sasur'),
  'H.F.M': KinTerm("Husband's grandmother", 'ददिया सास', 'Dadiya saas'),
  'H.eB': KinTerm("Husband's elder brother", 'जेठ', 'Jeth'),
  'H.eB.W': KinTerm("Husband's elder brother's wife", 'जेठानी', 'Jethani'),
  'H.yB': KinTerm("Husband's younger brother", 'देवर', 'Devar'),
  'H.yB.W': KinTerm("Husband's younger brother's wife", 'देवरानी', 'Devrani'),
  'H.B': KinTerm("Husband's brother", 'जेठ / देवर', 'Jeth / Devar'),
  'H.B.W': KinTerm("Husband's brother's wife", 'जेठानी / देवरानी', 'Jethani / Devrani'),
  'H.Z': KinTerm("Husband's sister", 'ननद', 'Nanad'),
  'H.Z.H': KinTerm("Husband's sister's husband", 'ननदोई', 'Nandoi'),
  'W.B.S': KinTerm("Wife's brother's son", 'साले का बेटा'),
  'H.B.S': KinTerm("Husband's brother's son", 'भतीजा', 'Bhatija'),
  'H.B.D': KinTerm("Husband's brother's daughter", 'भतीजी', 'Bhatiji'),
  'H.Z.S': KinTerm("Husband's sister's son", 'भांजा', 'Bhanja'),
  'H.Z.D': KinTerm("Husband's sister's daughter", 'भांजी', 'Bhanji'),
  'W.Z.S': KinTerm("Wife's sister's son", 'भांजा', 'Bhanja'),
  'W.Z.D': KinTerm("Wife's sister's daughter", 'भांजी', 'Bhanji'),

  // -------------------------------------------------------- step
  'F.W': KinTerm('Stepmother', 'सौतेली माँ', 'Sauteli maa'),
  'M.H': KinTerm('Stepfather', 'सौतेले पिता', 'Sautele pita'),
  'F.W.S': KinTerm('Stepbrother', 'सौतेला भाई', 'Sautela bhai'),
  'F.W.D': KinTerm('Stepsister', 'सौतेली बहन', 'Sauteli behen'),
  'M.H.S': KinTerm('Stepbrother', 'सौतेला भाई', 'Sautela bhai'),
  'M.H.D': KinTerm('Stepsister', 'सौतेली बहन', 'Sauteli behen'),
  'W.S': KinTerm('Stepson', 'सौतेला बेटा', 'Sautela beta'),
  'W.D': KinTerm('Stepdaughter', 'सौतेली बेटी', 'Sauteli beti'),
  'H.S': KinTerm('Stepson', 'सौतेला बेटा', 'Sautela beta'),
  'H.D': KinTerm('Stepdaughter', 'सौतेली बेटी', 'Sauteli beti'),

  // ------------------------------------------------------- social
  '~friend': KinTerm('Friend', 'मित्र', 'Mitra'),
  '~colleague': KinTerm('Colleague', 'सहकर्मी'),
  '~business': KinTerm('Business contact', 'व्यापारिक संपर्क'),
  '~neighbour': KinTerm('Neighbour', 'पड़ोसी', 'Padosi'),
  '~classmate': KinTerm('Classmate', 'सहपाठी'),
  '~teacher': KinTerm('Teacher', 'शिक्षक', 'Guruji'),
  '~mentor': KinTerm('Mentor', 'मार्गदर्शक'),
  '~introduced': KinTerm('Introduced', 'परिचय से जुड़े'),
  '~political': KinTerm('Political contact', 'राजनीतिक संपर्क'),
  '~community': KinTerm('Community contact', 'समाज के संपर्क'),
  '~other': KinTerm('Acquaintance', 'परिचित', 'Parichit'),
};

/// Hindi noun for one step, with grammatical gender and the oblique form
/// used before a postposition (बेटा → बेटे की …).
final class HindiNoun {
  const HindiNoun(this.direct, {required this.feminine, String? oblique}) : oblique = oblique ?? direct;

  final String direct;
  final String oblique;
  final bool feminine;
}

/// English and Hindi nouns per token, used by the fallback describer.
const stepNounsEn = <String, String>{
  'F': 'father',
  'M': 'mother',
  'P': 'parent',
  'S': 'son',
  'D': 'daughter',
  'C': 'child',
  'H': 'husband',
  'W': 'wife',
  'Sp': 'spouse',
  'B': 'brother',
  'eB': 'elder brother',
  'yB': 'younger brother',
  'Z': 'sister',
  'eZ': 'elder sister',
  'yZ': 'younger sister',
  'Sb': 'sibling',
};

const stepNounsHi = <String, HindiNoun>{
  'F': HindiNoun('पिता', feminine: false),
  'M': HindiNoun('माता', feminine: true),
  'P': HindiNoun('माता/पिता', feminine: false),
  'S': HindiNoun('बेटा', feminine: false, oblique: 'बेटे'),
  'D': HindiNoun('बेटी', feminine: true),
  'C': HindiNoun('संतान', feminine: true),
  'H': HindiNoun('पति', feminine: false),
  'W': HindiNoun('पत्नी', feminine: true),
  'Sp': HindiNoun('जीवनसाथी', feminine: false),
  'B': HindiNoun('भाई', feminine: false),
  'eB': HindiNoun('बड़ा भाई', feminine: false, oblique: 'बड़े भाई'),
  'yB': HindiNoun('छोटा भाई', feminine: false, oblique: 'छोटे भाई'),
  'Z': HindiNoun('बहन', feminine: true),
  'eZ': HindiNoun('बड़ी बहन', feminine: true),
  'yZ': HindiNoun('छोटी बहन', feminine: true),
  'Sb': HindiNoun('भाई-बहन', feminine: false),
};
