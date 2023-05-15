import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/onboarding/cubit/onboarding_state.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitialState());

  Future<void> getBoardState(String stateName) async {
    emit(OnboardingFinalState(stateName: stateName));
  }
}
