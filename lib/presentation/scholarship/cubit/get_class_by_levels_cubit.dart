// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/scholarship_class_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class GetClassByLevelCubit extends Cubit<GetClassesByLevelCubitState> {
  final IPolloAppRepository repository;

  GetClassByLevelCubit(this.repository)
      : super(GetClassesByLevelCubitState.initial());

  Future<void> getScholarshipList(String level) async {
    emit(state.copyWith(scholarshipList: const AsyncValue.loading()));
    try {
      final result = await repository.getClassesByLevel(level);
      result.fold(
          (l) => emit(state.copyWith(
              scholarshipList: AsyncValue.failure(l.toString()))),
          (r) => emit(state.copyWith(scholarshipList: AsyncValue.loaded(r))));
    } catch (e) {
      emit(state.copyWith(scholarshipList: AsyncValue.failure(e.toString())));
    }
  }
}

class GetClassesByLevelCubitState {
  final AsyncValue<List<ScholarshipClassModel>> classes;

  const GetClassesByLevelCubitState({
    required this.classes,
  });

  factory GetClassesByLevelCubitState.initial() => GetClassesByLevelCubitState(
        classes: AsyncValue.initial(),
      );

  @override
  String toString() => 'GetClassesByLevelCubitState(scholarshipList: $classes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetClassesByLevelCubitState && other.classes == classes;
  }

  @override
  int get hashCode => classes.hashCode;

  GetClassesByLevelCubitState copyWith({
    AsyncValue<List<ScholarshipClassModel>>? scholarshipList,
  }) {
    return GetClassesByLevelCubitState(
      classes: scholarshipList ?? classes,
    );
  }
}
