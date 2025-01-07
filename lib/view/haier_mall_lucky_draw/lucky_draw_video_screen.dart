import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';

class LuckyDrawVideoScreen extends StatefulWidget {
  const LuckyDrawVideoScreen({super.key});

  @override
  State<LuckyDrawVideoScreen> createState() => _LuckyDrawVideoScreenState();
}

class _LuckyDrawVideoScreenState extends State<LuckyDrawVideoScreen> {
  late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    _initPlayer();
  }

  void _initPlayer() async {
    // ignore: deprecated_member_use
    videoPlayerController = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    );

    await videoPlayerController.initialize();

    chewieController = ChewieController(
      videoPlayerController: videoPlayerController,
      autoPlay: true,
      looping: true,
      aspectRatio: 16 / 9,
      placeholder: Center(
        child: CircularProgressIndicator(),
      ),
      allowPlaybackSpeedChanging: true,
      showControls: true,
    );
    setState(() {});
  }

  @override
  void dispose() {
    videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lucky Draw Video'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(left: 15, right: 15),
            height: MediaQuery.of(context).size.height * 0.3,
            width: double.infinity,
            child: chewieController != null
                ? Chewie(controller: chewieController!)
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
