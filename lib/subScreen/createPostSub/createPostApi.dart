import 'dart:convert';
import 'package:hola_app/loginScreens/components/sharedPref.dart';
import 'package:http/http.dart' as http;

// var baseUrl = "https://hola-project.onrender.com";
// var postData;

// Future<void> createdPost(content, media, tags) async {
//   print('caption:$content');
//   try {
//     Map<String, String?> tokens = await getTokens();
//     String? accessToken = tokens['accessToken'];
//     print('Create Post Token :$accessToken');
//     if (accessToken == null) {
//       print("Authorization token is missing");
//       return;
//     }
//     Response response = await http.post(Uri.parse('$baseUrl/api/posts/create/'),
//         headers: {
//           'Content-Type': 'application/json',
//           'Authorization': 'Bearer $accessToken'
//         },
//         body: {
//           'content': content,
//           'media': null,
//           'tags': tags
//         });
//     print('response: $response');
//     if (response.statusCode == 201) {
//       postData = jsonDecode(response.body.toString());
//       print(postData);
//       print('post created successfully');
//     } else {
//       print('failed CreatePost: ${response.statusCode}');
//     }
//   } catch (e) {
//     print(e.toString());
//   }
// }


var baseUrl = "https://hola-project.onrender.com";
var postData;
var isPublic =true;

Future<void> createdPost(String content, String? mediaPath, String tags) async {
  print('Caption: $content');
  try {
    Map<String, String?> tokens = await getTokens();
    String? accessToken = tokens['accessToken'];
    print('Create Post Token: $accessToken');

    if (accessToken == null) {
      print("Authorization token is missing");
      return;
    }

    var uri = Uri.parse('$baseUrl/api/posts/create/');
    var request = http.MultipartRequest('POST', uri);

    request.fields['content'] = content;
    request.fields['tags'] = tags;
    request.fields['is_public'] = isPublic.toString();

    if (mediaPath != null) {
      request.files.add(await http.MultipartFile.fromPath('media', mediaPath));
    }

    request.headers.addAll({
      'Authorization': 'Bearer $accessToken',
    });

    var response = await request.send();

    if (response.statusCode == 201) {
      var responseBody = await response.stream.bytesToString();
      postData = jsonDecode(responseBody);
      print(postData);
      print('Post created successfully');
    } else {
      print('Failed to create post: ${response.statusCode}');
    }
  } catch (e) {
    print('Error: ${e.toString()}');
  }
}
