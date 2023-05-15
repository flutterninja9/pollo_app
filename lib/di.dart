import 'package:get_it/get_it.dart';
import 'package:pollo_education/data_source/remote/pollo_remote_data_source_impl.dart';
import 'package:pollo_education/onboarding/cubit/board_selection_cubit.dart';
import 'package:pollo_education/onboarding/cubit/onboarding_cubit.dart';
import 'package:pollo_education/onboarding/cubit/state_selection_cubit.dart';
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
