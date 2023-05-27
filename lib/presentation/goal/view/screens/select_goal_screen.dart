import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/models/state_model.dart';
import 'package:pollo_education/presentation/goal/view/screens/basic_course_screen.dart';
import 'package:pollo_education/presentation/goal/view/screens/computer_education_screen.dart';
import 'package:pollo_education/presentation/goal/view/screens/digital_coaching_screen.dart';
import 'package:pollo_education/presentation/goal/view/widgets/goal_selection_tile.dart';
import 'package:pollo_education/presentation/goal/view/widgets/state_selection_tile.dart';
import 'package:pollo_education/presentation/onboarding/cubit/state_selection_cubit.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';

class SelectGoalScreen extends StatelessWidget {
  static const routeName = "/goal";
  const SelectGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
          create: (context) => di<StateSelectionCubit>()..getStateList())
    ], child: const SelectGoalScreenView());
  }
}

class SelectGoalScreenView extends StatefulWidget {
  const SelectGoalScreenView({super.key});

  @override
  State<SelectGoalScreenView> createState() => _SelectGoalScreenViewState();
}

class _SelectGoalScreenViewState extends State<SelectGoalScreenView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body:
          BlocBuilder<StateSelectionCubit, AsyncValue<List<StateModel>>>(
              builder: (context, state) {
        return state.map(
            initial: (_) => SizedBox(),
            loading: (_) => const Center(
                  child: CircularProgressIndicator(),
                ),
            loaded: (value) {
              return Container(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Text(
                        "Select your destination here",
                        style: TextStyle(
                            color: R.color.blueColor,
                            fontSize: 20,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    Expanded(
                        child: ListView(
                      children: [
                        GoalSelectionTile(
                          title: "STATE BOARD",
                          expandedWidget: Container(
                            color: R.color.surface,
                            child: Column(
                              children: [
                                for (final item in value.data)
                                  StateSelectionTile(
                                    title: item.state,
                                    expandedWidget: SizedBox(),
                                    imgUrl:
                                        'https://polloeducation.tunajifoundation.com/public/storage/upload/${item.image}',
                                  )
                              ],
                            ),
                          ),
                        ),
                        const GoalSelectionTile(
                          title: "SCHOLARSHIP",
                          expandedWidget: Column(
                            children: [],
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            di<GoRouter>()
                                .push(ComputerEducationScreen.routeName);
                          },
                          child: Container(
                            width: getSize(context).width,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                color: R.color.blueColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "COMPUTER EDUCATION",
                              style: TextStyle(
                                  color: R.color.surface,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            di<GoRouter>().push(BasicCourseScreen.routeName);
                          },
                          child: Container(
                            width: getSize(context).width,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                color: R.color.blueColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "BASIC COURSE",
                              style: TextStyle(
                                  color: R.color.surface,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            di<GoRouter>()
                                .push(DigitalCoachingScreen.routeName);
                          },
                          child: Container(
                            width: getSize(context).width,
                            padding: const EdgeInsets.all(16),
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 8),
                            decoration: BoxDecoration(
                                color: R.color.blueColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              "DIGITAL COACHING CENTER",
                              style: TextStyle(
                                  color: R.color.surface,
                                  fontSize: 18,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ],
                    ))
                  ],
                ),
              );
            },
            failure: (e) => Center(
                  child: Text(e.reason),
                ));
      })),
    );
  }
}
