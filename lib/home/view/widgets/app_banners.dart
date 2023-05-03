import 'package:flutter/foundation.dart';

class AppBanners {
  final String header;
  final List<AppBanner> banners;

  AppBanners({
    required this.header,
    required this.banners,
  });

  @override
  String toString() => 'AppBanners(header: $header, banners: $banners)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppBanners &&
        other.header == header &&
        listEquals(other.banners, banners);
  }

  @override
  int get hashCode => header.hashCode ^ banners.hashCode;
}

class AppBanner {
  final String imageUrl;
  final String title;

  AppBanner({
    required this.imageUrl,
    required this.title,
  });

  @override
  String toString() => 'AppBanner(imageUrl: $imageUrl, title: $title)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppBanner &&
        other.imageUrl == imageUrl &&
        other.title == title;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ title.hashCode;
}
