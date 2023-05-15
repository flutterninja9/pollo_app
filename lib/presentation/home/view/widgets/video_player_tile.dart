import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pollo_education/design_system/r.dart';

class VideoPlayerTile extends StatelessWidget {
  const VideoPlayerTile(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.subTitle,
      required this.onClickPlay});

  final String imgUrl;
  final String title;
  final String subTitle;
  final VoidCallback onClickPlay;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: R.color.surface.withOpacity(0.5))),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: NetworkImage(imgUrl), fit: BoxFit.cover),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      color: R.color.surface,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 8),
                Text(
                  subTitle,
                  style: TextStyle(
                      color: R.color.surface,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ),
          IconButton(
              onPressed: onClickPlay,
              icon: FaIcon(
                FontAwesomeIcons.play,
                color: R.color.greenColor,
              ))
        ],
      ),
    );
  }
}
