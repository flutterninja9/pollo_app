abstract class OnboardingState {}

class OnboardingInitialState extends OnboardingState {}

class OnboardingFinalState extends OnboardingState {
  final String stateName;

  OnboardingFinalState({required this.stateName});
}
