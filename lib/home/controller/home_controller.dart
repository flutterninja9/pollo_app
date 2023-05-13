import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollo_education/home/controller/home_state.dart';

final homeProvider = StateNotifierProvider<HomeControllerNotifier, AsyncData<HomeState>>((ref) {
  return HomeControllerNotifier();
});

class HomeControllerNotifier extends StateNotifier<AsyncData<HomeState>> {
  HomeControllerNotifier() : super(AsyncData(HomeState.initial()));
}
