import 'package:flutter/material.dart';
import 'package:test_videoplayer/constants/constants.dart';
import 'package:video_player/video_player.dart';

import '../models/m3u8_model.dart';
import '../utils/utils.dart';

class VideoPlayerDemo extends StatefulWidget {
  const VideoPlayerDemo({Key? key}) : super(key: key);

  @override
  State<VideoPlayerDemo> createState() => _VideoPlayerDemoState();
}

class _VideoPlayerDemoState extends State<VideoPlayerDemo> {
  VideoPlayerController? _controller;
  List<M3U8model> files = [];

  @override
  void initState() {
    getM3U8s();
    super.initState();
  }

  Future<void> getM3U8s() async {
    files = await loadM3U8s(videoUrl);
    _controller = VideoPlayerController.network(
      files.last
          .dataURL!, //Get Best Quality since by default it gets lower quality
      formatHint: VideoFormat.hls,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )
      ..initialize().then((value) => setState(() {}))
      ..setVolume(0)
      ..setLooping(true)
      ..play();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Video Player'),
      ),
      body: Center(
        child: _controller != null && _controller!.value.isInitialized
            ? AspectRatio(
                aspectRatio: _controller!.value.aspectRatio,
                child: VideoPlayer(_controller!),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }
}
