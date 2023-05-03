import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollo_education/auth/view/auth_screen.dart';
import 'package:pollo_education/home/view/home_screen.dart';
import 'package:pollo_education/home/view/home_screen_container.dart';
import 'package:pollo_education/profile/profile_screen.dart';
import 'package:pollo_education/splash/splash_screen.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(routes: AppRoutes.routes);
});

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GoRoute(
      path: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AuthScreen.routeName,
      builder: (context, state) => const AuthScreen(),
    ),
    GoRoute(
      path: HomeScreen.routeName,
      builder: (context, state) => const HomeScreen(),
    ),
    GoRoute(
      path: HomeScreenContainer.routeName,
      builder: (context, state) => const HomeScreenContainer(),
    ),
    GoRoute(
      path: ProfileScreen.routeName,
      builder: (context, state) => const ProfileScreen(),
    ),
  ];
}
