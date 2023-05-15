import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pollo_education/design_system/r.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/onboarding/cubit/board_selection_cubit.dart';
import 'package:pollo_education/onboarding/cubit/onboarding_cubit.dart';
import 'package:pollo_education/onboarding/cubit/onboarding_state.dart';
import 'package:pollo_education/onboarding/cubit/state_selection_cubit.dart';
import 'package:pollo_education/onboarding/view/widgets/board_selection_view.dart';
import 'package:pollo_education/onboarding/view/widgets/state_selection_view.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: ((context) => di<StateSelectionCubit>()..getStateList())),
      BlocProvider(create: ((context) => di<BoardSelectionCubit>())),
      BlocProvider(create: ((context) => di<OnboardingCubit>()))
    ], child: const OnboardingScreenView());
  }
}

class OnboardingScreenView extends StatelessWidget {
  const OnboardingScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: R.color.surface,
      body: SafeArea(child: BlocBuilder<OnboardingCubit, OnboardingState>(
          builder: (context, state) {
        if (state is OnboardingInitialState) {
          return const StateSelectionView();
        } else if (state is OnboardingFinalState) {
          return BoardSelectionView(stateName: state.stateName);
        } else {
          return const SizedBox();
        }
      })),
    );
  }
}
