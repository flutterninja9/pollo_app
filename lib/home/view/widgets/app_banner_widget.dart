import 'package:flutter/material.dart';
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
    return Card(
      child: Container(
        width: 200.0,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.all(Radius.circular(10.0)),
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(8.0),
                topRight: Radius.circular(8.0),
              ),
              child: Image(
                image: NetworkImage(banner.imageUrl),
                fit: BoxFit.cover,
                height: 100.0,
                width: double.infinity,
              ),
            ),
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    banner.title,
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
