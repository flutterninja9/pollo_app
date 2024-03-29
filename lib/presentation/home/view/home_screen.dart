import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/app/app_config.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/presentation/basic_education/basic_education_screem.dart';
import 'package:pollo_education/presentation/goal/view/screens/basic_course_screen.dart';
import 'package:pollo_education/presentation/goal/view/screens/select_goal_screen.dart';
import 'package:pollo_education/presentation/home/cubit/banners_cubit.dart';
import 'package:pollo_education/presentation/home/cubit/get_class_cubit.dart';
import 'package:pollo_education/presentation/home/view/widgets/app_banner_container.dart';
import 'package:pollo_education/presentation/home/view/widgets/app_banners.dart';
import 'package:pollo_education/presentation/home/view/widgets/app_option_widget.dart';
import 'package:pollo_education/presentation/profile/profile_screen.dart';
import 'package:pollo_education/presentation/scholarship/scholarship_screen.dart';
import 'package:pollo_education/utils/design_system/color.dart';
import 'package:pollo_education/utils/design_system/r.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di<BannersCubit>()..getBanners(),
        ),
        BlocProvider(
          create: (context) => di<GetClassCubit>(),
        ),
      ],
      child: const HomeScreenView(),
    );
  }
}

class HomeScreenView extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreenView({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenViewState();
}

class _HomeScreenViewState extends State<HomeScreenView> {
  late final ScrollController _scrollController;
  TextEditingController searchTextEditingController = TextEditingController();

  bool showSearchBar = false;
  PColor pColor = PColor.instance;
  bool showSelectState = false;

  final listOfAppOptions = <AppOptionContainer>[
    AppOptionContainer(
      label: "Scholarship",
      icon: Icons.school,
      routeName: ScholarShipScreen.routeName,
    ),
    AppOptionContainer(
        label: "Basic Education",
        icon: FontAwesomeIcons.school,
        routeName: BasicEduactionScreen.routeName),
    AppOptionContainer(
      label: "Computer Education",
      icon: FontAwesomeIcons.laptopCode,
    ),
    AppOptionContainer(
      label: "Result",
      icon: Icons.analytics,
    ),
    AppOptionContainer(
      label: "Learning",
      icon: Icons.book,
    ),
    AppOptionContainer(
      label: "Quiz",
      icon: Icons.computer,
    ),
    AppOptionContainer(
      label: "Digital Coaching",
      icon: Icons.table_chart,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {}

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSelectState = false;
        setState(() {});
      },
      child: Scaffold(
        backgroundColor: R.color.background,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(width: 16),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor: R.color.surface,
                            backgroundColor: R.color.blueColor),
                        onPressed: () {
                          di<GoRouter>().push(SelectGoalScreen.routeName);
                        },
                        child: Text("Select Goal"),
                      ),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          height: 30,
                          alignment: Alignment.center,
                          child: TextField(
                            controller: searchTextEditingController,
                            autofocus: false,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                            decoration: InputDecoration(
                                hintText: 'Start typing..',
                                hintStyle: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black.withOpacity(0.7),
                                    fontWeight: FontWeight.w500),
                                contentPadding: const EdgeInsets.only(left: 8),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent),
                                ),
                                suffixIcon: const Icon(Icons.search)),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          di<GoRouter>().push(ProfileScreen.routeName);
                        },
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  width: 1,
                                  color: R.color.blueColor.withOpacity(0.2))),
                          child: const Center(
                            child: Text(
                              'D',
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: R.color.backgroundColor,
                          border: Border(
                              bottom: BorderSide(
                                  width: 1,
                                  color: R.color.blueColor.withOpacity(0.2)))),
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            BlocBuilder<BannersCubit, HomePageBannersState>(
                              builder: (context, state) {
                                return state.top.map(
                                  initial: (_) => const SizedBox.shrink(),
                                  loading: (_) => const SizedBox.shrink(),
                                  loaded: (val) {
                                    final images = val.data;
                                    return CarouselSlider(
                                      items: [
                                        for (final imageData in images)
                                          Container(
                                            margin: const EdgeInsets.symmetric(
                                                horizontal: 16, vertical: 4),
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(8.0),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    AppConfig.fileUrl +
                                                        imageData.image),
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
                            Container(
                                height: 100,
                                margin: const EdgeInsets.only(
                                    left: 16, top: 16, bottom: 16),
                                alignment: Alignment.center,
                                child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: listOfAppOptions.length,
                                  itemBuilder: (context, index) {
                                    final option = listOfAppOptions[index];

                                    return AppOptionWidget(
                                      option: option,
                                      onTap: () {
                                        di<GoRouter>().push(option.routeName!);
                                      },
                                    );
                                  },
                                )),
                            BlocBuilder<BannersCubit, HomePageBannersState>(
                              builder: (context, state) {
                                return state.first.map(
                                  initial: (_) => SizedBox.fromSize(),
                                  loading: (_) => SizedBox.fromSize(),
                                  loaded: (value) {
                                    final images = value.data;
                                    return AppBannersContainer(
                                        banners: AppBanners.fromImages(
                                          "Scholarship",
                                          images,
                                        ),
                                        onClickSeeAll: () {});
                                  },
                                  failure: (f) => Text(f.reason),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            BlocBuilder<BannersCubit, HomePageBannersState>(
                              builder: (context, state) {
                                return state.second.map(
                                  initial: (_) => SizedBox.fromSize(),
                                  loading: (_) => SizedBox.fromSize(),
                                  loaded: (value) {
                                    final images = value.data;
                                    return AppBannersContainer(
                                        banners: AppBanners.fromImages(
                                          "State board",
                                          images,
                                        ),
                                        onClickSeeAll: () {});
                                  },
                                  failure: (f) => Text(f.reason),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                            BlocBuilder<BannersCubit, HomePageBannersState>(
                              builder: (context, state) {
                                return state.third.map(
                                  initial: (_) => SizedBox.fromSize(),
                                  loading: (_) => SizedBox.fromSize(),
                                  loaded: (value) {
                                    final images = value.data;
                                    return AppBannersContainer(
                                        banners: AppBanners.fromImages(
                                          "Computer Education",
                                          images,
                                        ),
                                        onClickSeeAll: () {});
                                  },
                                  failure: (f) => Text(f.reason),
                                );
                              },
                            ),
                            const SizedBox(height: 16),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AppOptionContainer {
  final String label;
  final IconData icon;
  String? routeName;

  AppOptionContainer({
    required this.label,
    required this.icon,
    this.routeName,
  });

  @override
  String toString() =>
      'AppOptionContainer(label: $label, icon: $icon,routeName:$routeName)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppOptionContainer &&
        other.label == label &&
        other.icon == icon;
  }

  @override
  int get hashCode => label.hashCode ^ icon.hashCode;
}
