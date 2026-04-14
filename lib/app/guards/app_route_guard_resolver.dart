import 'package:doctor_speed_app/app/guards/app_auth_status.dart';
import 'package:doctor_speed_app/app/guards/app_route_guard.dart';
import 'package:doctor_speed_app/app/router/routes/app_route_paths.dart';

abstract final class AppRouteGuardResolver {
  static String? resolve({
    required AppRouteGuard guard,
    required AppAuthStatus authStatus,
    required String matchedLocation,
  }) {
    final isStartupRoute = matchedLocation == AppRoutePaths.startup;

    switch (authStatus) {
      case AppAuthStatus.unknown:
        return isStartupRoute ? null : AppRoutePaths.startup;

      case AppAuthStatus.authenticated:
        switch (guard) {
          case AppRouteGuard.public:
          case AppRouteGuard.requiresAuth:
            return null;
          case AppRouteGuard.guestOnly:
            return AppRoutePaths.home;
        }

      case AppAuthStatus.unauthenticated:
        switch (guard) {
          case AppRouteGuard.public:
          case AppRouteGuard.guestOnly:
            return null;
          case AppRouteGuard.requiresAuth:
            return Uri(
              path: AppRoutePaths.login,
              queryParameters: {'from': matchedLocation},
            ).toString();
        }
    }
  }
}
