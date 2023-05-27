// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/scholarship_level_and_class_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class GoalsCubit extends Cubit<GoalsCubitState> {
  final IPolloAppRepository _repository;
  GoalsCubit(this._repository) : super(GoalsCubitState.initial());

  Future<void> fetchScholarshipLevelAndClass() async {
    try {
      final result = await _repository.getScholarshipLevelAndClass();
      result.fold(
          (l) => emit(state.copyWith(level: AsyncValue.failure(l.toString()))),
          (r) => emit(state.copyWith(level: AsyncValue.loaded(r))));
    } catch (e) {
      emit(state.copyWith(level: AsyncValue.failure(e.toString())));
    }
  }
}

class GoalsCubitState {
  const GoalsCubitState({
    required this.level,
  });
  final AsyncValue<List<ScholarshipLevelAndClassModel>> level;

  factory GoalsCubitState.initial() {
    return GoalsCubitState(
      level: AsyncValue.initial(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is GoalsCubitState && other.level == level;
  }

  @override
  int get hashCode => level.hashCode;

  @override
  String toString() => 'GoalsCubitState(level: $level)';

  GoalsCubitState copyWith({
    AsyncValue<List<ScholarshipLevelAndClassModel>>? level,
  }) {
    return GoalsCubitState(
      level: level ?? this.level,
    );
  }
}
