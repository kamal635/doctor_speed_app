import 'package:doctor_speed_app/core/extensions/string_x.dart';

import 'api_constants.dart';

abstract final class NetworkHeadersPolicy {
  static const Map<String, String> defaultHeaders = <String, String>{
    ApiConstants.acceptHeader: ApiConstants.applicationJson,
    ApiConstants.contentTypeHeader: ApiConstants.applicationJson,
  };

  static Map<String, String> mergeHeaders({
    Map<String, String>? base,
    Map<String, String>? extra,
  }) {
    return <String, String>{...?base, ...?extra}
      ..removeWhere((key, value) => value.isBlank);
  }
}
