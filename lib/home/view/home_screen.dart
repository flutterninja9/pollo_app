import 'package:better_player/better_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pollo_education/app/app_routes.dart';
import 'package:pollo_education/design_system/color.dart';
import 'package:pollo_education/home/view/widgets/app_action.dart';
import 'package:pollo_education/home/view/widgets/app_actions_container.dart';
import 'package:pollo_education/home/view/widgets/app_banner_container.dart';
import 'package:pollo_education/home/view/widgets/app_banners.dart';
import 'package:pollo_education/home/view/widgets/app_option.dart';
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

  final appOptions = <AppOption>[
    AppOption(
      label: "Scholarship",
      imagePath: '',
      enabled: true,
      routeName: '/scholarship',
    ),
    AppOption(
      label: "Learning",
      imagePath: '',
      routeName: '/learning',
      enabled: true,
    ),
    AppOption(
      label: "Quiz",
      imagePath: '',
      routeName: '/quiz',
      enabled: true,
    ),
    AppOption(
      label: "Digital Coaching Center",
      imagePath: '',
      routeName: '/scholarship',
      enabled: true,
    ),
    AppOption(
      label: "Results",
      imagePath: '',
      routeName: '/results',
      enabled: true,
    ),
  ];

  final recommendedAppAction = AppActions(
      label: "Recommended Subjects",
      onTapSeeAll: () {},
      appActions: [
        AppAction(
          label: "Scholarship",
          imagePath:
              'https://images.unsplash.com/photo-1583468982228-19f19164aee2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHRlYWNoZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
          enabled: true,
          routeName: '/scholarship',
        ),
        AppAction(
          label: "Learning",
          imagePath:
              'https://images.unsplash.com/photo-1573496799652-408c2ac9fe98?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHRlYWNoZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
          routeName: '/learning',
          enabled: true,
        ),
        AppAction(
          label: "Quiz",
          imagePath:
              'https://images.unsplash.com/photo-1573166364524-d9dbfd8bbf83?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fHRlYWNoZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
          routeName: '/quiz',
          enabled: true,
        ),
        AppAction(
          label: "Digital Coaching Center",
          imagePath:
              'https://images.unsplash.com/photo-1590650213165-c1fef80648c4?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fHRlYWNoZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
          routeName: '/scholarship',
          enabled: true,
        ),
        AppAction(
          label: "Results",
          imagePath:
              'https://images.unsplash.com/photo-1597570889212-97f48e632dad?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fHRlYWNoZXJ8ZW58MHx8MHx8&auto=format&fit=crop&w=800&q=60',
          routeName: '/results',
          enabled: true,
        ),
      ]);

  final newlyReleased = AppActions(
      label: "Newly Released Subjects",
      onTapSeeAll: () {},
      appActions: [
        AppAction(
          label: "Scholarship",
          imagePath:
              'https://images.unsplash.com/photo-1580894732444-8ecded7900cd?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8dGVhY2hlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
          enabled: true,
          routeName: '/scholarship',
        ),
        AppAction(
          label: "Learning",
          imagePath:
              'https://plus.unsplash.com/premium_photo-1681248156422-c01a2c803588?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dGVhY2hlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
          routeName: '/learning',
          enabled: true,
        ),
        AppAction(
          label: "Quiz",
          imagePath:
              'https://images.unsplash.com/photo-1577896851231-70ef18881754?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8dGVhY2hlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
          routeName: '/quiz',
          enabled: true,
        ),
        AppAction(
          label: "Digital Coaching Center",
          imagePath:
              'https://images.unsplash.com/photo-1590402494682-cd3fb53b1f70?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8dGVhY2hlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
          routeName: '/scholarship',
          enabled: true,
        ),
        AppAction(
          label: "Results",
          imagePath:
              'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8OXx8dGVhY2hlcnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
          routeName: '/results',
          enabled: true,
        ),
      ]);

  final appBannersOne = AppBanners(
    header: "Explore Summer Offers",
    banners: [
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1497633762265-9d179a990aa6?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1524995997946-a1c2e315a42f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1532012197267-da84d127e765?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl: 'https://picsum.photos/seed/picsum/200/300',
        title: "Check out now!",
      ),
    ],
  );

  final appBannersTwo = AppBanners(
    header: "Offers only for you",
    banners: [
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1546410531-bb4caa6b424d?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1522202176988-66273c2fd55f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NXx8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1681248156365-cbe0295dbbe0?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
    ],
  );

  final appBannersThree = AppBanners(
    header: "Check out these offers",
    banners: [
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1580582932707-520aed937b7b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTV8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1661767552224-ef72bb6b671f?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTl8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1581078426770-6d336e5de7bf?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTZ8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1454165804606-c3d57bc86b40?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjB8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
    ],
  );

  final appBannersFour = AppBanners(
    header: "Something special for you",
    banners: [
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1497864149936-d3163f0c0f4b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://plus.unsplash.com/premium_photo-1663126346116-f0ccaf232268?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
      AppBanner(
        imageUrl:
            'https://images.unsplash.com/photo-1603354350317-6f7aaa5911c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
        title: "Check out now!",
      ),
    ],
  );

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
      backgroundColor: Theme.of(context).canvasColor,
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            title: showSearchBar
                ? TextField(
                    controller: searchTextEditingController,
                    style: const TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500),
                    autofocus: true,
                    decoration: InputDecoration(
                      hintText: 'Start typing..',
                      hintStyle: TextStyle(
                          fontSize: 16,
                          color: Colors.black.withOpacity(0.7),
                          fontWeight: FontWeight.w400),
                      contentPadding: const EdgeInsets.only(left: 0),
                      enabledBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: const UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    ),
                  )
                : Text(
                    "Polo Education",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
            pinned: true,
            leading: IconButton(
              onPressed: () {
                ref.read(goRouterProvider).push(ProfileScreen.routeName);
              },
              icon: const CircleAvatar(
                radius: 18,
                backgroundColor: Color.fromRGBO(96, 196, 176, 1),
                child: Text(
                  'D',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w600),
                ),
              ),
            ),
            actions: [
              showSearchBar
                  ? IconButton(
                      onPressed: () async {
                        searchTextEditingController.clear();
                        showSearchBar = false;
                        setState(() {});
                      },
                      icon: const Icon(
                        Icons.close,
                        color: Colors.black,
                      ),
                    )
                  : IconButton(
                      onPressed: () async {
                        setState(() {
                          showSearchBar = true;
                        });
                      },
                      icon: const Icon(
                        Icons.search_rounded,
                        color: Colors.black,
                      ),
                    ),
            ],
          ),
          SliverToBoxAdapter(
              child: CarouselSlider(
            items: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
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
              autoPlayAnimationDuration: const Duration(milliseconds: 800),
            ),
          )),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 24),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: 40,
                alignment: Alignment.center,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: appOptions.length,
                  itemBuilder: (context, index) {
                    final appOption = appOptions[index];

                    return AppOptionWidget(appOption: appOption);
                  },
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 24),
            sliver: SliverToBoxAdapter(
              child: AppActionsContainer(action: recommendedAppAction),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16),
            sliver: SliverToBoxAdapter(
              child: AppBannersContainer(banners: appBannersOne),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16),
            sliver: SliverToBoxAdapter(
              child: AppActionsContainer(
                action: newlyReleased,
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: BetterPlayer.network(
                              "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
                              betterPlayerConfiguration:
                                  const BetterPlayerConfiguration(
                                aspectRatio: 16 / 9,
                              ),
                            ),
                          ),
                        );
                      });
                },
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16),
            sliver: SliverToBoxAdapter(
              child: AppBannersContainer(banners: appBannersTwo),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16),
            sliver: SliverToBoxAdapter(
              child: AppActionsContainer(action: recommendedAppAction),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16),
            sliver: SliverToBoxAdapter(
              child: AppBannersContainer(banners: appBannersThree),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16),
            sliver: SliverToBoxAdapter(
              child: AppActionsContainer(action: newlyReleased),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(height: 16),
          ),
        ],
      ),
    );
  }
}
