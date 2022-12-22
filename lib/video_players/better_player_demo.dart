import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';
import 'package:test_videoplayer/constants/constants.dart';

class BetterPlayerDemo extends StatefulWidget {
  const BetterPlayerDemo({Key? key}) : super(key: key);

  @override
  State<BetterPlayerDemo> createState() => _BetterPlayerDemoState();
}

class _BetterPlayerDemoState extends State<BetterPlayerDemo> {
  late BetterPlayerController _betterPlayerController;

  @override
  void initState() {
    BetterPlayerConfiguration betterPlayerConfiguration =
        BetterPlayerConfiguration(
      aspectRatio: 16 / 9,
      fit: BoxFit.contain,
      autoPlay: true,
      looping: true,
      autoDetectFullscreenDeviceOrientation: true,
    );
    BetterPlayerDataSource dataSource = BetterPlayerDataSource(
      BetterPlayerDataSourceType.network,
      videoUrl,
      videoFormat: BetterPlayerVideoFormat.hls,
      liveStream: true,
    );
    _betterPlayerController = BetterPlayerController(betterPlayerConfiguration);
    _betterPlayerController.setupDataSource(dataSource);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Demo Better Player'),
      ),
      body: Center(
        child: AspectRatio(
          aspectRatio: 16 / 9,
          child: BetterPlayer(controller: _betterPlayerController),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _betterPlayerController.dispose();
    super.dispose();
  }
}
