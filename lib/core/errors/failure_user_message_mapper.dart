import 'package:doctor_speed_app/l10n/generated/app_localizations.dart';

import 'failure.dart';
import 'failure_code.dart';

String? resolveFailureMessage(Failure failure, AppLocalizations l10n) {
  final userMessage = failure.userMessage?.trim();
  if (userMessage != null && userMessage.isNotEmpty) {
    return userMessage;
  }

  switch (failure.code) {
    case FailureCode.network:
      return l10n.failureNetwork;
    case FailureCode.timeout:
      return l10n.failureTimeout;
    case FailureCode.unauthorized:
      return l10n.failureUnauthorized;
    case FailureCode.forbidden:
      return l10n.failureForbidden;
    case FailureCode.validation:
      return l10n.failureValidation;
    case FailureCode.notFound:
      return l10n.failureNotFound;
    case FailureCode.conflict:
      return l10n.failureConflict;
    case FailureCode.rateLimited:
      return l10n.failureRateLimited;
    case FailureCode.server:
      return l10n.failureServer;
    case FailureCode.cancelled:
      return null;
    case FailureCode.unknown:
      return l10n.failureUnknown;
  }
}
