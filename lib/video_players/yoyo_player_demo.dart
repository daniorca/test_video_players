import 'package:flutter/material.dart';
import 'package:lecle_yoyo_player/lecle_yoyo_player.dart';
import 'package:test_videoplayer/constants/constants.dart';

class YoyoPlayerDemo extends StatefulWidget {
  const YoyoPlayerDemo({Key? key}) : super(key: key);

  @override
  State<YoyoPlayerDemo> createState() => _YoyoPlayerDemoState();
}

class _YoyoPlayerDemoState extends State<YoyoPlayerDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Yoyo Video Player'),
      ),
      body: YoYoPlayer(
        url: videoUrl,
        videoLoadingStyle: VideoLoadingStyle(
          loading: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        allowCacheFile: true,
        displayFullScreenAfterInit: true,
        onVideoInitCompleted: (controller) {
          controller.setVolume(0);
        },
      ),
    );
  }
}
