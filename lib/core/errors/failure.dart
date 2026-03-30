import 'failure_code.dart';

class Failure implements Exception {
  const Failure({
    required this.code,
    this.message,
    this.cause,
    this.stackTrace,
  });

  final FailureCode code;
  final String? message;
  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'Failure(code: $code, message: $message, cause: $cause)';
  }

  Failure copyWith({
    FailureCode? code,
    String? message,
    Object? cause,
    StackTrace? stackTrace,
  }) {
    return Failure(
      code: code ?? this.code,
      message: message ?? this.message,
      cause: cause ?? this.cause,
      stackTrace: stackTrace ?? this.stackTrace,
    );
  }
}
