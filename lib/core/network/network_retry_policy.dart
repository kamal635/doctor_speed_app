import 'package:dio/dio.dart';

abstract final class NetworkRetryPolicy {
  static const int maxRetries = 2;

  static const List<Duration> retryDelays = <Duration>[
    Duration(milliseconds: 500),
    Duration(seconds: 1),
  ];

  static const Set<int> retryableStatusCodes = <int>{
    408,
    429,
    500,
    502,
    503,
    504,
  };

  static const String disableRetryKey = 'disable_retry';

  static bool shouldRetryDioException(DioException error) {
    if (_isRetryDisabled(error.requestOptions)) {
      return false;
    }

    if (_isTimeout(error)) {
      return true;
    }

    if (_isConnectionIssue(error)) {
      return true;
    }

    final statusCode = error.response?.statusCode;
    if (statusCode != null && retryableStatusCodes.contains(statusCode)) {
      return true;
    }

    return false;
  }

  static bool _isRetryDisabled(RequestOptions options) {
    return options.extra[disableRetryKey] == true;
  }

  static bool _isTimeout(DioException error) {
    return error.type == DioExceptionType.connectionTimeout ||
        error.type == DioExceptionType.sendTimeout ||
        error.type == DioExceptionType.receiveTimeout;
  }

  static bool _isConnectionIssue(DioException error) {
    return error.type == DioExceptionType.connectionError ||
        error.type == DioExceptionType.unknown;
  }
}
