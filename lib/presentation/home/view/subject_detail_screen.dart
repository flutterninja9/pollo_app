import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';
import 'package:pollo_education/di.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:pollo_education/presentation/home/view/widgets/video_player_tile.dart';

class SubjectDetailScreen extends StatelessWidget {
  const SubjectDetailScreen({super.key});
  static const routeName = '/subject-detail';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(
                  height: 200,
                  alignment: Alignment.bottomCenter,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    'assets/Blogging-bro.png',
                    fit: BoxFit.cover,
                    width: MediaQuery.of(context).size.width / 1.4,
                    alignment: Alignment.center,
                  ),
                ),
                Expanded(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: R.color.blueColor,
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.only(top: 24, bottom: 4),
                            height: 1,
                            width: 100,
                            color: R.color.greenColor,
                          ),
                          Text(
                            'General Knowledge',
                            style: TextStyle(
                                color: R.color.surface.withOpacity(0.6),
                                fontSize: 14,
                                fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'General Knowledge is the base of anything.',
                            style: TextStyle(
                                color: R.color.surface,
                                fontSize: 20,
                                fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(height: 16),
                          for (int i = 0; i < 8; i++)
                            VideoPlayerTile(
                                imgUrl:
                                    'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8ZWR1Y2F0aW9ufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=800&q=60',
                                title: 'General Knowledge Course',
                                subTitle: 'Chapter-${i + 1}',
                                onClickPlay: () {}),
                          const SizedBox(height: 70)
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: 0.8, color: R.color.blueColor.withOpacity(0.3))),
              child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                   di<GoRouter>().pop();
                  },
                  icon: const FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    size: 18,
                  )),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipRRect(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 3, sigmaY: 3),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        vertical: 16, horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                          style: TextButton.styleFrom(
                              elevation: 20,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 16),
                              shadowColor: R.color.greenColor.withOpacity(0.4),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              backgroundColor: R.color.greenColor,
                              foregroundColor: R.color.surface),
                          onPressed: () {},
                          child: const Text(
                            'Join Now',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: R.color.yellowColor.withOpacity(0.1)),
                          child: Text(
                            '₹ 4000',
                            style: TextStyle(
                              color: R.color.yellowColor.withOpacity(0.8),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
