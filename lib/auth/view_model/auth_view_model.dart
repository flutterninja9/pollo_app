import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pollo_education/auth/view_model/auth_state.dart';

final authStateNotifiderProvider =
    StateNotifierProvider<AuthStateNotifier, AuthState>((ref) {
  return AuthStateNotifier();
});

class AuthStateNotifier extends StateNotifier<AuthState> {
  AuthStateNotifier() : super(const AuthState.unknown());

  void updateAuthState() {
    state = const AuthState.authenticated();
  }
}
