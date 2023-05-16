import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class BoardSelectionCubit extends Cubit<AsyncValue<List<BoardModel>>> {
  final IPolloAppRepository repository;
  BoardSelectionCubit(this.repository) : super(const AsyncValue.initial());

  Future<void> getBoardListByState(String stateName) async {
    try {
      emit(const AsyncValue.loading());
      final failureOrResult =
          await repository.getBoardListByStateName(stateName);
      failureOrResult.fold(
        (failure) => emit(AsyncValue.failure(failure.toString())),
        (result) => emit(AsyncValue.loaded(result)),
      );
    } catch (e) {
      emit(AsyncValue.failure(e.toString()));
    }
  }
}
