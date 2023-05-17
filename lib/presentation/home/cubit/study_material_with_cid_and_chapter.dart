import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/study_material_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class StudyMaterialWithCIdAndChapterCubit
    extends Cubit<AsyncValue<List<StudyMaterialModel>>> {
  StudyMaterialWithCIdAndChapterCubit(this._repository)
      : super(const AsyncValue.initial());

  final IPolloAppRepository _repository;

  Future<void> getVideoListByCourseIdAndChapterAndSubject(
    String courseId,
    String chapter,
  ) async {
    emit(const AsyncValue.loading());
    final result = await _repository.getMaterialListByCourseIdAndChapter(
      courseId,
      chapter,
    );
    result.fold(
      (error) => emit(AsyncValue.failure(error.toString())),
      (data) => emit(AsyncValue.loaded(data)),
    );
  }
}
