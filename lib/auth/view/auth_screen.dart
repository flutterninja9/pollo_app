import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pollo_education/auth/view/login_screen.dart';
import 'package:pollo_education/auth/view_model/auth_form_viewmodel.dart';

class AuthScreen extends ConsumerWidget {
  static const routeName = '/auth';
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authFormState = ref.watch(authFormStateProvider);

    return const LoginScreen();
  }
}
