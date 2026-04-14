import 'package:doctor_speed_app/app/guards/app_auth_state_provider.dart';
import 'package:doctor_speed_app/app/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final appRouterProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(appAuthStateProvider);
  return AppRouter.create(authState);
});
