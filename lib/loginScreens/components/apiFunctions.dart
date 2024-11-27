import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

var baseUrl = "https://socialnetworkingsite.onrender.com";
var data;

Future<void> register(String userName, email, password) async {
  
  try {
    Response response = await http.post(
      Uri.parse("$baseUrl/auth/register"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'userName': userName,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      print(data);
      print('Register successfully');
    } else {
      print('failed:${response.statusCode}');
    }
  } catch (e) {
    print(e.toString());
  }
}

Future<void> login(String email, password) async {
  try {
    Response response = await http.post(Uri.parse("$baseUrl/auth/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'email': email, 'password': password
        }));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      print(data);
      print('Login successfully');
    } else {
      print('failed:${response.statusCode}');
    }
  } catch (e) {
    print(e.toString());
  }
}
