import 'dart:convert';
import 'package:hola_app/loginScreens/components/sharedPref.dart';
import 'package:http/http.dart' as http;

var userUrl = "https://hola-project.onrender.com";
var profile;
var userPostdata;
var uniqueId;

Future<void> userProfile() async {
  try {
    Map<String, String?> tokens = await getTokens();
    String? accessToken = tokens['accessToken'];
    print('Create Post Token :$accessToken');
    if (accessToken == null) {
      print("Authorization token is missing");
      return;
    }
    final response = await http.get(headers: {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $accessToken'
    }, Uri.parse('$userUrl/api/accounts/profile/'));

    if (response.statusCode == 200) {
      profile = jsonDecode(response.body.toString());
      print(profile);
    } else {
      print("UserResonse status code :$response");
    }
  } catch (e) {
    print(e.toString());
  }
}

// user Posts
Future<void> userPosts() async {
  try {
    Map<String, String?> tokens = await getTokens();
    String? accessToken = tokens['accessToken'];
    print('UserPost Toekn : $accessToken');
    if (accessToken == null) {
      print("Authorization token is missing");
      return;
    }
    uniqueId = profile['id'];
    final response = await http.get(
        Uri.parse('$userUrl/api/accounts/profile/$uniqueId/posts/'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $accessToken'
        });
    if (response.statusCode == 200) {
      userPostdata = jsonDecode(response.body.toString());
      print(userPostdata);
    } else {
      print("UserResonse status code :$response");
    }
  } catch (e) {
    print(e.toString());
  }
}
