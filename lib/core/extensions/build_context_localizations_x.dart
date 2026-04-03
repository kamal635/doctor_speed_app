import 'package:doctor_speed_app/l10n/generated/app_localizations.dart';
import 'package:flutter/widgets.dart';

extension BuildContextLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}
