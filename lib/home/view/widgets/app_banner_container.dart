import 'package:flutter/material.dart';
import 'package:pollo_education/home/view/widgets/app_banner_widget.dart';
import 'package:pollo_education/home/view/widgets/app_banners.dart';

class AppBannersContainer extends StatefulWidget {
  const AppBannersContainer({
    super.key,
    required this.banners,
    this.onTap,
  });

  final AppBanners banners;
  final VoidCallback? onTap;

  @override
  State<AppBannersContainer> createState() => _AppBannersContainerState();
}

class _AppBannersContainerState extends State<AppBannersContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.banners.header,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 8),
          Expanded(
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: widget.banners.banners.length,
              separatorBuilder: (context, _) {
                return const SizedBox(width: 8);
              },
              itemBuilder: (context, index) {
                final banner = widget.banners.banners[index];

                return AppBannerWidget(
                  banner: banner,
                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
