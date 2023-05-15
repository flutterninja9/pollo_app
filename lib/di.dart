import 'package:get_it/get_it.dart';
import 'package:pollo_education/resourses/remote/pollo_remote_data_source_impl.dart';
import 'package:pollo_education/presentation/onboarding/cubit/board_selection_cubit.dart';
import 'package:pollo_education/presentation/onboarding/cubit/onboarding_cubit.dart';
import 'package:pollo_education/presentation/onboarding/cubit/state_selection_cubit.dart';
import 'package:pollo_education/utils/apiClient/api_client.dart';

final di = GetIt.instance;

Future<void> initDi() async {
  di.registerFactory(() => StateSelectionCubit(di()));
  di.registerFactory(() => BoardSelectionCubit(di()));
  di.registerFactory(() => OnboardingCubit());

//initiate repositories
  di.registerLazySingleton<PolloRemoteDataSourceImpl>(
      () => PolloRemoteDataSourceImpl(apiClient: di()));

  di.registerLazySingleton(() => ApiClient());
}
