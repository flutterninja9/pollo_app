import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/presentation/scholarship/cubit/get_class_by_levels_cubit.dart';
import 'package:pollo_education/presentation/scholarship/scholarship_screen.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';

class ClassesScreen extends StatelessWidget {
  static const String routeName = '/classes';
  const ClassesScreen({
    Key? key,
    required this.level,
  }) : super(key: key);
  final String level;
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          di<GetClassByLevelCubit>()..getScholarshipList(level),
      child: const ClassesScreenView(),
    );
  }
}

class ClassesScreenView extends StatelessWidget {
  const ClassesScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: R.color.blueColor,
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Text(
                  "Classes",
                  style: TextStyle(
                      color: R.color.surface,
                      fontSize: 20,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Expanded(child: BlocBuilder<GetClassByLevelCubit,
                  GetClassesByLevelCubitState>(builder: (context, state) {
                return state.classes.map(
                    initial: (_) => const SizedBox.shrink(),
                    loading: (_) =>
                        const Center(child: CircularProgressIndicator()),
                    loaded: (value) {
                      final scholarships = value.data;
                      return ListView.builder(
                          itemCount: scholarships.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 8,
                              ),
                              width: getSize(context).width,
                              decoration: BoxDecoration(
                                color: R.color.greenColor,
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(color: R.color.blueColor),
                              ),
                              child: ClipRRect(
                                child: BackdropFilter(
                                  filter:
                                      ImageFilter.blur(sigmaX: 2, sigmaY: 2),
                                  child: Container(
                                    padding: const EdgeInsets.all(16),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color:
                                            R.color.blueColor.withOpacity(0.9),
                                        border: Border.all(
                                            color: R.color.greenColor)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                          scholarships[index].name,
                                          style: TextStyle(
                                              color: R.color.surface,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        TextButton(
                                          style: TextButton.styleFrom(
                                              elevation: 20,
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 20,
                                                      vertical: 10),
                                              shadowColor: R.color.greenColor
                                                  .withOpacity(0.4),
                                              shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          30)),
                                              backgroundColor:
                                                  R.color.greenColor,
                                              foregroundColor: R.color.surface),
                                          onPressed: () {
                                            di<GoRouter>().push(
                                              ScholarShipScreen.routeName,
                                              extra: scholarships[index].name,
                                            );
                                          },
                                          child: const Text(
                                            'Details',
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          });
                    },
                    failure: (value) => Center(
                          child: Text(value.reason),
                        ));
              })),
            ],
          ),
        ),
      ),
    );
  }
}
