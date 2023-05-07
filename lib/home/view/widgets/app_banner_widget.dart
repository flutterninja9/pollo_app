import 'package:flutter/material.dart';
import 'package:pollo_education/design_system/r.dart';
import 'package:pollo_education/home/view/widgets/app_banners.dart';

class AppBannerWidget extends StatelessWidget {
  const AppBannerWidget({
    super.key,
    required this.banner,
    required this.onTap,
  });

  final AppBanner banner;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.only(right: 16),
          width: 250.0,
          decoration: BoxDecoration(
            color: R.color.blueColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.all(16),
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      image: NetworkImage(banner.imageUrl!), fit: BoxFit.cover),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 24),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 1,
                            color: R.color.greenColor,
                            width: 60,
                          ),
                          Text(
                            banner.title ?? '',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                color: R.color.surface),
                          ),
                        ],
                      ),
                      Text(
                        banner.subTitle ?? '',
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                            color: R.color.surface.withOpacity(0.7)),
                      ),
                    ],
                  ),
                ),
              ),
              IconButton(
                onPressed: onTap,
                icon: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 6, vertical: 12),
                  decoration: BoxDecoration(
                      color: R.color.greenColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(6)),
                  child: Icon(
                    Icons.arrow_forward_ios,
                    color: R.color.surface,
                    size: 10,
                  ),
                ),
              )
            ],
          )),
    );
  }
}
