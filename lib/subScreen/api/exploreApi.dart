import 'dart:convert';

import 'package:hola_app/themes/models/allpost.dart';
import 'package:http/http.dart' as http;

final List<allpost> exploreList = [];

Future<List<allpost>> getExploreApi() async {
  final response =
      await http.get(Uri.parse('https://picsum.photos/v2/list?limit=100'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    exploreList.clear();
    for (Map i in data) {
      exploreList.add(allpost.fromJson(i as Map<String, dynamic>));
    }
    return exploreList;
  } else {
    return exploreList;
  }
}
