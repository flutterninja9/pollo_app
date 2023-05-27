import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/presentation/goal/view/widgets/goal_selection_tile.dart';
import 'package:pollo_education/presentation/onboarding/cubit/state_selection_cubit.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';

class DigitalCoachingScreen extends StatelessWidget {
  static const routeName = "/digital-coaching";
  const DigitalCoachingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => di<StateSelectionCubit>())
    ], child: const DigitalCoachingScreenView());
  }
}

class DigitalCoachingScreenView extends StatefulWidget {
  const DigitalCoachingScreenView({super.key});

  @override
  State<DigitalCoachingScreenView> createState() =>
      _DigitalCoachingScreenViewState();
}

class _DigitalCoachingScreenViewState extends State<DigitalCoachingScreenView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: R.color.surface,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Container(
                  height: 120,
                  width: getSize(context).width,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  decoration: BoxDecoration(
                      color: R.color.surface,
                      image: const DecorationImage(
                        image: AssetImage("assets/Blogging-bro.png"),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 0.8,
                          color: R.color.blueColor.withOpacity(0.3))),
                  child: IconButton(
                      padding: EdgeInsets.zero,
                      onPressed: () {
                        di<GoRouter>().pop();
                      },
                      icon: const FaIcon(
                        FontAwesomeIcons.arrowLeft,
                        size: 18,
                      )),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Text(
                "Select your computer education here",
                style: TextStyle(
                    color: R.color.blueColor,
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
