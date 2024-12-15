import 'dart:convert';
import 'package:hola_app/utils/newModels/homePageModel.dart';
import 'package:http/http.dart' as http;
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
