import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/resourses/remote/pollo_remote_data_source_impl.dart';

import 'package:pollo_education/utils/asyncValue/async_value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetClassCubit extends Cubit<AsyncValue<List<ClassModel>>> {
  final PolloRemoteDataSourceImpl remoteDataSourceImpl;
  GetClassCubit(
    this.remoteDataSourceImpl,
  ) : super(const AsyncValue.initial());

  Future<void> getSubjectListByBoardName() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String? boardName = pref.getString("boardName");
    emit(const AsyncValue.loading());
    try {
      final response =
          await remoteDataSourceImpl.getClassListByBoardName(boardName!);
      emit(AsyncValue.loaded(response));
    } catch (e) {
      emit(AsyncValue.failure(e.toString()));
    }
  }
}
