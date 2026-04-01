import '../errors/failure.dart';
import '../errors/failure_code.dart';
import '../errors/failure_user_message_mapper.dart';

extension FailureX on Failure {
  String get displayMessage => resolveFailureMessage(this);

  bool get isConnectivityFailure =>
      code == FailureCode.network || code == FailureCode.timeout;
}
