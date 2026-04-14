import 'package:doctor_speed_app/app/guards/app_auth_state.dart';
import 'package:doctor_speed_app/app/guards/app_route_guard.dart';
import 'package:doctor_speed_app/app/router/guarded_route.dart';
import 'package:doctor_speed_app/app/router/routes/app_route_names.dart';
import 'package:doctor_speed_app/app/router/routes/app_route_paths.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

final class AppRouter {
  AppRouter._();

  static GoRouter create(AppAuthState authState) {
    return GoRouter(
      initialLocation: AppRoutePaths.startup,
      refreshListenable: authState,
      routes: [
        guardedRoute(
          name: AppRouteNames.startup,
          path: AppRoutePaths.startup,
          guard: AppRouteGuard.public,
          authState: authState,
          builder: (_, _) => const StartupPage(),
        ),
        guardedRoute(
          name: AppRouteNames.login,
          path: AppRoutePaths.login,
          guard: AppRouteGuard.guestOnly,
          authState: authState,
          builder: (_, _) => const LoginPage(),
        ),
        guardedRoute(
          name: AppRouteNames.home,
          path: AppRoutePaths.home,
          guard: AppRouteGuard.requiresAuth,
          authState: authState,
          builder: (_, _) => const HomePage(),
        ),
      ],
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class StartupPage extends StatelessWidget {
  const StartupPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
