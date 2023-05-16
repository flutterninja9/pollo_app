import 'package:get_it/get_it.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/app/app_routes.dart';
import 'package:pollo_education/presentation/home/cubit/get_class_cubit.dart';
import 'package:pollo_education/presentation/home/cubit/subject_list_cubit.dart';
import 'package:pollo_education/presentation/home/cubit/subject_videos_cubit.dart';
import 'package:pollo_education/presentation/home/cubit/video_list_cubit.dart';
import 'package:pollo_education/presentation/onboarding/cubit/board_selection_cubit.dart';
import 'package:pollo_education/presentation/onboarding/cubit/onboarding_cubit.dart';
import 'package:pollo_education/presentation/onboarding/cubit/state_selection_cubit.dart';
import 'package:pollo_education/resourses/remote/i_pollo_remote_data_source.dart';
import 'package:pollo_education/resourses/remote/pollo_remote_data_source_impl.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/resourses/repository/pollo_app_repository_impl.dart';
import 'package:pollo_education/utils/api_client/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';

final di = GetIt.instance;

Future<void> initDi() async {
  di.registerFactory(() => SubjectVideosCubit(di()));
  di.registerFactory(() => SubjectListCubit(di()));
  di.registerFactory(() => VideoListCubit(di()));
  di.registerFactory(() => StateSelectionCubit(di()));
  di.registerFactory(() => BoardSelectionCubit(di()));
  di.registerFactory(() => OnboardingCubit());
  di.registerFactory(() => GetClassCubit(di(), di()));

  //initiate repositories
  final sl = await SharedPreferences.getInstance();
  di.registerLazySingleton<SharedPreferences>(() => sl);
  di.registerLazySingleton<IPolloRemoteDataSource>(
      () => PolloRemoteDataSourceImpl(apiClient: di()));
  di.registerLazySingleton<IPolloAppRepository>(
      () => PolloRepositoryImpl(di()));

  di.registerLazySingleton(() => ApiClient());
  di.registerLazySingleton<GoRouter>(() => AppRoutes.router);
}
