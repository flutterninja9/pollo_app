import 'package:go_router/go_router.dart';
import 'package:pollo_education/presentation/home/view/home_screen_container.dart';
import 'package:pollo_education/presentation/profile/profile_screen.dart';
import 'package:pollo_education/presentation/splash/splash_screen.dart';

class AppRoutes {
  AppRoutes._();

  static final routes = [
    GoRoute(
      path: SplashScreen.routeName,
      builder: (context, state) => const SplashScreen(),
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
