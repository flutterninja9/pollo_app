// ignore_for_file: prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:pollo_education/models/computer_course_model.dart';
import 'package:pollo_education/models/scholarship_level_and_class_model.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';

class GoalsCubit extends Cubit<GoalsCubitState> {
  final IPolloAppRepository _repository;
  GoalsCubit(this._repository) : super(GoalsCubitState.initial());

  Future<void> init() async {
    Future.wait([
      fetchScholarshipLevelAndClass(),
      getStateList(),
      fetchComputerCourses(),
    ]);
  }

  Future<void> fetchScholarshipLevelAndClass() async {
    try {
      emit(state.copyWith(level: const AsyncValue.loading()));
      final result = await _repository.getScholarshipLevelAndClass();
      result.fold(
          (l) => emit(state.copyWith(level: AsyncValue.failure(l.toString()))),
          (r) => emit(state.copyWith(level: AsyncValue.loaded(r))));
    } catch (e) {
      emit(state.copyWith(level: AsyncValue.failure(e.toString())));
    }
  }

  Future<void> fetchComputerCourses() async {
    try {
      emit(state.copyWith(computerCourses: const AsyncValue.loading()));
      final result = await _repository.getComputerCourseList();
      result.fold(
          (l) => emit(state.copyWith(computerCourses: AsyncValue.failure(l.toString()))),
          (r) => emit(state.copyWith(computerCourses: AsyncValue.loaded(r))));
    } catch (e) {
      emit(state.copyWith(computerCourses: AsyncValue.failure(e.toString())));
    }
  }

  Future<void> getStateList() async {
    try {
      emit(state.copyWith(states: const AsyncValue.loading()));
      final failureOrResult = await _repository.getStateList();
      failureOrResult.fold(
        (failure) => emit(
            state.copyWith(states: AsyncValue.failure(failure.toString()))),
        (result) => emit(state.copyWith(states: AsyncValue.loaded(result))),
      );
    } catch (e) {
      emit(state.copyWith(states: AsyncValue.failure(e.toString())));
    }
  }
}

class GoalsCubitState {
  const GoalsCubitState({
    required this.level,
    required this.states,
    required this.computerCourses,
  });
  final AsyncValue<List<ScholarshipLevelAndClassModel>> level;
  final AsyncValue<List<StateModel>> states;
  final AsyncValue<List<ComputerCourseModel>> computerCourses;

  factory GoalsCubitState.initial() {
    return GoalsCubitState(
      level: AsyncValue.initial(),
      states: AsyncValue.initial(),
      computerCourses: AsyncValue.initial(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is GoalsCubitState &&
      other.level == level &&
      other.states == states &&
      other.computerCourses == computerCourses;
  }

  @override
  int get hashCode => level.hashCode ^ states.hashCode ^ computerCourses.hashCode;

  @override
  String toString() => 'GoalsCubitState(level: $level, states: $states, computerCourses: $computerCourses)';

  GoalsCubitState copyWith({
    AsyncValue<List<ScholarshipLevelAndClassModel>>? level,
    AsyncValue<List<StateModel>>? states,
    AsyncValue<List<ComputerCourseModel>>? computerCourses,
  }) {
    return GoalsCubitState(
      level: level ?? this.level,
      states: states ?? this.states,
      computerCourses: computerCourses ?? this.computerCourses,
    );
  }
}
