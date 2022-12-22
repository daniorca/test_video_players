import 'package:cached_video_player/cached_video_player.dart';
import 'package:flutter/material.dart';
import 'package:test_videoplayer/constants/constants.dart';

class CachedPlayerDemo extends StatefulWidget {
  const CachedPlayerDemo({Key? key}) : super(key: key);

  @override
  State<CachedPlayerDemo> createState() => _CachedPlayerDemoState();
}

class _CachedPlayerDemoState extends State<CachedPlayerDemo> {
  late CachedVideoPlayerController controller;

  @override
  void initState() {
    super.initState();

    controller = CachedVideoPlayerController.network(
      videoUrl,
      formatHint: VideoFormat.hls,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )
      ..setVolume(0)
      ..setLooping(true)
      ..initialize().then((_) => setState(() {}))
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Video Player'),
      ),
      body: Center(
        child: controller.value.isInitialized
            ? AspectRatio(
                aspectRatio: controller.value.aspectRatio,
                child: CachedVideoPlayer(controller),
              )
            : SizedBox(),
      ),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
