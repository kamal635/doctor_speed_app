import 'dart:io';

import 'package:dio/dio.dart';

import '../errors/failure.dart';
import '../errors/failure_code.dart';

Failure mapNetworkException(Object error, [StackTrace? stackTrace]) {
  if (error is Failure) {
    return error;
  }

  if (error is DioException) {
    return _mapDioException(error, stackTrace);
  }

  return Failure(
    code: FailureCode.unknown,
    message: error.toString(),
    cause: error,
    stackTrace: stackTrace,
  );
}

Failure _mapDioException(DioException error, StackTrace? stackTrace) {
  final resolvedStackTrace = stackTrace ?? error.stackTrace;
  final responseMessage = _extractResponseMessage(error.response?.data);
  final requestPath = error.requestOptions.path;
  final statusCode = error.response?.statusCode;

  switch (error.type) {
    case DioExceptionType.connectionTimeout:
    case DioExceptionType.sendTimeout:
    case DioExceptionType.receiveTimeout:
      return Failure(
        code: FailureCode.timeout,
        message: responseMessage ?? 'Request timeout: $requestPath',
        cause: error,
        stackTrace: resolvedStackTrace,
      );

    case DioExceptionType.connectionError:
      return Failure(
        code: FailureCode.network,
        message: responseMessage ?? 'Connection error: $requestPath',
        cause: error,
        stackTrace: resolvedStackTrace,
      );

    case DioExceptionType.badCertificate:
      return Failure(
        code: FailureCode.network,
        message: responseMessage ?? 'Bad certificate: $requestPath',
        cause: error,
        stackTrace: resolvedStackTrace,
      );

    case DioExceptionType.cancel:
      return Failure(
        code: FailureCode.unknown,
        message: 'Request cancelled: $requestPath',
        cause: error,
        stackTrace: resolvedStackTrace,
      );

    case DioExceptionType.badResponse:
      return Failure(
        code: _mapStatusCodeToFailureCode(statusCode),
        message: responseMessage ?? _buildHttpMessage(statusCode, requestPath),
        cause: error,
        stackTrace: resolvedStackTrace,
      );

    case DioExceptionType.unknown:
      return Failure(
        code: _mapUnknownDioError(error.error),
        message: responseMessage ?? error.message ?? error.toString(),
        cause: error,
        stackTrace: resolvedStackTrace,
      );
  }
}

FailureCode _mapStatusCodeToFailureCode(int? statusCode) {
  if (statusCode == null) {
    return FailureCode.unknown;
  }

  switch (statusCode) {
    case 400:
    case 422:
      return FailureCode.validation;
    case 401:
      return FailureCode.unauthorized;
    case 403:
      return FailureCode.forbidden;
    case 404:
      return FailureCode.notFound;
    case 408:
      return FailureCode.timeout;
    case 409:
      return FailureCode.conflict;
    case 429:
      return FailureCode.rateLimited;
  }

  if (statusCode >= 500 && statusCode <= 599) {
    return FailureCode.server;
  }

  return FailureCode.unknown;
}

FailureCode _mapUnknownDioError(Object? error) {
  if (error is SocketException) {
    return FailureCode.network;
  }

  if (error is HandshakeException) {
    return FailureCode.network;
  }

  if (error is TlsException) {
    return FailureCode.network;
  }

  return FailureCode.unknown;
}

String _buildHttpMessage(int? statusCode, String path) {
  if (statusCode == null) {
    return 'HTTP error: $path';
  }

  return 'HTTP $statusCode: $path';
}

String? _extractResponseMessage(Object? data) {
  if (data == null) {
    return null;
  }

  if (data is String) {
    final value = data.trim();
    return value.isEmpty ? null : value;
  }

  if (data is Map<String, dynamic>) {
    final message = data['message'];
    if (message is String && message.trim().isNotEmpty) {
      return message.trim();
    }

    final error = data['error'];
    if (error is String && error.trim().isNotEmpty) {
      return error.trim();
    }
  }

  return null;
}
