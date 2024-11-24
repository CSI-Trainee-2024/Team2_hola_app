import 'dart:convert';
import 'package:hola_app/themes/models/videoApi.dart';
import 'package:http/http.dart' as http;

List<allVideos> videoList = [];

Future<List<allVideos>> videoAPi() async {
  final response = await http.get(Uri.parse('https://gist.githubusercontent.com/poudyalanil/ca84582cbeb4fc123a13290a586da925/raw/14a27bd0bcd0cd323b35ad79cf3b493dddf6216b/videos.json'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    videoList.clear();
    for (Map i in data) {
      videoList.add(allVideos.fromJson(i as Map<String, dynamic>));
    }
    return videoList;
  } else {
    return videoList;
  }
}
