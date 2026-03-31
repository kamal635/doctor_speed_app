import 'failure.dart';
import 'failure_code.dart';

String resolveFailureMessage(Failure failure) {
  if (failure.userMessage != null && failure.userMessage!.trim().isNotEmpty) {
    return failure.userMessage!;
  }

  switch (failure.code) {
    case FailureCode.network:
      return 'Please check your internet connection and try again.';
    case FailureCode.timeout:
      return 'The request took too long. Please try again.';
    case FailureCode.unauthorized:
      return 'You need to sign in again to continue.';
    case FailureCode.forbidden:
      return 'You do not have permission to perform this action.';
    case FailureCode.validation:
      return 'Please check your input and try again.';
    case FailureCode.notFound:
      return 'The requested resource could not be found.';
    case FailureCode.conflict:
      return 'This action could not be completed due to a data conflict.';
    case FailureCode.rateLimited:
      return 'Too many attempts. Please try again later.';
    case FailureCode.server:
      return 'Something went wrong on the server. Please try again later.';
    case FailureCode.unknown:
      return 'Something went wrong. Please try again.';
  }
}
