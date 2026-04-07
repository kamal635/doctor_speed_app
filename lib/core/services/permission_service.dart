import 'package:permission_handler/permission_handler.dart';

class PermissionService {
  const PermissionService();

  Future<PermissionStatus> status(Permission permission) {
    return permission.status;
  }

  Future<PermissionStatus> request(Permission permission) {
    return permission.request();
  }

  Future<bool> openSettings() {
    return openAppSettings();
  }

  Future<bool> shouldShowRationale(Permission permission) {
    return permission.shouldShowRequestRationale;
  }

  Future<PermissionStatus> requestCamera() {
    return request(Permission.camera);
  }

  Future<PermissionStatus> requestPhotos() {
    return request(Permission.photos);
  }
}
