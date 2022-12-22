import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:test_videoplayer/models/m3u8_model.dart';

Future<List<M3U8model>> loadM3U8s(String video) async {
  List<M3U8model> m3u8s = [];
  m3u8s.add(M3U8model(dataQuality: "Auto", dataURL: video));
  RegExp regExp = RegExp(
    r"#EXT-X-STREAM-INF:(?:.*,RESOLUTION=(\d+x\d+))?,?(.*)\r?\n(.*)",
    caseSensitive: false,
    multiLine: true,
  );

  String? m3u8Content;
  http.Response response = await http.get(Uri.parse(video));
  if (response.statusCode == 200) {
    m3u8Content = utf8.decode(response.bodyBytes);
  }
  if (m3u8Content == null) return [];
  List<RegExpMatch> matches = regExp.allMatches(m3u8Content).toList();

  matches.forEach(
    (RegExpMatch regExpMatch) async {
      String quality = (regExpMatch.group(1)).toString();
      String sourceURL = (regExpMatch.group(3)).toString();
      final netRegex = RegExp(r'^(http|https):\/\/([\w.]+\/?)\S*');
      final netRegex2 = RegExp(r'(.*)\r?\/');
      final isNetwork = netRegex.hasMatch(sourceURL);
      final match = netRegex2.firstMatch(video);
      String url;
      if (isNetwork) {
        url = sourceURL;
      } else {
        final dataURL = match!.group(0);
        url = "$dataURL$sourceURL";
      }
      m3u8s.add(M3U8model(dataQuality: quality, dataURL: url));
    },
  );
  return m3u8s;
}
