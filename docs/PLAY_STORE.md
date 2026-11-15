# Publishing Parichit on Google Play

Everything on the code side is ready: release signing, the app icon, account deletion, the privacy policy, store graphics
and a GitHub workflow that builds the signed bundle. This guide lists what **you** need to do, in order.

| Ready in the repo | Where |
|---|---|
| Release signing (upload key from `android/key.properties` or CI secrets) | `android/app/build.gradle.kts` |
| Signed `.aab` build on GitHub (release builds are blocked on this PC by Smart App Control) | `.github/workflows/release.yml` |
| App icon (adaptive + themed + legacy) | `android/app/src/main/res/` |
| Play icon 512×512 and feature graphic 1024×500 | `store/` (regenerate: `tool/generate_brand_assets.ps1`) |
| In-app account deletion + "erase this phone" | More → Cloud backup / Your data |
| Account-deletion database function | `supabase/migrations/20261115000000_delete_my_account.sql` |
| Privacy policy | `docs/privacy-policy.md` |
| Store listing text, Data safety and content-rating answers | this file, below |

---

## 0. Decide first: who is the app for?

Your original requirement was "only me". Publishing publicly means **anyone can install it and create an account in your
Supabase project**. That works (row-level security keeps every account's data separate), but you then operate a service
for other people. Two options:

- **Just you and family** → keep it in a **closed testing** track (up to ~100 invited testers) and never go to production.
  No public listing; testers install from a private Play link. Simplest.
- **Public** → do everything below, plus the Supabase steps in section 6 (custom email sender, paid plan).

The application ID is **`app.parichit.parichit`**. It can never change after the first upload. If you want a different
one (for example `com.yourname.parichit`), tell me **before** uploading.

## 1. Create the upload key (once, ~5 min)

In PowerShell (Java is already installed):

```powershell
mkdir $HOME\keys
keytool -genkeypair -v -keystore $HOME\keys\parichit-upload.jks -alias upload -keyalg RSA -keysize 2048 -validity 10000
```

Choose a strong password and answer the name questions. **Back up the `.jks` file and the password** (for example in a
password manager). With Play App Signing (step 4) a lost upload key can be reset through Google support, but it is slow.

Never commit the `.jks` file. `android/.gitignore` already ignores it and `key.properties`.

## 2. Put the key into GitHub (once)

Repository → **Settings → Secrets and variables → Actions → New repository secret**, four secrets:

| Secret | Value |
|---|---|
| `ANDROID_KEYSTORE_BASE64` | output of `[Convert]::ToBase64String([IO.File]::ReadAllBytes("$HOME\keys\parichit-upload.jks")) \| Set-Clipboard` (it copies to the clipboard) |
| `ANDROID_KEYSTORE_PASSWORD` | the keystore password |
| `ANDROID_KEY_ALIAS` | `upload` |
| `ANDROID_KEY_PASSWORD` | the key password (same as the keystore password unless you chose another) |

## 3. Build the bundle

GitHub → **Actions → Release (Play Store bundle) → Run workflow**. After ~10 minutes, download the artifact
`parichit-release-…`; it contains `app-release.aab` (upload this) and `symbols/` (keep for decoding crash reports).

Before every later upload, raise the version in `pubspec.yaml`: `version: 1.0.1+2`. The number after `+` (versionCode)
must always increase.

## 4. Google Play Console

1. Create a developer account at https://play.google.com/console (one-time US$25, identity verification).
   **New personal accounts must run a closed test with at least 12 testers opted in for 14 days in a row before they can
   publish to production.** Start that test early.
2. **Create app** → name `Parichit`, default language English (or Hindi), type *App*, *Free*.
3. **Set up your app** (Dashboard checklist):
   - **Privacy policy URL:** `https://github.com/MukeshKumarBagaria/parichit/blob/main/docs/privacy-policy.md`
     (first replace `[YOUR CONTACT EMAIL]` in that file; the repository must stay public, or host the page elsewhere).
   - **App access:** "All functionality is available without special access", and add a note: *Cloud backup is optional;
     sign-in uses a one-time code sent to any e-mail address.*
   - **Ads:** No ads.
   - **Content rating:** see section 5.
   - **Target audience:** 18 and over (keeps the app outside the Families policy).
   - **News app / Government app / Financial / Health:** No.
   - **Data safety:** see section 5.
   - **Delete account URL:** the privacy-policy URL above (it explains in-app deletion and the e-mail fallback).
4. **Store listing:** text from section 5; graphics from `store/`; at least **2 phone screenshots** (take them on your
   phone or the emulator: power + volume-down; 1080×2400 is fine). Category: **Lifestyle**. Add a **Hindi (hi-IN)**
   translation with the Hindi text below.
5. **Testing → Closed testing → Create track → Create release:** accept **Play App Signing**, upload `app-release.aab`,
   add tester e-mails, roll out. Testers join through the opt-in link.
6. After the 14-day test (personal accounts), apply for **Production** access and promote the release.

## 5. Text for the forms

### Store listing (English)

**App name (≤30):** `Parichit – Family & People`

**Short description (≤80):**
`Your family tree and everyone you know — private, offline, in Hindi & English.`

**Full description:**

```
Parichit keeps your family tree and everyone you know in one private place — and it works even without internet.

FAMILY THAT CONNECTS ITSELF
• Add parents, children, spouses and siblings in a few taps.
• Add long relations directly — Chacha, Mama, Bua, Sasur, Jeth, Devar, Samdhi and more.
• Parichit works out how everyone is related to you, in Hindi and English (ताऊ, मामी, ममेरा भाई…).
• When two families meet through a marriage, they connect automatically.
• Relationship finder: see exactly how any two people are connected.
• Family tree explorer with ancestors, descendants and siblings.

PEOPLE YOU MEET
• Save someone in seconds: name, phone, village and a note.
• Log meetings with several people, with place, notes and follow-up reminders.
• Birthdays, anniversaries and barsi reminders.
• Tags, favourites, and a "haven't met in a while" list.
• Search in Hindi or English — "Ramesh" also finds "रमेश".

PRIVATE BY DESIGN
• Data is stored on your phone in an encrypted database.
• App lock with fingerprint, face or PIN.
• Optional cloud backup and sync across phones — delete your account any time.
• Encrypted backup files, plus CSV and GEDCOM (family-tree) export.
• No ads. No tracking.
```

### Store listing (Hindi, hi-IN)

**नाम:** `परिचित – परिवार और लोग`

**संक्षिप्त विवरण:** `आपका वंश वृक्ष और जान-पहचान के सभी लोग — निजी, ऑफ़लाइन, हिंदी और अंग्रेज़ी में।`

**पूरा विवरण:**

```
परिचित आपका वंश वृक्ष और जान-पहचान के सभी लोग एक निजी जगह पर रखता है — बिना इंटरनेट के भी।

अपने-आप जुड़ता परिवार
• माता-पिता, संतान, जीवनसाथी और भाई-बहन कुछ ही टैप में जोड़ें।
• लंबे रिश्ते सीधे जोड़ें — चाचा, मामा, बुआ, ससुर, जेठ, देवर, समधी और भी।
• परिचित बताता है कि हर व्यक्ति आपका क्या लगता है — हिंदी और अंग्रेज़ी में।
• शादी से दो परिवार मिलते हैं तो वे अपने-आप जुड़ जाते हैं।
• रिश्ता खोजक: कोई भी दो लोग आपस में कैसे जुड़े हैं, देखें।
• पूर्वज, वंशज और भाई-बहन सहित वंश वृक्ष।

जिनसे आप मिलते हैं
• नाम, फ़ोन, गाँव और नोट के साथ किसी को सेकंडों में सहेजें।
• कई लोगों के साथ मुलाक़ात, स्थान, नोट्स और फ़ॉलो-अप रिमाइंडर लिखें।
• जन्मदिन, विवाह वर्षगाँठ और बरसी की याद।
• टैग, पसंदीदा और "काफ़ी समय से नहीं मिले" सूची।
• हिंदी या अंग्रेज़ी में खोजें — "Ramesh" लिखने पर "रमेश" भी मिलेगा।

पूरी तरह निजी
• डेटा आपके फ़ोन पर एन्क्रिप्टेड रूप में रहता है।
• फ़िंगरप्रिंट, चेहरे या पिन से ऐप लॉक।
• वैकल्पिक क्लाउड बैकअप और फ़ोनों के बीच सिंक — खाता कभी भी हटाएँ।
• एन्क्रिप्टेड बैकअप फ़ाइल, CSV और GEDCOM एक्सपोर्ट।
• कोई विज्ञापन नहीं। कोई ट्रैकिंग नहीं।
```

### Data safety form

- **Does your app collect or share user data?** Yes (only when the user turns on cloud backup).
- **Is all user data encrypted in transit?** Yes.
- **Do you provide a way for users to request that their data is deleted?** Yes (in-app, and by e-mail).
- **Data types collected** — for each: *Collected* (not shared), *Optional*, purposes **App functionality** and
  **Account management**, *not processed ephemerally*:
  - Personal info → **Name**, **Email address** (sign-in), **Phone number**, **Address** (villages/places the user types),
    **Other info** (relationships, gotra, notes).
  - App activity → **Other user-generated content** (meeting notes).
- **Not collected:** location, contacts, photos, health, financial, messages, device IDs, analytics, crash data.
- **Shared with third parties:** No (Supabase is a service provider, which Play does not count as sharing).

### Content rating questionnaire (IARC)

Category **"All other app types"**. Answer **No** to violence, sexuality, language, controlled substances, gambling. For
user interaction: users **cannot** communicate or share content with other users; no location sharing; no purchases.
The expected rating is **Everyone / 3+**.

## 6. Supabase settings for real users

1. **Run the new migration**: SQL Editor → paste `supabase/migrations/20261115000000_delete_my_account.sql` → Run.
   (Account deletion in the app needs it.)
2. **Auth → Email templates → Magic Link:** must contain `{{ .Token }}` (the app asks for the 6-digit code).
3. **Sign-ups:** keep **enabled** if anyone but you will use the app (the README's "turn off sign-ups" tip is only for a
   private, single-person setup).
4. **Custom SMTP (needed for other users):** Supabase's built-in e-mail sender only delivers to your project's team
   members and is heavily rate-limited. Under **Auth → SMTP settings**, connect a provider (Resend, Brevo, SendGrid,
   Amazon SES…).
5. **Plan:** free projects pause after about a week without activity and have no automatic backups. For real users,
   use the Pro plan.

## 7. Before each update

1. Bump `version:` in `pubspec.yaml` (for example `1.0.1+2`).
2. Run the **Release** workflow and download the `.aab`.
3. Play Console → your track → **Create new release** → upload → roll out.
