import 'package:flutter/material.dart';
import 'package:pollo_education/utils/design_system/r.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PolloYoutubePlayer extends StatefulWidget {
  const PolloYoutubePlayer({
    Key? key,
    required this.ytUrl,
  }) : super(key: key);
  static const routeName = '/youtube-player';
  final String ytUrl;
  @override
  State<PolloYoutubePlayer> createState() => _PolloYoutubePlayerState();
}

class _PolloYoutubePlayerState extends State<PolloYoutubePlayer> {
  late final YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.ytUrl.split("/").last,
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: AspectRatio(
        aspectRatio: 16 / 9,
        child: YoutubePlayer(
          controller: _controller,
          bottomActions: [
            CurrentPosition(
              controller: _controller,
            ),
            ProgressBar(
              isExpanded: true,
              controller: _controller,
            ),
            FullScreenButton(
              controller: _controller,
            ),
          ],
        ),
      ),
    );
  }
}
