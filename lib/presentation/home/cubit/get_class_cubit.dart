import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GetClassCubit extends Cubit<AsyncValue<List<ClassModel>>> {
  final IPolloAppRepository repository;
  final SharedPreferences pref;
  GetClassCubit(
    this.repository,
    this.pref,
  ) : super(const AsyncValue.initial());

  List<ClassModel> classes = [];

  Future<void> getSubjectListByBoardName(String boardName) async {
    try {
      emit(const AsyncValue.loading());
      String? boardNam = pref.getString("boardName");
      final failureOrResult =
          await repository.getClassListByBoardName(boardName);
      failureOrResult.fold(
        (f) => emit(AsyncValue.failure(f.toString())),
        (r) {
          classes = r;
          emit(AsyncValue.loaded(r));
        },
      );
    } catch (e) {
      emit(AsyncValue.failure(e.toString()));
    }
  }

  Future<List<ClassModel>> getClassListByBoardName(String boardName) async {
    final data = await repository.getClassListByBoardName(boardName);
    data.fold((l) => [], (r) => classes = r);

    return classes;
  }
}
