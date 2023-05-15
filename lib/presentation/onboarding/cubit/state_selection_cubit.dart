import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/data_source/remote/pollo_remote_data_source_impl.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class StateSelectionCubit extends Cubit<AsyncValue<List<StateModel>>> {
  final PolloRemoteDataSourceImpl remoteDataSource;
  StateSelectionCubit(this.remoteDataSource)
      : super(const AsyncValue.initial());

  Future<void> getStateList() async {
    emit(const AsyncValue.loading());
    try {
      final result = await remoteDataSource.getStateList();
      emit(AsyncValue.loaded(result));
    } catch (e) {
      emit(AsyncValue.failure(e.toString()));
    }
  }
}
