import 'package:doctor_speed_app/l10n/generated/app_localizations.dart';

import '../errors/failure.dart';
import '../errors/failure_code.dart';
import '../errors/failure_user_message_mapper.dart';

extension FailureX on Failure {
  String? displayMessage(AppLocalizations l10n) =>
      resolveFailureMessage(this, l10n);

  bool get isConnectivityFailure =>
      code == FailureCode.network || code == FailureCode.timeout;

  bool get isCancellationFailure => code == FailureCode.cancelled;
}
