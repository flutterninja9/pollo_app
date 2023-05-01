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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/student.jpg'),
                    fit: BoxFit.cover)),
          ),
          SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
            child: const Text(
              'GROW \nTOGATHER \nTO BE BETTER',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 40,
                  fontWeight: FontWeight.w900),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Text(
              'We will teach you to really understand and get work-ready skills for your future career.',
              style: TextStyle(
                  color: Colors.black.withOpacity(0.7),
                  fontSize: 14,
                  fontWeight: FontWeight.w400),
            ),
          ),
          InkWell(
            onTap: () {
              ref.read(authFormStateProvider.notifier).verifyOtp();
            },
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(vertical: 16),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(117, 229, 169, 1),
                  borderRadius: BorderRadius.circular(30)),
              child: const Text(
                'Get Started',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
