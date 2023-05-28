import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/models/banner_model.dart';
import 'package:pollo_education/resourses/repository/i_pollo_app_repository.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BannersCubit extends Cubit<HomePageBannersState> {
  final IPolloAppRepository repository;
  final SharedPreferences pref;
  BannersCubit(
    this.repository,
    this.pref,
  ) : super(HomePageBannersState.initial());

  Future<void> getBanners() async {
    Future.wait([
      getTopBanners(),
      getFirstBanners(),
      getSecondBanners(),
      getThirdBanners(),
      getBottomBanners(),
    ]);
  }

  Future<void> getTopBanners() async {
    try {
      emit(state.copyWith(top: const AsyncValue.loading()));
      final failureOrResult = await repository.getMainBanners();
      failureOrResult.fold(
        (f) => emit(state.copyWith(top: AsyncValue.failure(f.toString()))),
        (r) => emit(state.copyWith(top: AsyncValue.loaded(r))),
      );
    } catch (e) {
      emit(state.copyWith(top: AsyncValue.failure(e.toString())));
    }
  }

  Future<void> getFirstBanners() async {
    try {
      emit(state.copyWith(first: const AsyncValue.loading()));
      final failureOrResult = await repository.getMiddleFirstBanners();
      failureOrResult.fold(
        (f) => emit(state.copyWith(first: AsyncValue.failure(f.toString()))),
        (r) => emit(state.copyWith(first: AsyncValue.loaded(r))),
      );
    } catch (e) {
      emit(state.copyWith(first: AsyncValue.failure(e.toString())));
    }
  }

  Future<void> getSecondBanners() async {
    try {
      emit(state.copyWith(second: const AsyncValue.loading()));
      final failureOrResult = await repository.getSecondBanners();
      failureOrResult.fold(
        (f) => emit(state.copyWith(second: AsyncValue.failure(f.toString()))),
        (r) => emit(state.copyWith(second: AsyncValue.loaded(r))),
      );
    } catch (e) {
      emit(state.copyWith(second: AsyncValue.failure(e.toString())));
    }
  }

  Future<void> getThirdBanners() async {
    try {
      emit(state.copyWith(third: const AsyncValue.loading()));
      final failureOrResult = await repository.getThirdBanners();
      failureOrResult.fold(
        (f) => emit(state.copyWith(third: AsyncValue.failure(f.toString()))),
        (r) => emit(state.copyWith(third: AsyncValue.loaded(r))),
      );
    } catch (e) {
      emit(state.copyWith(third: AsyncValue.failure(e.toString())));
    }
  }

  Future<void> getBottomBanners() async {
    try {
      emit(state.copyWith(bottom: const AsyncValue.loading()));
      final failureOrResult = await repository.getBottomBanners();
      failureOrResult.fold(
        (f) => emit(state.copyWith(bottom: AsyncValue.failure(f.toString()))),
        (r) => emit(state.copyWith(bottom: AsyncValue.loaded(r))),
      );
    } catch (e) {
      emit(state.copyWith(bottom: AsyncValue.failure(e.toString())));
    }
  }
}

class HomePageBannersState {
  final AsyncValue<List<BannerModel>> top;
  final AsyncValue<List<BannerModel>> first;
  final AsyncValue<List<BannerModel>> second;
  final AsyncValue<List<BannerModel>> third;
  final AsyncValue<List<BannerModel>> bottom;

  HomePageBannersState({
    required this.top,
    required this.first,
    required this.second,
    required this.third,
    required this.bottom,
  });

  factory HomePageBannersState.initial() {
    return HomePageBannersState(
      top: const AsyncValue.initial(),
      first: const AsyncValue.initial(),
      second: const AsyncValue.initial(),
      third: const AsyncValue.initial(),
      bottom: const AsyncValue.initial(),
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomePageBannersState &&
        other.top == top &&
        other.first == first &&
        other.second == second &&
        other.third == third &&
        other.bottom == bottom;
  }

  @override
  int get hashCode {
    return top.hashCode ^
        first.hashCode ^
        second.hashCode ^
        third.hashCode ^
        bottom.hashCode;
  }

  @override
  String toString() {
    return 'HomePageBannersState(top: $top, first: $first, second: $second, third: $third, bottom: $bottom)';
  }

  HomePageBannersState copyWith({
    AsyncValue<List<BannerModel>>? top,
    AsyncValue<List<BannerModel>>? first,
    AsyncValue<List<BannerModel>>? second,
    AsyncValue<List<BannerModel>>? third,
    AsyncValue<List<BannerModel>>? bottom,
  }) {
    return HomePageBannersState(
      top: top ?? this.top,
      first: first ?? this.first,
      second: second ?? this.second,
      third: third ?? this.third,
      bottom: bottom ?? this.bottom,
    );
  }
}
