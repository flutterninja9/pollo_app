import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:pollo_education/utils/design_system/r.dart';

class ShowAllScreen extends StatefulWidget {
  const ShowAllScreen({super.key});

  @override
  State<ShowAllScreen> createState() => _ShowAllScreenState();
}

class _ShowAllScreenState extends State<ShowAllScreen> {
  late BetterPlayerController _betterPlayerController;
  bool isPlaying = false;

  void initializePlayer() {
    BetterPlayerDataSource betterPlayerDataSource = BetterPlayerDataSource(
        BetterPlayerDataSourceType.network,
        "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4");
    _betterPlayerController = BetterPlayerController(
        const BetterPlayerConfiguration(autoPlay: true),
        betterPlayerDataSource: betterPlayerDataSource);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: R.color.surface,
        body: SafeArea(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    color: R.color.blueColor,
                    height: 200,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 24),
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Recommended Subject',
                          style: TextStyle(
                              color: R.color.surface,
                              fontSize: 18,
                              fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'A wide selection of courses with learning methods that suitable for you.',
                          style: TextStyle(
                              color: R.color.surface.withOpacity(0.6),
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(
                                top: index == 0 ? 24 : 0,
                                bottom: index == 7 ? 24 : 0),
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 24),
                              padding: const EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                color: R.color.yellowColor,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              margin: const EdgeInsets.only(
                                                  bottom: 4),
                                              height: 1,
                                              width: 70,
                                              color: R.color.blueColor
                                                  .withOpacity(0.8),
                                            ),
                                            Text(
                                              'Video Graphy',
                                              style: TextStyle(
                                                  fontSize: 14,
                                                  color: R.color.blueColor
                                                      .withOpacity(0.8),
                                                  fontWeight: FontWeight.w600),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 6, vertical: 4),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: R.color.blueColor
                                                .withOpacity(0.1)),
                                        child: Row(
                                          children: [
                                            FaIcon(
                                              FontAwesomeIcons.user,
                                              color: R.color.blueColor,
                                              size: 12,
                                            ),
                                            const SizedBox(width: 4),
                                            Text(
                                              '40',
                                              style: TextStyle(
                                                color: R.color.blueColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const SizedBox(width: 8),
                                      Icon(
                                        Icons.lock_outlined,
                                        color:
                                            R.color.blueColor.withOpacity(0.7),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 16),
                                  Text(
                                    'The complete video production traning'
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: R.color.blueColor,
                                        fontSize: 22,
                                        fontWeight: FontWeight.w800),
                                  ),
                                  const SizedBox(height: 16),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      TextButton(
                                        style: TextButton.styleFrom(
                                            elevation: 20,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 20, vertical: 10),
                                            shadowColor: R.color.greenColor
                                                .withOpacity(0.4),
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(30)),
                                            backgroundColor: R.color.greenColor,
                                            foregroundColor: R.color.surface),
                                        onPressed: () {},
                                        child: const Text(
                                          'Join Now',
                                          style: TextStyle(fontSize: 14),
                                        ),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.all(6),
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            color: R.color.surface),
                                        child: Text(
                                          '₹ 4000',
                                          style: TextStyle(
                                            color: R.color.blueColor,
                                          ),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(height: 24);
                        },
                        itemCount: 8),
                  )
                ],
              ),
              Container(
                margin: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                        width: 0.8, color: R.color.surface.withOpacity(0.2))),
                child: IconButton(
                  padding: EdgeInsets.zero,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: FaIcon(
                    FontAwesomeIcons.arrowLeft,
                    size: 18,
                    color: R.color.surface,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
