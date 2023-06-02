import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/app/app_config.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/presentation/goal/cubit/goals_cubit.dart';
import 'package:pollo_education/presentation/goal/view/widgets/goal_list_tile.dart';
import 'package:pollo_education/presentation/home/cubit/banners_cubit.dart';
import 'package:pollo_education/presentation/home/cubit/get_class_cubit.dart';
import 'package:pollo_education/presentation/scholarship/classses_screen.dart';
import 'package:pollo_education/presentation/scholarship/cubit/get_scholarship_by_class.dart';
import 'package:pollo_education/presentation/scholarship/scholarship_info_screen.dart';
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

class ScholarshipScreenView extends StatelessWidget {
  const ScholarshipScreenView({super.key});

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
                  'Scholarship',
                  style: TextStyle(
                      fontSize: 18,
                      color: R.color.blueColor,
                      fontWeight: FontWeight.w600),
                )
              ],
            ),
            Expanded(
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
                        return Column(
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
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
