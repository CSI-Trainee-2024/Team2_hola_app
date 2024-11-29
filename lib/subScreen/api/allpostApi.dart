import 'dart:convert';

import 'package:hola_app/themes/models/allpost.dart';
import 'package:http/http.dart' as http;

List<allpost> postList = [];

Future<List<allpost>> getPostApi() async {
  final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    postList.clear();
    for (Map i in data) {
      postList.add(allpost.fromJson(i as Map<String, dynamic>));
    }
    return postList;
  } else {
     throw Exception('Failed to load posts');
  }
}
