import 'package:dio/dio.dart';

import 'dio_base_options.dart';

class DioClient {
  DioClient() : _dio = Dio(buildDioBaseOptions());

  final Dio _dio;

  Dio get instance => _dio;
}
