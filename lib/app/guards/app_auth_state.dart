import 'package:doctor_speed_app/app/guards/app_auth_status.dart';
import 'package:flutter/foundation.dart';

final class AppAuthState extends ChangeNotifier {
  AppAuthStatus _status = AppAuthStatus.unknown;

  AppAuthStatus get status => _status;

  void setStatus(AppAuthStatus value) {
    if (_status == value) return;
    _status = value;
    notifyListeners();
  }
}
