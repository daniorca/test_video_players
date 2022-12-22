import 'package:flutter/material.dart';
import 'package:test_videoplayer/video_players/better_player_demo.dart';
import 'package:test_videoplayer/video_players/cached_player_demo.dart';
import 'package:test_videoplayer/video_players/chewie_player_demo.dart';
import 'package:test_videoplayer/video_players/fijk_player_demo.dart';
import 'package:test_videoplayer/video_players/video_player_demo.dart';
import 'package:test_videoplayer/video_players/video_player_file_demo.dart';
import 'package:test_videoplayer/video_players/yoyo_player_demo.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: VideoPlayerDemoSelector(),
    );
  }
}

class VideoPlayerDemoSelector extends StatelessWidget {
  const VideoPlayerDemoSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video Player Options'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => _navigateTo(context, VideoPlayerDemo()),
              child: Text('Video Player Demo'),
            ),
            ElevatedButton(
              onPressed: () => _navigateTo(context, VideoPlayerFileDemo()),
              child: Text('Video Player File Demo'),
            ),
            ElevatedButton(
              onPressed: () => _navigateTo(context, BetterPlayerDemo()),
              child: Text('Better Player Demo'),
            ),
            ElevatedButton(
              onPressed: () => _navigateTo(context, ChewiePlayerDemo()),
              child: Text('Chewie Player Demo'),
            ),
            ElevatedButton(
              onPressed: () => _navigateTo(context, FijkPlayerDemo()),
              child: Text('Fijk Player Demo'),
            ),
            ElevatedButton(
              onPressed: () => _navigateTo(context, CachedPlayerDemo()),
              child: Text('Cached Player Demo'),
            ),
            ElevatedButton(
              onPressed: () => _navigateTo(context, YoyoPlayerDemo()),
              child: Text('Yoyo Player Demo'),
            )
          ],
        ),
      ),
    );
  }

  void _navigateTo(BuildContext context, Widget route) => Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => route),
      );
}
