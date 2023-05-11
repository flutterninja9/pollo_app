import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pollo_education/app/app_routes.dart';
import 'package:pollo_education/design_system/color.dart';
import 'package:pollo_education/design_system/r.dart';
import 'package:pollo_education/home/controller/home_controller.dart';
import 'package:pollo_education/home/view/widgets/app_banner_container.dart';
import 'package:pollo_education/home/view/widgets/app_option_widget.dart';
import 'package:pollo_education/profile/profile_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
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
    return Scaffold(
      backgroundColor: R.color.background,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: R.color.background,
              child: Column(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 4),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  showSelectState = !showSelectState;
                                  setState(() {});
                                },
                                child: Row(
                                  children: [
                                    FaIcon(
                                      FontAwesomeIcons.locationArrow,
                                      color: R.color.blueColor,
                                    ),
                                    const SizedBox(width: 20),
                                    Text(
                                      'Bihar',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 20,
                                          color: R.color.onSurface),
                                    ),
                                    showSelectState
                                        ? Icon(Icons.arrow_drop_up,
                                            color: R.color.blueColor)
                                        : Icon(Icons.arrow_drop_down,
                                            color: R.color.blueColor),
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                ref
                                    .read(goRouterProvider)
                                    .push(ProfileScreen.routeName);
                              },
                              child: Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        width: 1,
                                        color: R.color.blueColor
                                            .withOpacity(0.2))),
                                child: const Center(
                                  child: Text(
                                    'D',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        height: showSelectState ? 50 : 0,
                        padding: const EdgeInsets.symmetric(vertical: 4),
                        margin: const EdgeInsets.only(left: 8, bottom: 8),
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 28,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: const EdgeInsets.only(right: 6),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 4, horizontal: 6),
                                decoration: BoxDecoration(
                                    color: R.color.blueColor,
                                    borderRadius: BorderRadius.circular(8)),
                                child: Center(
                                  child: Text(
                                    'Uttar Pradesh',
                                    style: TextStyle(
                                        color: R.color.background,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ),
                              );
                            }),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 24),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(
                                width: 1,
                                color: R.color.blueColor.withOpacity(0.4))),
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.magnifyingGlass,
                                color: R.color.blueColor, size: 20),
                            Expanded(
                              child: TextField(
                                controller: searchTextEditingController,
                                style: const TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500),
                                decoration: InputDecoration(
                                  hintText: 'Start typing..',
                                  hintStyle: TextStyle(
                                      fontSize: 14,
                                      color: Colors.black.withOpacity(0.7),
                                      fontWeight: FontWeight.w400),
                                  contentPadding:
                                      const EdgeInsets.only(left: 8),
                                  enabledBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: R.color.backgroundColor,
                    border: Border(
                        top: BorderSide(
                            width: 1,
                            color: R.color.blueColor.withOpacity(0.2)),
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
                        child: Consumer(
                          builder: (context, ref, child) {
                            return ref.watch(homeProvider).map(
                                  data: (data) {
                                    final appOptions = data.value.appOptions;
                                    return ListView.builder(
                                      scrollDirection: Axis.horizontal,
                                      itemCount: appOptions.length,
                                      itemBuilder: (context, index) {
                                        final appOption = appOptions[index];

                                        return AppOptionWidget(
                                            appOption: appOption);
                                      },
                                    );
                                  },
                                  error: (_) {
                                    return const Text('Error');
                                  },
                                  loading: (_) =>
                                      const CircularProgressIndicator(),
                                );
                          },
                        ),
                      ),
                      CarouselSlider(
                        items: [
                          Container(
                            margin: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.0),
                              image: const DecorationImage(
                                image: NetworkImage(
                                    "https://plus.unsplash.com/premium_photo-1661767552224-ef72bb6b671f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTN8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60"),
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
                      ),
                      const SizedBox(height: 16),
                      Consumer(
                        builder: (context, ref, child) {
                          return ref.watch(homeProvider).map(
                                data: (data) {
                                  final appBannersOne =
                                      data.value.appBannersOne;
                                  return Container(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: AppBannersContainer(
                                      banners: appBannersOne,
                                      onClickSeeAll: () {},
                                    ),
                                  );
                                },
                                error: (_) {
                                  return const Text('Error');
                                },
                                loading: (_) =>
                                    const CircularProgressIndicator(),
                              );
                        },
                      ),
                      const SizedBox(height: 16),
                      Consumer(
                        builder: (context, ref, child) {
                          return ref.watch(homeProvider).map(
                                data: (data) {
                                  final appBannersTwo =
                                      data.value.appBannersTwo;
                                  return Container(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: AppBannersContainer(
                                      banners: appBannersTwo,
                                      onClickSeeAll: () {},
                                    ),
                                  );
                                },
                                error: (_) {
                                  return const Text('Error');
                                },
                                loading: (_) =>
                                    const CircularProgressIndicator(),
                              );
                        },
                      ),
                      const SizedBox(height: 16),
                      Consumer(
                        builder: (context, ref, child) {
                          return ref.watch(homeProvider).map(
                                data: (data) {
                                  final appBannersThree =
                                      data.value.appBannersThree;
                                  return Container(
                                    padding: const EdgeInsets.only(left: 16),
                                    child: AppBannersContainer(
                                      banners: appBannersThree,
                                      onClickSeeAll: () {},
                                    ),
                                  );
                                },
                                error: (_) {
                                  return const Text('Error');
                                },
                                loading: (_) =>
                                    const CircularProgressIndicator(),
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
      ),
    );
  }
}
