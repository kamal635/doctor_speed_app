abstract final class ApiConstants {
  static const String baseUrl = 'https://api.example.com';
  static const String apiVersion = '/api/v1';
  static const String baseApiUrl = '$baseUrl$apiVersion';

  static const String acceptHeader = 'Accept';
  static const String contentTypeHeader = 'Content-Type';
  static const String authorizationHeader = 'Authorization';

  static const String applicationJson = 'application/json';
  static const String bearerPrefix = 'Bearer';
}
