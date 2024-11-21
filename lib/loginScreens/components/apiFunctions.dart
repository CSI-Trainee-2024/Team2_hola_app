import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

var baseUrl = "https://socialnetworkingsite.onrender.com";
var data;

void register(String userName, email, password) async {
  try {
    http.Response response = await http.post(
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

void login(String email, password) async {
  try {
    http.Response response = await http.post(Uri.parse("$baseUrl/auth/login"),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          {'email': email, 'password': password}
        }));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body.toString());
      print(data);
      print('Login successfully');
    } else {
      data = {'success': false, 'message': 'Invalid credentials'};
      print('failed:${response.statusCode}');
    }
  } catch (e) {
    data = {'success': false, 'message': e.toString()};
    print(e.toString());
  }
}
