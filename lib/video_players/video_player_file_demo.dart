import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:test_videoplayer/constants/constants.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerFileDemo extends StatefulWidget {
  const VideoPlayerFileDemo({Key? key}) : super(key: key);

  @override
  State<VideoPlayerFileDemo> createState() => _VideoPlayerFileDemoState();
}

class _VideoPlayerFileDemoState extends State<VideoPlayerFileDemo> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    _downloadVideo();
    super.initState();
  }

  Future<void> _downloadVideo() async {
    final fileInfo = await DefaultCacheManager().downloadFile(videoUrl);
    _controller = VideoPlayerController.file(
      fileInfo.file,
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
