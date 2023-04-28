import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pollo_education/auth/view_model/auth_form_viewmodel.dart';
import 'package:pollo_education/auth/view_model/auth_view_model.dart';

class LoginScreen extends ConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authFormState = ref.watch(authFormStateProvider);
    ref.listen(authFormStateProvider, (previous, next) {
      if (next.otpVerified) {
        ref.read(authStateNotifiderProvider.notifier).updateAuthState();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Polo Education Login"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          children: <Widget>[
            const Padding(
              padding: EdgeInsets.only(top: 60.0),
              child: Center(
                child: FlutterLogo(
                  style: FlutterLogoStyle.horizontal,
                  size: 200,
                ),
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                  labelText: 'Mobile Number',
                  hintText: 'Enter valid mobile number'),
            ),
            if (authFormState.showOtpField) const SizedBox(height: 16),
            if (authFormState.showOtpField)
              const TextField(
                obscureText: true,
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Otp',
                    hintText: 'Enter Otp'),
              ),
            const SizedBox(height: 10),
            if (authFormState.showOtpField)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(authFormStateProvider.notifier).verifyOtp();
                  },
                  child: const Text(
                    'Verify Otp',
                  ),
                ),
              )
            else
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(authFormStateProvider.notifier).getOtp();
                  },
                  child: const Text(
                    'Send Otp',
                  ),
                ),
              ),
            if (!authFormState.showOtpField &&
                authFormState.showResendOtpButton)
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    ref.read(authFormStateProvider.notifier).resendOtp();
                  },
                  child: const Text(
                    'Resend Otp',
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
