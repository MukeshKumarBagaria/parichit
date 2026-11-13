import 'package:flutter/widgets.dart';

import '../../l10n/generated/app_localizations.dart';

export '../../l10n/generated/app_localizations.dart';

extension L10nX on BuildContext {
  /// Shorthand: `context.l10n.navHome`.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
