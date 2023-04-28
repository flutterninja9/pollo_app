import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pollo_education/auth/view_model/auth_form_state.dart';

final authFormStateProvider =
    StateNotifierProvider.autoDispose<AuthFormNotifier, AuthFormState>((ref) {
  return AuthFormNotifier();
});

class AuthFormNotifier extends StateNotifier<AuthFormState> {
  AuthFormNotifier() : super(AuthFormState.initial());

  void updatePhone(String phone) {
    state = state.copyWith(mobileNumber: phone);
  }

  Future<void> getOtp() async {
    state = state.copyWith(isSubmittingPhone: true, showOtpField: true);
  }

  Future<void> verifyOtp() async {
    state = state.copyWith(otpVerified: true);
  }

  void updateOtp(String otp) {
    state = state.copyWith(otp: otp);
  }

  void updateShowErrorMessages(bool showErrorMessages) {
    state = state.copyWith(showErrorMessages: showErrorMessages);
  }

  void reset() {
    state = AuthFormState.initial();
  }

  Future<void> resendOtp() async {
    state = state.copyWith(showResendOtpButton: false);
  }
}
