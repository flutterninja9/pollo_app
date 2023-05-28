// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/scholarship_info.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class ScholarshipInfoCubit extends Cubit<ScholarshipInfoCubitState> {
  final IPolloAppRepository _repository;
  ScholarshipInfoCubit(this._repository)
      : super(ScholarshipInfoCubitState.initial());

  Future<void> fetchScholarshipInfoByExamId(String examId) async {
    try {
      emit(state.copyWith(scholarshipInfo: const AsyncValue.loading()));
      final result = await _repository.getScholarshipInfoByExamId(examId);
      result.fold(
          (l) => emit(state.copyWith(
              scholarshipInfo: AsyncValue.failure(l.toString()))),
          (r) => emit(state.copyWith(scholarshipInfo: AsyncValue.loaded(r))));
    } catch (e) {
      emit(state.copyWith(scholarshipInfo: AsyncValue.failure(e.toString())));
    }
  }
}

class ScholarshipInfoCubitState {
  final AsyncValue<ScholarshipInfo> scholarshipInfo;

  const ScholarshipInfoCubitState({
    required this.scholarshipInfo,
  });

  factory ScholarshipInfoCubitState.initial() {
    return ScholarshipInfoCubitState(
      scholarshipInfo: AsyncValue.loading(),
    );
  }

  @override
  String toString() =>
      'ScholarshipInfoCubitState(scholarshipInfo: $scholarshipInfo)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ScholarshipInfoCubitState &&
        other.scholarshipInfo == scholarshipInfo;
  }

  @override
  int get hashCode => scholarshipInfo.hashCode;

  ScholarshipInfoCubitState copyWith({
    AsyncValue<ScholarshipInfo>? scholarshipInfo,
  }) {
    return ScholarshipInfoCubitState(
      scholarshipInfo: scholarshipInfo ?? this.scholarshipInfo,
    );
  }
}
