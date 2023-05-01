import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pollo_education/app/app_routes.dart';
import 'package:pollo_education/auth/view_model/auth_view_model.dart';
import 'package:pollo_education/design_system/themes.dart';
import 'package:pollo_education/home/view/home_screen_container.dart';
import 'package:pollo_education/splash/splash_screen.dart';

class PoloApp extends ConsumerWidget {
  const PoloApp({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    ref.listen(
      authStateNotifiderProvider,
      (_, next) {
        next.maybeWhen(
          authenticated: () {
            goRouter.pushReplacement(HomeScreenContainer.routeName);
          },
          orElse: () {
            goRouter.pushReplacement(SplashScreen.routeName);
          },
        );
      },
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Polo Education',
      theme: AppTheme.light,
      darkTheme: AppTheme.dark,
      routerConfig: goRouter,
    );
  }
}
