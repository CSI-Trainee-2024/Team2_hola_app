import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

var baseUrl = "https://hola-project.onrender.com/api/auth";
var data;

Future<void> register(String userName, email, password) async {
  
  try {
    Response response = await http.post(
      Uri.parse("$baseUrl/register/"),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'full_name': userName,
        'email': email,
        'password': password,
      }),
    );
    if (response.statusCode == 201) {
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
    Response response = await http.post(Uri.parse("$baseUrl/login/"),
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
