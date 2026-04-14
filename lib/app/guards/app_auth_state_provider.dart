import 'package:doctor_speed_app/app/guards/app_auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final appAuthStateProvider = Provider<AppAuthState>((ref) {
  final authState = AppAuthState();

  ref.onDispose(authState.dispose);

  return authState;
});
