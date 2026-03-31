import 'package:dio/dio.dart';

import 'api_constants.dart';
import 'network_headers_policy.dart';
import 'network_timeouts.dart';

BaseOptions buildDioBaseOptions() {
  return BaseOptions(
    baseUrl: ApiConstants.baseUrl,
    connectTimeout: NetworkTimeouts.connect,
    sendTimeout: NetworkTimeouts.send,
    receiveTimeout: NetworkTimeouts.receive,
    headers: NetworkHeadersPolicy.defaultHeaders,
    responseType: ResponseType.json,
    validateStatus: (status) {
      return status != null && status >= 200 && status < 300;
    },
  );
}
