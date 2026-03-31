import 'failure_code.dart';

class Failure implements Exception {
  const Failure({
    required this.code,
    this.message,
    this.userMessage,
    this.cause,
    this.stackTrace,
  });

  final FailureCode code;

  /// Internal/raw/debug message.
  final String? message;

  /// Safe message that can be shown directly to the user.
  final String? userMessage;

  final Object? cause;
  final StackTrace? stackTrace;

  @override
  String toString() {
    return 'Failure(code: $code, message: $message, userMessage: $userMessage, cause: $cause)';
  }

  Failure copyWith({
    FailureCode? code,
    String? message,
    String? userMessage,
    Object? cause,
    StackTrace? stackTrace,
  }) {
    return Failure(
      code: code ?? this.code,
      message: message ?? this.message,
      userMessage: userMessage ?? this.userMessage,
      cause: cause ?? this.cause,
      stackTrace: stackTrace ?? this.stackTrace,
    );
  }
}
