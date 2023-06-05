import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/app/app_config.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/models/scholarship_level_and_class_model.dart';
import 'package:pollo_education/presentation/goal/cubit/goals_cubit.dart';
import 'package:pollo_education/presentation/goal/view/widgets/goal_list_tile.dart';
import 'package:pollo_education/presentation/home/cubit/banners_cubit.dart';
import 'package:pollo_education/presentation/home/cubit/get_class_cubit.dart';
import 'package:pollo_education/presentation/scholarship/classses_screen.dart';
import 'package:pollo_education/presentation/scholarship/cubit/get_scholarship_by_class.dart';
import 'package:pollo_education/presentation/scholarship/scholarship_info_screen.dart';
import 'package:pollo_education/presentation/scholarship/scholarship_list_screen.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/utils/get_size.dart';
import 'package:shimmer/shimmer.dart';

class ScholarShipScreen extends StatelessWidget {
  static const String routeName = '/scholarship';
  const ScholarShipScreen({
    Key? key,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<BannersCubit>()..getBanners(),
        ),
        BlocProvider(create: (context) => di<GoalsCubit>()..init())
      ],
      child: const ScholarshipScreenView(),
    );
  }
}

class ScholarshipScreenView extends StatefulWidget {
  const ScholarshipScreenView({super.key});

  @override
  State<ScholarshipScreenView> createState() => _ScholarshipScreenViewState();
}

class _ScholarshipScreenViewState extends State<ScholarshipScreenView> {
  List<ScholarshipLevelClassModel> scholarshipLevelClass = [];

  List<ScholarshipLevelClassModel> getScholarshipLevelCLass(
      List<ScholarshipLevelAndClassModel> level) {
    Map<String, List<String>> map = {};
    for (final element in level) {
      if (map.containsKey(element.level)) {
        map[element.level]!.add(element.name);
      } else {
        map[element.level] = [element.name];
      }
    }
    return map.entries
        .map((entry) => ScholarshipLevelClassModel(
            id: entry.key, scholarshipName: entry.key, classes: entry.value))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
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
                        size: 16,
                      )),
                ),
                Text(
                  'Apply For Scholarship',
                  style: TextStyle(
                      fontSize: 18,
                      color: R.color.blueColor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Expanded(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  BlocBuilder<BannersCubit, HomePageBannersState>(
                    builder: (context, state) {
                      return state.top.map(
                        initial: (_) => const SizedBox.shrink(),
                        loading: (_) {
                          return SizedBox(
                            width: getSize(context).width - 32,
                            height: 180.0,
                            child: Shimmer.fromColors(
                              baseColor: R.color.surface,
                              highlightColor: Colors.grey,
                              child: Container(
                                width: 200.0,
                                height: 180.0,
                                color: R.color.surface,
                              ),
                            ),
                          );
                        },
                        loaded: (val) {
                          final images = val.data;
                          return CarouselSlider(
                            items: [
                              for (final imageData in images)
                                Container(
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    image: DecorationImage(
                                      image: NetworkImage(
                                          AppConfig.fileUrl + imageData.image),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                            ],
                            options: CarouselOptions(
                              viewportFraction: 1,
                              height: 180.0,
                              autoPlay: true,
                              autoPlayCurve: Curves.fastOutSlowIn,
                              enableInfiniteScroll: true,
                              autoPlayAnimationDuration:
                                  const Duration(milliseconds: 800),
                            ),
                          );
                        },
                        failure: (f) => Text(f.reason),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  BlocBuilder<GoalsCubit, GoalsCubitState>(
                    builder: (context, state) {
                      return state.level.maybeMap(
                        loading: (_) => const Center(
                            // grey colored tile for shimmer effect
                            child: SizedBox()),
                        loaded: (value) {
                          scholarshipLevelClass =
                              getScholarshipLevelCLass(value.data);
                          return Column(
                            children: [
                              for (final item in scholarshipLevelClass)
                                Container(
                                    width: getSize(context).width,
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          item.scholarshipName!,
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                              color: R.color.blueColor),
                                        ),
                                        SizedBox(height: 8),
                                        Wrap(
                                          children: [
                                            for (final v in item.classes!)
                                              GestureDetector(
                                                onTap: () {
                                                  di<GoRouter>().push(
                                                    ScholarShipListScreen
                                                        .routeName,
                                                    extra: v,
                                                  );
                                                },
                                                child: Container(
                                                    margin:
                                                        const EdgeInsets.only(
                                                            right: 8),
                                                    padding: const EdgeInsets
                                                            .symmetric(
                                                        horizontal: 8,
                                                        vertical: 8),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                        border: Border.all(
                                                            color: R.color
                                                                .greenColor,
                                                            width: 1.5)),
                                                    child: Text(
                                                      v,
                                                      style: TextStyle(
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: R
                                                              .color.blueColor),
                                                    )),
                                              )
                                          ],
                                        )
                                      ],
                                    ))
                            ],
                          );
                        },
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ],
              ),
            ))
          ],
        ),
      ),
    );
  }
}
