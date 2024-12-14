import 'dart:convert';
import 'package:hola_app/loginScreens/components/apiFunctions.dart';
import 'package:hola_app/loginScreens/components/sharedPref.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

var baseUrl = "https://hola-project.onrender.com";
var postData;

Future<void> createdPost(content, media, tags) async {
  try {
    Map<String, String?> tokens = await getTokens();
    String? accessToken = tokens['accessToken'];
    if (accessToken == null) {
      print("Authorization token is missing");
      return;
    }
    Response response = await http.post(Uri.parse('$baseUrl/api/posts/create/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        },
        body: jsonEncode({'content': content, 'media': media, 'tags': tags}));
    if (response.statusCode == 201) {
      postData = jsonEncode(response.body.toString());
      print(postData);
      print('post created successfully');
    } else {
      print('failed : ${response.statusCode}');
    }
  } catch (e) {
    print(e.toString());
  }
}
