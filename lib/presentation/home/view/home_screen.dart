import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pollo_education/app/app_routes.dart';
import 'package:pollo_education/design_system/color.dart';
import 'package:pollo_education/design_system/r.dart';
import 'package:pollo_education/home/view/widgets/app_banner_container.dart';
import 'package:pollo_education/home/view/widgets/app_banners.dart';
import 'package:pollo_education/home/view/widgets/app_option_widget.dart';
import 'package:pollo_education/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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

  final appBannerOne = AppBanners(
    header: "Recommended Subjects",
    banners: [
      AppBanner(
          imageUrl:
              'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
      AppBanner(
          imageUrl:
              'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
      AppBanner(
          imageUrl:
              'https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
      AppBanner(
          imageUrl: 'https://picsum.photos/seed/picsum/200/300',
          title: "General Knowledge",
          subTitle: '10 videos'),
    ],
  );
  final appBannersTwo = AppBanners(
    header: "Newly Released Subjects",
    banners: [
      AppBanner(
          imageUrl:
              'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
      AppBanner(
          imageUrl:
              'https://images.unsplash.com/photo-1546410531-bb4caa6b424d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
      AppBanner(
          imageUrl:
              'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
      AppBanner(
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1681248156365-cbe0295dbbe0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
    ],
  );
  final appBannersThree = AppBanners(
    header: "Check out these offers",
    banners: [
      AppBanner(
          imageUrl:
              'https://images.unsplash.com/photo-1580582932707-520aed937b7b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
      AppBanner(
          imageUrl:
              'https://plus.unsplash.com/premium_photo-1661767552224-ef72bb6b671f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
      AppBanner(
          imageUrl:
              'https://images.unsplash.com/photo-1581078426770-6d336e5de7bf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
      AppBanner(
          imageUrl:
              'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
          title: "General Knowledge",
          subTitle: '10 videos'),
    ],
  );

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
                                // ref
                                //     .read(goRouterProvider)
                                //     .push(ProfileScreen.routeName);
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
                      // Container(
                      //   height: 40,
                      //   margin: const EdgeInsets.only(
                      //       left: 16, top: 16, bottom: 16),
                      //   alignment: Alignment.center,
                      //   child: ListView.builder(
                      //     scrollDirection: Axis.horizontal,
                      //     itemCount: appOptions.length,
                      //     itemBuilder: (context, index) {
                      //       final appOption = appOptions[index];

                      //       return AppOptionWidget(appOption: appOption);
                      //     },
                      //   ),
                      // ),
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
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: AppBannersContainer(
                          banners: appBannerOne,
                          onClickSeeAll: () {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: AppBannersContainer(
                          banners: appBannersTwo,
                          onClickSeeAll: () {},
                        ),
                      ),
                      const SizedBox(height: 16),
                      Container(
                        padding: const EdgeInsets.only(left: 16),
                        child: AppBannersContainer(
                          banners: appBannersThree,
                          onClickSeeAll: () {},
                        ),
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
