import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

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
      appBar: AppBar(
        title: Text('Recommended Subjects'),
      ),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Container(
              margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                children: [
                  Container(
                    height: 200,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      image: const DecorationImage(
                          image: NetworkImage(
                              'https://images.unsplash.com/photo-1596496181871-9681eacf9764?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mjl8fG1hdGhlbWF0aWNzfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
                          fit: BoxFit.cover),
                    ),
                    child: IconButton(
                        onPressed: () {
                          // initializePlayer();
                          // isPlaying = true;
                          // setState(() {});
                        },
                        icon: const Icon(
                          Icons.play_arrow,
                          size: 40,
                        )),
                  ),
                  Row(
                    children: const [
                      Text(
                        'Mathmatics chapter-1',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w500),
                      ),
                    ],
                  )
                ],
              ),
            );
          }),
    );
  }
}
