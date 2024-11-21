import 'dart:convert';

import 'package:hola_app/themes/models/allpost.dart';
import 'package:http/http.dart' as http;

List<allpost> followList = [];

Future<List<allpost>> followApi() async {
  final response = await http.get(Uri.parse('https://picsum.photos/v2/list?limit=10'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    followList.clear();
    for (Map i in data) {
      followList.add(allpost.fromJson(i as Map<String, dynamic>));
    }
    return followList;
  } else {
    return followList;
  }
}
