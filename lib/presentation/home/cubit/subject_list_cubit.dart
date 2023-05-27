import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/subject_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class SubjectListCubit extends Cubit<AsyncValue<List<SubjectModel>>> {
  SubjectListCubit(this._repository) : super(const AsyncValue.initial());

  final IPolloAppRepository _repository;
  List<SubjectModel> subjects = [];

  Future<void> getSubjectListByCourseId(String courseId) async {
    emit(const AsyncValue.loading());
    final result = await _repository.getSubjectListByCourseId(courseId);
    result.fold(
      (error) => emit(AsyncValue.failure(error.toString())),
      (data) {
        subjects.addAll(data);
        emit(AsyncValue.loaded(data));
      },
    );
  }
}
