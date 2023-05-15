import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/resourses/remote/pollo_remote_data_source_impl.dart';
import 'package:pollo_education/models/board_model.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class BoardSelectionCubit extends Cubit<AsyncValue<List<BoardModel>>> {
  final PolloRemoteDataSourceImpl remoteDataSource;
  BoardSelectionCubit(this.remoteDataSource)
      : super(const AsyncValue.initial());

  Future<void> getBoardListByState(String stateName) async {
    emit(const AsyncValue.loading());
    try {
      final result = await remoteDataSource.getBoardListByStateName(stateName);
      emit(AsyncValue.loaded(result));
    } catch (e) {
      emit(AsyncValue.failure(e.toString()));
    }
  }
}
