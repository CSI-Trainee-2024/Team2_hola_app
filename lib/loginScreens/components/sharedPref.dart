import 'package:shared_preferences/shared_preferences.dart';

// Saving the tokens
Future<void> saveTokens(String accessToken, String refreshToken) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString('accessToken', accessToken);
  prefs.setString('refreshToken', refreshToken);
}

//Retriving the tokens
Future<Map<String, String?>> getTokens() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  String? access = prefs.getString('accessToken');
  String? refresh = prefs.getString('refreshToken');

  return {'accessToken': access, 'refreshToken': refresh};
}

// Removing the tokens
Future<void> removeToken() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.remove('accessToken');
  await prefs.remove('refreshToken');
}
