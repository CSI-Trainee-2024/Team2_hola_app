import 'dart:convert';

import 'package:hola_app/themes/models/community.dart';
import 'package:http/http.dart' as http;

List<Community> communtiyList = [];

Future<List<Community>> communityApi() async {
  try {
     final response = await http
      .get(Uri.parse("https://socialnetworkingsite.onrender.com/users"));
  var data = jsonDecode(response.body.toString());

  if (response.statusCode == 200) {
    communtiyList.clear();
    for (Map i in data) {
      communtiyList.add(Community.fromJson(i as Map<String, dynamic>));
    }
    return communtiyList;
  } else {
    throw Exception('Failed to load all user');
  }
  } catch (e) {
    throw Exception('Error fetching the user:$e');
  }
}
