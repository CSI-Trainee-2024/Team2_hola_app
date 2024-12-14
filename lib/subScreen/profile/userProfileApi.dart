import 'dart:convert';
import 'package:hola_app/loginScreens/components/sharedPref.dart';
import 'package:http/http.dart' as http;

var userUrl = "https://hola-project.onrender.com";
var profile;

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
