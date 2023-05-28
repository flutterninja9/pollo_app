// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/scholarship_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class GetScholarshipByClassCubit
    extends Cubit<GetScholarshipsByClassCubitState> {
  final IPolloAppRepository repository;

  GetScholarshipByClassCubit(this.repository)
      : super(GetScholarshipsByClassCubitState.initial());

  Future<void> getScholarshipList(String className) async {
    emit(state.copyWith(classes: const AsyncValue.loading()));
    try {
      final result = await repository.getScholarshipsByClass(className);
      result.fold(
          (l) =>
              emit(state.copyWith(classes: AsyncValue.failure(l.toString()))),
          (r) => emit(state.copyWith(classes: AsyncValue.loaded(r))));
    } catch (e) {
      emit(state.copyWith(classes: AsyncValue.failure(e.toString())));
    }
  }
}

class GetScholarshipsByClassCubitState {
  final AsyncValue<List<ScholarshipModel>> classes;

  const GetScholarshipsByClassCubitState({
    required this.classes,
  });

  factory GetScholarshipsByClassCubitState.initial() =>
      GetScholarshipsByClassCubitState(
        classes: AsyncValue.initial(),
      );

  @override
  String toString() =>
      'GetScholarshipsByClassCubitState(scholarshipList: $classes)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GetScholarshipsByClassCubitState &&
        other.classes == classes;
  }

  @override
  int get hashCode => classes.hashCode;

  GetScholarshipsByClassCubitState copyWith({
    AsyncValue<List<ScholarshipModel>>? classes,
  }) {
    return GetScholarshipsByClassCubitState(
      classes: classes ?? this.classes,
    );
  }
}
