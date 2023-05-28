import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/presentation/goal/cubit/goals_cubit.dart';
import 'package:pollo_education/presentation/goal/view/screens/basic_course_screen.dart';
import 'package:pollo_education/presentation/goal/view/screens/computer_education_screen.dart';
import 'package:pollo_education/presentation/goal/view/screens/digital_coaching_screen.dart';
import 'package:pollo_education/presentation/goal/view/widgets/goal_list_tile.dart';
import 'package:pollo_education/presentation/goal/view/widgets/goal_selection_tile.dart';
import 'package:pollo_education/presentation/scholarship/classses_screen.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';

class SelectGoalScreen extends StatelessWidget {
  static const routeName = "/goal";
  const SelectGoalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (context) => di<GoalsCubit>()..init())
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
      child: Scaffold(
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
                BlocBuilder<GoalsCubit, GoalsCubitState>(
                  builder: (context, state) {
                    return state.states.maybeMap(
                      loading: (_) => const Center(
                        // grey colored tile for shimmer effect
                        child: GoalSelectionTile(
                          title: "STATE BOARD",
                          expandedWidget: SizedBox(
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                      loaded: (value) {
                        return GoalSelectionTile(
                          title: "STATE BOARD",
                          expandedWidget: Container(
                            color: R.color.surface,
                            child: Column(
                              children: [
                                for (final item in value.data)
                                  GoalListTile(
                                    fontSize: 16,
                                    onTap: () {},
                                    title: item.state,
                                    imgUrl:
                                        'https://polloeducation.tunajifoundation.com/public/storage/upload/${item.image}',
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                BlocBuilder<GoalsCubit, GoalsCubitState>(
                  builder: (context, state) {
                    return state.level.maybeMap(
                      loading: (_) => const Center(
                        // grey colored tile for shimmer effect
                        child: GoalSelectionTile(
                          title: "SCHOLARSHIP",
                          expandedWidget: SizedBox(
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                      loaded: (value) {
                        return GoalSelectionTile(
                          title: "SCHOLARSHIP",
                          expandedWidget: Container(
                            color: R.color.surface,
                            child: Column(
                              children: [
                                for (final item in value.data)
                                  GoalListTile(
                                    fontSize: 16,
                                    title: item.level,
                                    onTap: () {
                                      di<GoRouter>().push(
                                        ClassesScreen.routeName,
                                        extra: item.level,
                                      );
                                    },
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                BlocBuilder<GoalsCubit, GoalsCubitState>(
                  builder: (context, state) {
                    return state.computerCourses.maybeMap(
                      loading: (_) => const Center(
                        // grey colored tile for shimmer effect
                        child: GoalSelectionTile(
                          title: "COMPUTER EDUCATION",
                          expandedWidget: SizedBox(
                            height: 100,
                            child: Center(
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        ),
                      ),
                      loaded: (value) {
                        return GoalSelectionTile(
                          title: "COMPUTER EDUCATION",
                          expandedWidget: Container(
                            color: R.color.surface,
                            child: Column(
                              children: [
                                for (final item in value.data)
                                  GoalListTile(
                                    fontSize: 16,
                                    title: item.name,
                                    onTap: () {
                                      di<GoRouter>()
                                      .push(ComputerEducationScreen.routeName,);
                                    },
                                  )
                              ],
                            ),
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: GoalListTile(
                    onTap: () {
                      di<GoRouter>().push(BasicCourseScreen.routeName);
                    },
                    title: "BASIC COURSE",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 16),
                  child: GoalListTile(
                    onTap: () {
                      di<GoRouter>().push(DigitalCoachingScreen.routeName);
                    },
                    title: "DIGITAL COACHING CENTER",
                  ),
                ),
              ],
            ))
          ],
        ),
      )),
    );
  }
}
