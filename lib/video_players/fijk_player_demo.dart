import 'package:fijkplayer/fijkplayer.dart';
import 'package:flutter/material.dart';
import 'package:test_videoplayer/constants/constants.dart';

class FijkPlayerDemo extends StatefulWidget {
  const FijkPlayerDemo({Key? key}) : super(key: key);

  @override
  State<FijkPlayerDemo> createState() => _FijkPlayerDemoState();
}

class _FijkPlayerDemoState extends State<FijkPlayerDemo> {
  final FijkPlayer player = FijkPlayer();

  @override
  void initState() {
    super.initState();
    player.setDataSource(videoUrl, autoPlay: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Fijk Video Player'),
      ),
      body: Center(
        child: FijkView(
          player: player,
        ),
      ),
    );
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
}
