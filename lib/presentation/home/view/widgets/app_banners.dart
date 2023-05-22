import 'package:flutter/foundation.dart';
import 'package:pollo_education/app/app_config.dart';
import 'package:pollo_education/models/banner_model.dart';

class AppBanners {
  final String header;
  final List<AppBanner> banners;

  AppBanners({
    required this.header,
    required this.banners,
  });

  factory AppBanners.fromImages(String header, List<BannerModel> images) {
    return AppBanners(
        header: header,
        banners: images.map((e) => AppBanner.fromBannerModel(e)).toList());
  }

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
  final String? id;
  final String? imageUrl;
  final String? title;
  final String? subTitle;

  AppBanner({
    this.id,
    this.subTitle,
    this.imageUrl,
    this.title,
  });

  factory AppBanner.fromBannerModel(BannerModel banner) {
    return AppBanner(
      imageUrl: AppConfig.fileUrl + banner.image,
      title: banner.category,
      subTitle: banner.caption,
    );
  }

  @override
  String toString() =>
      'AppBanner(imageUrl: $imageUrl, title: $title,subTitle:$subTitle,id:$id)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is AppBanner &&
        other.imageUrl == imageUrl &&
        other.title == title &&
        other.subTitle == subTitle &&
        other.id == id;
  }

  @override
  int get hashCode => imageUrl.hashCode ^ title.hashCode;
}
