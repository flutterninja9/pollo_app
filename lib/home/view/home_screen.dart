import 'package:better_player/better_player.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pollo_education/app/app_routes.dart';
import 'package:pollo_education/design_system/color.dart';
import 'package:pollo_education/home/view/widgets/app_action.dart';
import 'package:pollo_education/home/view/widgets/app_actions_container.dart';
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
          imagePath: '',
          enabled: true,
          routeName: '/scholarship',
        ),
        AppAction(
          label: "Learning",
          imagePath: '',
          routeName: '/learning',
          enabled: true,
        ),
        AppAction(
          label: "Quiz",
          imagePath: '',
          routeName: '/quiz',
          enabled: true,
        ),
        AppAction(
          label: "Digital Coaching Center",
          imagePath: '',
          routeName: '/scholarship',
          enabled: true,
        ),
        AppAction(
          label: "Results",
          imagePath: '',
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
          imagePath: '',
          enabled: true,
          routeName: '/scholarship',
        ),
        AppAction(
          label: "Learning",
          imagePath: '',
          routeName: '/learning',
          enabled: true,
        ),
        AppAction(
          label: "Quiz",
          imagePath: '',
          routeName: '/quiz',
          enabled: true,
        ),
        AppAction(
          label: "Digital Coaching Center",
          imagePath: '',
          routeName: '/scholarship',
          enabled: true,
        ),
        AppAction(
          label: "Results",
          imagePath: '',
          routeName: '/results',
          enabled: true,
        ),
      ]);

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
      backgroundColor: Color.fromRGBO(248, 250, 251, 1),
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
                      hintText: 'start typing..',
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
                : const SizedBox(),
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
                                  BetterPlayerConfiguration(
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
              child: AppActionsContainer(action: recommendedAppAction),
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
