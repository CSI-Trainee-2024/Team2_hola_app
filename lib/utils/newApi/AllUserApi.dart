import 'dart:convert';
import 'package:hola_app/utils/newModels/HomePageModel.dart';
import 'package:hola_app/utils/newModels/homePostmodel.dart';
import 'package:http/http.dart' as http;
import 'package:hola_app/loginScreens/components/sharedPref.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiService {
  Future<HomePage?> fetchHomePageData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
    String? access = prefs.getString('accessToken');

    if (access == null) {
      print("No access token found");
      return null;
    }

    print('Token : $access');

    String url = 'http://hola-project.onrender.com/api/accounts/homepage/';

    try {
      final response = await http.get(
        Uri.parse(url),
       headers: {
        'Content-Type': 'application/json',
         'Authorization': 'Bearer $access',
       }
      );
      print('Request: ${response.request}');
    print('Response Code: ${response.statusCode}');
    print('Response Body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseData = json.decode(response.body);

        return HomePage.fromJson(responseData);
      } else {
        print("Failed to load data: ${response.statusCode}");
        return null;
      }
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}

// var homePostdata;
// Future<HomePostmodel> homePost() async {
//   Map<String, String?> tokens = await getTokens();
//   String? accessToken = tokens['accessToken'];
//   print('UserPost Toekn : $accessToken');
//   if (accessToken == null) {
//     print("Authorization token is missing");
//   }

//   final response = await http.get(
//       Uri.parse("http://hola-project.onrender.com/api/accounts/homepage/"),
//       headers: {
//         'Content-Type': 'application/json',
//         'Authorization': 'Bearer $accessToken'
//       });
//   homePostdata = jsonDecode(response.body.toString());
//   print(homePostdata);
//   if (response.statusCode == 200) {
//     homePostdata = jsonDecode(response.body.toString());
//     return homePostdata;
//   } else {
//     throw Exception("Failed to load data: $response");
//   }
// }
