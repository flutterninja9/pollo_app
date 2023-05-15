import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:pollo_education/home/view/show_all_screen.dart';
import 'package:pollo_education/home/view/widgets/app_action.dart';
import 'package:pollo_education/home/view/widgets/app_action_widget.dart';

class AppActionsContainer extends StatefulWidget {
  const AppActionsContainer({
    super.key,
    required this.action,
    this.onTap,
  });

  final AppActions action;
  final VoidCallback? onTap;

  @override
  State<AppActionsContainer> createState() => _AppActionsContainerState();
}

class _AppActionsContainerState extends State<AppActionsContainer> {
  late BetterPlayerController _betterPlayerController;

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
    return SizedBox(
      height: 130.0,
      child: Column(
        children: [
          Row(
            children: [
              Text(
                widget.action.label,
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ShowAllScreen()));
                },
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
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: widget.action.appActions.length,
              itemBuilder: (context, index) {
                final appAction = widget.action.appActions[index];

                return AppActionWidget(
                  coverImage: appAction.imagePath,
                  appAction: appAction,
                  onTap: () {
                    initializePlayer();
                    showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: AspectRatio(
                            aspectRatio: 16 / 9,
                            child: BetterPlayer(
                              controller: _betterPlayerController,
                            ),
                          ),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
