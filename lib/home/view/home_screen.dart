import 'package:banner_carousel/banner_carousel.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pollo_education/app/app_routes.dart';
import 'package:pollo_education/home/view/widgets/app_action.dart';
import 'package:pollo_education/home/view/widgets/app_actions_widget.dart';
import 'package:pollo_education/home/view/widgets/app_option.dart';
import 'package:pollo_education/home/view/widgets/app_option_widget.dart';
import 'package:pollo_education/home/view/widgets/custom_search_delegate.dart';
import 'package:pollo_education/profile/profile_screen.dart';

class HomeScreen extends ConsumerStatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  late final ScrollController _scrollController;
  int currentIndex = 0;
  final bannersImages = [
    BannerModel(
      id: "1",
      imagePath:
          'https://cdn.pixabay.com/photo/2015/11/16/14/43/cat-1045782__340.jpg',
    ),
    BannerModel(
      id: "2",
      imagePath:
          'https://cdn.pixabay.com/photo/2015/11/16/14/43/cat-1045782__340.jpg',
    ),
    BannerModel(
      id: "3",
      imagePath:
          'https://cdn.pixabay.com/photo/2015/11/16/14/43/cat-1045782__340.jpg',
    ),
    BannerModel(
      id: "4",
      imagePath:
          'https://cdn.pixabay.com/photo/2015/11/16/14/43/cat-1045782__340.jpg',
    ),
  ];

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

  void changeIndex(int index) {
    setState(() {
      currentIndex = index;
    });
  }

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
      bottomNavigationBar: BottomNavigationBar(
        onTap: changeIndex,
        currentIndex: currentIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business),
            label: 'B2B',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'B2C',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business_center),
            label: 'Enterpreneur',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'My Courses',
          ),
        ],
      ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            elevation: 0,
            title: Text(
              'Pollo Education',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge
                  ?.copyWith(color: Theme.of(context).colorScheme.onBackground),
            ),
            centerTitle: true,
            pinned: true,
            leadingWidth: 100,
            leading: IconButton(
              onPressed: () {},
              icon: const Text('Select Goal'),
            ),
            actions: [
              IconButton(
                onPressed: () async {
                  final result = await showSearch(
                    context: context,
                    delegate: CustomSearchDelegate(),
                  );
                },
                icon: const Icon(Icons.search_rounded),
              ),
              IconButton(
                onPressed: () {
                  ref.read(goRouterProvider).push(ProfileScreen.routeName);
                },
                icon: const Icon(Icons.person_outline),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: BannerCarousel(
              banners: bannersImages,
              customizedIndicators: const IndicatorModel.animation(
                width: 10,
                height: 5,
                spaceBetween: 2,
                widthAnimation: 20,
              ),
              height: 120,
              activeColor: Theme.of(context).colorScheme.secondary,
              disableColor: Theme.of(context).colorScheme.onSecondary,
              animation: true,
              borderRadius: 10,
              width: 250,
              indicatorBottom: false,
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 16),
            sliver: SliverToBoxAdapter(
              child: SizedBox(
                height: 100.0,
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
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            sliver: SliverToBoxAdapter(
              child: AppActionsWidget(action: recommendedAppAction),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            sliver: SliverToBoxAdapter(
              child: AppActionsWidget(action: newlyReleased),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            sliver: SliverToBoxAdapter(
              child: AppActionsWidget(action: recommendedAppAction),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.only(left: 12.0, right: 12.0),
            sliver: SliverToBoxAdapter(
              child: AppActionsWidget(action: newlyReleased),
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
