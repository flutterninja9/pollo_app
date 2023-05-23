import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/scholarship_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class GetScholarshipsCubit extends Cubit<AsyncValue<List<ScholarshipModel>>> {
  final IPolloAppRepository repository;

  GetScholarshipsCubit(this.repository) : super(const AsyncValue.initial());

  Future<void> getScholarshipList() async {
    emit(const AsyncValue.loading());
    try {
      final result = await repository.getScholarshipList();
      result.fold((l) => emit(AsyncValue.failure(l.toString())),
          (r) => emit(AsyncValue.loaded(r)));
    } catch (e) {
      emit(AsyncValue.failure(e.toString()));
    }
  }
}
