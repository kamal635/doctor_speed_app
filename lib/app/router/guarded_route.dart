import 'package:doctor_speed_app/app/guards/app_auth_state.dart';
import 'package:doctor_speed_app/app/guards/app_route_guard.dart';
import 'package:doctor_speed_app/app/guards/app_route_guard_resolver.dart';
import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';

GoRoute guardedRoute({
  required String path,
  required AppRouteGuard guard,
  required AppAuthState authState,
  required Widget Function(BuildContext context, GoRouterState state) builder,
  String? name,
  List<RouteBase> routes = const [],
}) {
  return GoRoute(
    path: path,
    name: name,
    routes: routes,
    redirect: (_, state) {
      return AppRouteGuardResolver.resolve(
        guard: guard,
        authStatus: authState.status,
        matchedLocation: state.matchedLocation,
      );
    },
    builder: builder,
  );
}
