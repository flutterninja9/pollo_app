import 'package:go_router/go_router.dart';
import 'package:pollo_education/presentation/b2b/view/b2b_screen.dart';
import 'package:pollo_education/presentation/b2c/view/b2c_screen.dart';
import 'package:pollo_education/presentation/course/view/my_course_screen.dart';
import 'package:pollo_education/presentation/enterpreneur/view/enterpreneur_screen.dart';
import 'package:pollo_education/presentation/home/view/home_screen_container.dart';
import 'package:pollo_education/presentation/home/view/show_all_screen.dart';
import 'package:pollo_education/presentation/home/view/subject_detail_screen.dart';
import 'package:pollo_education/presentation/home/view/subject_list_screen.dart';
import 'package:pollo_education/presentation/home/view/subject_videos_list_screen.dart';
import 'package:pollo_education/presentation/home/view/video_list_screen.dart';
import 'package:pollo_education/presentation/onboarding/view/onboarding_screen.dart';
import 'package:pollo_education/presentation/profile/profile_screen.dart';
import 'package:pollo_education/presentation/splash/splash_screen.dart';
import 'package:pollo_education/utils/youtube_player/pollo_youtube_player.dart';

class AppRoutes {
  AppRoutes._();

  static final router = GoRouter(routes: [
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
    GoRoute(
      path: B2BScreen.routeName,
      builder: (context, state) => const B2BScreen(),
    ),
    GoRoute(
      path: B2CScreen.routeName,
      builder: (context, state) => const B2CScreen(),
    ),
    GoRoute(
      path: MyCourseScreen.routeName,
      builder: (context, state) => const MyCourseScreen(),
    ),
    GoRoute(
      path: EnterpreneurScreen.routeName,
      builder: (context, state) => const EnterpreneurScreen(),
    ),
    GoRoute(
      path: OnboardingScreen.routeName,
      builder: (context, state) => const OnboardingScreen(),
    ),
    GoRoute(
      path: ShowAllScreen.routeName,
      builder: (context, state) => const ShowAllScreen(),
    ),
    GoRoute(
      path: SubjectListScreen.routeName,
      builder: (context, state) => SubjectListScreen(
        courseId: state.queryParams['course-id']!,
      ),
    ),
    GoRoute(
      path: SubjectDetailScreen.routeName,
      builder: (context, state) => const SubjectDetailScreen(),
    ),
    GoRoute(
      path: VideoListScreen.routeName,
      builder: (context, state) => VideoListScreen(
        courseId: state.queryParams['course-id']!,
      ),
    ),
    GoRoute(
      path: PolloYoutubePlayer.routeName,
      builder: (context, state) => PolloYoutubePlayer(
        ytUrl: state.queryParams['url']!,
      ),
    ),
    GoRoute(
      path: SubjectVideoListScreen.routeName,
      builder: (context, state) => SubjectVideoListScreen(
        courseId: state.queryParams['course-id']!,
        chapter: state.queryParams['chapter']!,
      ),
    ),
  ]);
}
