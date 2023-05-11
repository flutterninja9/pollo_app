// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/foundation.dart';
import 'package:pollo_education/home/view/widgets/app_action.dart';
import 'package:pollo_education/home/view/widgets/app_banners.dart';
import 'package:pollo_education/home/view/widgets/app_option.dart';

class HomeState {
  final List<AppOption> appOptions;
  final AppActions recommendedAppActions;
  final AppActions newlyReleasedAppAction;
  final AppBanners appBannersOne;
  final AppBanners appBannersTwo;
  final AppBanners appBannersThree;
  final AppBanners appBannersFour;

  HomeState({
    required this.appOptions,
    required this.recommendedAppActions,
    required this.newlyReleasedAppAction,
    required this.appBannersOne,
    required this.appBannersTwo,
    required this.appBannersThree,
    required this.appBannersFour,
  });

  factory HomeState.initial() {
    return HomeState(
      appOptions: [
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
      ],
      recommendedAppActions: AppActions(
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
          ]),
      newlyReleasedAppAction: AppActions(
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
          ]),
      appBannersOne: AppBanners(
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
      ),
      appBannersTwo: AppBanners(
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
      ),
      appBannersThree: AppBanners(
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
      ),
      appBannersFour: AppBanners(
        header: "Something special for you",
        banners: [
          AppBanner(
              imageUrl:
                  'https://images.unsplash.com/photo-1497864149936-d3163f0c0f4b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTh8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
              title: "General Knowledge",
              subTitle: '10 videos'),
          AppBanner(
              imageUrl:
                  'https://plus.unsplash.com/premium_photo-1663126346116-f0ccaf232268?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MzF8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
              title: "General Knowledge",
              subTitle: '10 videos'),
          AppBanner(
              imageUrl:
                  'https://images.unsplash.com/photo-1524178232363-1fb2b075b655?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MjF8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
              title: "General Knowledge",
              subTitle: '10 videos'),
          AppBanner(
              imageUrl:
                  'https://images.unsplash.com/photo-1603354350317-6f7aaa5911c5?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjd8fGVkdWNhdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60',
              title: "General Knowledge",
              subTitle: '10 videos'),
        ],
      ),
    );
  }

  HomeState copyWith({
    List<AppOption>? appOptions,
    AppActions? recommendedAppActions,
    AppActions? newlyReleasedAppAction,
    AppBanners? appBannersOne,
    AppBanners? appBannersTwo,
    AppBanners? appBannersThree,
    AppBanners? appBannersFour,
  }) {
    return HomeState(
      appOptions: appOptions ?? this.appOptions,
      recommendedAppActions:
          recommendedAppActions ?? this.recommendedAppActions,
      newlyReleasedAppAction:
          newlyReleasedAppAction ?? this.newlyReleasedAppAction,
      appBannersOne: appBannersOne ?? this.appBannersOne,
      appBannersTwo: appBannersTwo ?? this.appBannersTwo,
      appBannersThree: appBannersThree ?? this.appBannersThree,
      appBannersFour: appBannersFour ?? this.appBannersFour,
    );
  }

  @override
  String toString() {
    return 'HomeState(appOptions: $appOptions, recommendedAppActions: $recommendedAppActions, newlyReleasedAppAction: $newlyReleasedAppAction, appBannersOne: $appBannersOne, appBannersTwo: $appBannersTwo, appBannersThree: $appBannersThree, appBannersFour: $appBannersFour)';
  }

  @override
  bool operator ==(covariant HomeState other) {
    if (identical(this, other)) return true;

    return listEquals(other.appOptions, appOptions) &&
        other.recommendedAppActions == recommendedAppActions &&
        other.newlyReleasedAppAction == newlyReleasedAppAction &&
        other.appBannersOne == appBannersOne &&
        other.appBannersTwo == appBannersTwo &&
        other.appBannersThree == appBannersThree &&
        other.appBannersFour == appBannersFour;
  }

  @override
  int get hashCode {
    return appOptions.hashCode ^
        recommendedAppActions.hashCode ^
        newlyReleasedAppAction.hashCode ^
        appBannersOne.hashCode ^
        appBannersTwo.hashCode ^
        appBannersThree.hashCode ^
        appBannersFour.hashCode;
  }
}
