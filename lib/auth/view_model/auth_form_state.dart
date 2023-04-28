import 'package:freezed_annotation/freezed_annotation.dart';

part 'auth_form_state.freezed.dart';

@freezed
class AuthFormState with _$AuthFormState {
  const factory AuthFormState({
    required String? mobileNumber,
    required String? otp,
    required bool isSubmittingPhone,
    required bool isSubmittingOtp,
    required bool showErrorMessages,
    required bool showResendOtpButton,
    required bool showOtpField,
    required bool otpVerified,
  }) = _AuthFormState;

  factory AuthFormState.initial() => const AuthFormState(
        isSubmittingPhone: false,
        isSubmittingOtp: false,
        showErrorMessages: false,
        showResendOtpButton: false,
        mobileNumber: null,
        otp: null,
        otpVerified: false,
        showOtpField: false,
      );
}
