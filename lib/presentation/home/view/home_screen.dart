import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/app/app_config.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/models/class_model.dart';
import 'package:pollo_education/presentation/home/cubit/banners_cubit.dart';
import 'package:pollo_education/presentation/home/cubit/get_class_cubit.dart';
import 'package:pollo_education/presentation/home/view/class_detail_screen.dart';
import 'package:pollo_education/presentation/home/view/widgets/app_banner_container.dart';
import 'package:pollo_education/presentation/home/view/widgets/app_banners.dart';
import 'package:pollo_education/presentation/home/view/widgets/app_option_widget.dart';
import 'package:pollo_education/presentation/profile/profile_screen.dart';
import 'package:pollo_education/presentation/scholarship/scholarship_screen.dart';
import 'package:pollo_education/utils/asyncValue/async_value.dart';
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
          create: (context) => di<GetClassCubit>()..getSubjectListByBoardName(),
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
                      IconButton(
                        onPressed: () {
                          showSelectState = !showSelectState;
                          setState(() {});
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.bullseye,
                          color: R.color.blueColor,
                        ),
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
                            Container(
                                height: 40,
                                margin: const EdgeInsets.only(
                                    left: 16, top: 16, bottom: 16),
                                alignment: Alignment.center,
                                child: BlocBuilder<GetClassCubit,
                                        AsyncValue<List<ClassModel>>>(
                                    builder: (context, state) {
                                  return state.map(
                                      initial: (_) => const SizedBox(),
                                      loading: (_) => const SizedBox(),
                                      loaded: (value) {
                                        return ListView.builder(
                                          scrollDirection: Axis.horizontal,
                                          itemCount: value.data.length,
                                          itemBuilder: (context, index) {
                                            final classData = value.data[index];

                                            return AppOptionWidget(
                                              classData: classData,
                                              onTap: (course) {
                                                di<GoRouter>().push(
                                                  "${ClassDetailScreen.routeName}?course-id=${course.courseId}",
                                                );
                                              },
                                            );
                                          },
                                        );
                                      },
                                      failure: (e) => Text(e.reason));
                                })),
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
                            BlocBuilder<BannersCubit, HomePageBannersState>(
                              builder: (context, state) {
                                return state.first.map(
                                  initial: (_) => SizedBox.fromSize(),
                                  loading: (_) => SizedBox.fromSize(),
                                  loaded: (value) {
                                    return Container(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AppBannersContainer(
                                        banners: AppBanners.fromImages(
                                            "Heading One", value.data),
                                        onClickSeeAll: () {},
                                      ),
                                    );
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
                                    return Container(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AppBannersContainer(
                                        banners: AppBanners.fromImages(
                                            "Heading One", value.data),
                                        onClickSeeAll: () {},
                                      ),
                                    );
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
                                    return Container(
                                      padding: const EdgeInsets.only(left: 16),
                                      child: AppBannersContainer(
                                        banners: AppBanners.fromImages(
                                            "Heading One", value.data),
                                        onClickSeeAll: () {},
                                      ),
                                    );
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
              showSelectState
                  ? Container(
                      padding: const EdgeInsets.all(16),
                      margin:
                          const EdgeInsets.only(left: 36, top: 36, right: 130),
                      decoration: BoxDecoration(
                          color: R.color.greenColor,
                          borderRadius: BorderRadius.circular(6),
                          boxShadow: [
                            BoxShadow(
                                color: R.color.greenColor.withOpacity(0.4),
                                blurRadius: 200,
                                spreadRadius: 2)
                          ]),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          goalTile(
                              title: "Learning",
                              icon: FontAwesomeIcons.graduationCap,
                              onTap: () {
                                showSelectState = false;
                                setState(() {});
                              }),
                          goalTile(
                            title: 'Scholarship',
                            icon: FontAwesomeIcons.teamspeak,
                            onTap: () {
                              di<GoRouter>().push(ScholarShipScreen.routeName);
                              showSelectState = false;
                              setState(() {});
                            },
                          ),
                        ],
                      ),
                    )
                  : const SizedBox()
            ],
          ),
        ),
      ),
    );
  }

  Widget goalTile(
      {required String title,
      required IconData icon,
      required VoidCallback onTap}) {
    return TextButton(
      onPressed: onTap,
      child: Row(
        children: [
          FaIcon(
            icon,
            color: R.color.surface,
          ),
          const SizedBox(width: 8),
          Text(
            title,
            style: TextStyle(
                color: R.color.surface,
                fontSize: 18,
                fontWeight: FontWeight.w500),
          )
        ],
      ),
    );
  }
}
