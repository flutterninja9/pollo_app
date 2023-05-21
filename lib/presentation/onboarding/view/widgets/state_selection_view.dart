import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/presentation/onboarding/cubit/onboarding_cubit.dart';
import 'package:pollo_education/presentation/onboarding/cubit/state_selection_cubit.dart';
import 'package:pollo_education/presentation/onboarding/view/widgets/state_tile.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';
import 'package:pollo_education/utils/get_size.dart';

class StateSelectionView extends StatefulWidget {
  const StateSelectionView({super.key});

  @override
  State<StateSelectionView> createState() => _StateSelectionViewState();
}

class _StateSelectionViewState extends State<StateSelectionView> {
  int selectedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StateSelectionCubit, AsyncValue<List<StateModel>>>(
        builder: (context, state) {
      return state.map(
        initial: (_) => const SizedBox(),
        loading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        loaded: (value) {
          return Stack(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Text(
                      'Select your state',
                      style: TextStyle(
                          color: R.color.blueColor,
                          fontSize: 20,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 2,
                      width: 100,
                      decoration: BoxDecoration(
                          color: R.color.greenColor,
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(height: 16),
                    Wrap(
                      direction: Axis.horizontal,
                      children: stateList(value.data),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: FloatingActionButton(
                    onPressed: () {
                      if (selectedIndex != -1) {
                        context
                            .read<OnboardingCubit>()
                            .getBoardState(value.data[selectedIndex].state);
                        setState(() {});
                      }
                    },
                    child: FaIcon(
                      FontAwesomeIcons.arrowRight,
                      color: R.color.surface,
                    ),
                  ),
                ),
              ),
            ],
          );
        },
        failure: (value) => SizedBox(
          child: Text(value.reason),
        ),
      );
    });
  }

  List<Widget> stateList(List<StateModel> states) {
    List<Widget> statesWidget = [];
    for (int i = 0; i < states.length; i++) {
      Widget item = GestureDetector(
          onTap: () {
            selectedIndex = i;
            setState(() {});
          },
          child: StateTile(state: states[i], isSelected: selectedIndex == i));
      statesWidget.add(item);
    }
    return statesWidget;
  }
}
