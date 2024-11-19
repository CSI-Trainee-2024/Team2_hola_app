import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

void register(String userName, email, password) async {
  try {
    http.Response response =
        await http.post(Uri.parse('http://localhost:3000/auth/register'),
            body: jsonEncode({
              'User': {
                'userName': userName,
                'email': email,
                'password': password
              }
            }));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
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
    http.Response response =
        await http.post(Uri.parse('http://localhost:3000/auth/login'),
            body: jsonEncode({
              'User': {
                'email': email,
                'password': password
              }
            }));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body.toString());
      print(data);
      print('Login successfully');
    } else {
      print('failed:${response.statusCode}');
    }
  } catch (e) {
    print(e.toString()); 
  }
}
