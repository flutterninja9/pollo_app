import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class StateSelectionCubit extends Cubit<AsyncValue<List<StateModel>>> {
  final IPolloAppRepository repository;
  StateSelectionCubit(this.repository) : super(const AsyncValue.initial());

  Future<void> getStateList() async {
    try {
      emit(const AsyncValue.loading());
      final failureOrResult = await repository.getStateList();
      failureOrResult.fold(
        (failure) => emit(AsyncValue.failure(failure.toString())),
        (result) => emit(AsyncValue.loaded(result)),
      );
    } catch (e) {
      emit(AsyncValue.failure(e.toString()));
    }
  }
}
