import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class NetworkLoggingInterceptor extends Interceptor {
  NetworkLoggingInterceptor({this.enabled = true});

  final bool enabled;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (enabled) {
      debugPrint('[REQ] ${options.method} ${options.uri}');

      if (options.queryParameters.isNotEmpty) {
        debugPrint('[REQ QUERY] ${options.queryParameters}');
      }

      if (options.data != null) {
        debugPrint('[REQ BODY] ${options.data}');
      }

      debugPrint('[REQ HEADERS] ${options.headers}');
    }

    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (enabled) {
      debugPrint(
        '[RES] ${response.requestOptions.method} ${response.requestOptions.uri}',
      );
      debugPrint('[RES STATUS] ${response.statusCode}');
      debugPrint('[RES DATA] ${response.data}');
    }

    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    if (enabled) {
      debugPrint(
        '[ERR] ${err.requestOptions.method} ${err.requestOptions.uri}',
      );
      debugPrint('[ERR TYPE] ${err.type}');
      debugPrint('[ERR MESSAGE] ${err.message}');

      if (err.response != null) {
        debugPrint('[ERR STATUS] ${err.response?.statusCode}');
        debugPrint('[ERR DATA] ${err.response?.data}');
      }
    }

    handler.next(err);
  }
}
