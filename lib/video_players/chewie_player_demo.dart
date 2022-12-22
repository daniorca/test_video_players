import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:test_videoplayer/constants/constants.dart';
import 'package:video_player/video_player.dart';

class ChewiePlayerDemo extends StatefulWidget {
  const ChewiePlayerDemo({Key? key}) : super(key: key);

  @override
  State<ChewiePlayerDemo> createState() => _ChewiePlayerDemoState();
}

class _ChewiePlayerDemoState extends State<ChewiePlayerDemo> {
  late VideoPlayerController _videoPlayerController;
  ChewieController? _chewieController;

  @override
  void initState() {
    super.initState();
    initializePlayer();
  }

  Future<void> initializePlayer() async {
    _videoPlayerController = VideoPlayerController.network(
      videoUrl,
      formatHint: VideoFormat.hls,
      videoPlayerOptions: VideoPlayerOptions(mixWithOthers: true),
    )
      ..setVolume(0)
      ..setLooping(true)
      ..initialize().then((_) {
        _createChewieController();
        setState(() {});
      });
  }

  void _createChewieController() {
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController,
      autoPlay: true,
      looping: true,
      isLive: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chewie Video Player'),
      ),
      body: Center(
        child: _chewieController != null &&
                _chewieController!.videoPlayerController.value.isInitialized
            ? AspectRatio(
                aspectRatio: _videoPlayerController.value.aspectRatio,
                child: Chewie(controller: _chewieController!),
              )
            : CircularProgressIndicator(),
      ),
    );
  }

  @override
  void dispose() {
    _videoPlayerController.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
