import 'package:dio/dio.dart';

CancelToken createCancelToken() => CancelToken();

bool isRequestCancelled(Object error) {
  return error is DioException && CancelToken.isCancel(error);
}

void cancelRequest(CancelToken? token, [String reason = 'Request cancelled']) {
  if (token == null || token.isCancelled) {
    return;
  }

  token.cancel(reason);
}
