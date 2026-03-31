import 'package:dio/dio.dart';

import '../api_constants.dart';
import '../token_provider.dart';

class AuthTokenInterceptor extends Interceptor {
  AuthTokenInterceptor({required TokenProvider tokenProvider})
    : _tokenProvider = tokenProvider;

  final TokenProvider _tokenProvider;

  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = await _tokenProvider.getAccessToken();

    if (token != null && token.trim().isNotEmpty) {
      options.headers[ApiConstants.authorizationHeader] =
          '${ApiConstants.bearerPrefix} $token';
    }

    handler.next(options);
  }
}
