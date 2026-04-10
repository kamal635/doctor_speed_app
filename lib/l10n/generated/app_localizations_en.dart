// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get commonConfirm => 'Confirm';

  @override
  String get commonCancel => 'Cancel';

  @override
  String get commonDiscardChanges => 'Discard Changes';

  @override
  String get failureNetwork =>
      'Please check your internet connection and try again.';

  @override
  String get failureTimeout => 'The request took too long. Please try again.';

  @override
  String get failureUnauthorized => 'You need to sign in again to continue.';

  @override
  String get failureForbidden =>
      'You do not have permission to perform this action.';

  @override
  String get failureValidation => 'Please check your input and try again.';

  @override
  String get failureNotFound => 'The requested resource could not be found.';

  @override
  String get failureConflict =>
      'This action could not be completed due to a data conflict.';

  @override
  String get failureRateLimited => 'Too many attempts. Please try again later.';

  @override
  String get failureServer =>
      'Something went wrong on the server. Please try again later.';

  @override
  String get failureUnknown => 'Something went wrong. Please try again.';
}
