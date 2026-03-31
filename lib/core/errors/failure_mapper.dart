import 'failure.dart';
import 'failure_code.dart';

Failure mapToFailure(Object error, [StackTrace? stackTrace]) {
  if (error is Failure) {
    return error.stackTrace == null && stackTrace != null
        ? error.copyWith(stackTrace: stackTrace)
        : error;
  }

  return Failure(
    code: FailureCode.unknown,
    message: error.toString(),
    cause: error,
    stackTrace: stackTrace,
  );
}
