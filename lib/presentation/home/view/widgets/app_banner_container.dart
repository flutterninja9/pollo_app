import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:pollo_education/presentation/home/view/widgets/app_banners.dart';

class AppBannersContainer extends StatefulWidget {
  const AppBannersContainer({
    super.key,
    required this.banners,
    required this.onClickSeeAll,
  });

  final AppBanners banners;
  final VoidCallback onClickSeeAll;

  @override
  State<AppBannersContainer> createState() => _AppBannersContainerState();
}

class _AppBannersContainerState extends State<AppBannersContainer> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      // height: 180.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  widget.banners.header,
                  style: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onTap: widget.onClickSeeAll,
                child: Container(
                  margin: const EdgeInsets.all(8),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                      color: const Color.fromRGBO(96, 196, 176, 1),
                      borderRadius: BorderRadius.circular(20)),
                  child: const Text(
                    'See All',
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.w600),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 8),
          CarouselSlider(
            items: [
              for (final imageData in widget.banners.banners)
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    image: DecorationImage(
                      image: NetworkImage(imageData.imageUrl!),
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
          )
          // Expanded(
          //   child: ListView.separated(
          //     scrollDirection: Axis.horizontal,
          //     itemCount: widget.banners.banners.length,
          //     separatorBuilder: (context, _) {
          //       return const SizedBox(width: 0);
          //     },
          //     itemBuilder: (context, index) {
          //       final banner = widget.banners.banners[index];

          //       return AppBannerWidget(
          //         banner: banner,
          //         onTap: () {
          //           di<GoRouter>().push(SubjectDetailScreen.routeName);
          //         },
          //       );
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
