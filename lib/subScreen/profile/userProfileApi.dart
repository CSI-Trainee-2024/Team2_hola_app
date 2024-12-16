import 'dart:convert';
import 'package:hola_app/loginScreens/components/sharedPref.dart';
import 'package:hola_app/subScreen/profile/profileModel/followersModel.dart';
import 'package:hola_app/subScreen/profile/profileModel/userProfileModel.dart';
import 'package:http/http.dart' as http;

var userUrl = "https://hola-project.onrender.com";
var profile;
var userPostdata;
var userFollowerData;
var userFollowingData;
var uniqueId;
List<userPostModel> userPostList = [];
List<FollowersList> userFollowes = [];
List<FollowersList> userFollowing = [];

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
Future<List<userPostModel>> userPosts() async {
  Map<String, String?> tokens = await getTokens();
  String? accessToken = tokens['accessToken'];
  print('UserPost Toekn : $accessToken');
  if (accessToken == null) {
    print("Authorization token is missing");
  }
  uniqueId = profile['id'];
  final response = await http.get(
      Uri.parse('$userUrl/api/accounts/profile/$uniqueId/posts/'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $accessToken'
      });
  userPostdata = jsonDecode(response.body.toString());
  print(userPostdata);
  if (response.statusCode == 200) {
    userPostList.clear();
    for (Map i in userPostdata) {
      userPostList.add(userPostModel.fromJson(i as Map<String, dynamic>));
    }
    return userPostList;
  } else {
    throw Exception('Failed to load posts: $response');
    //print("UserResonse status code :$response");
  }
}

// user followers
Future<List<FollowersList>> getFollowers() async {
  Map<String, String?> tokens = await getTokens();
  String? followerToken = tokens['accessToken'];

  uniqueId = profile['id'];
  final response = await http
      .get(Uri.parse('$userUrl/api/accounts/followers/$uniqueId/'), headers: {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer $followerToken'
  });
  userFollowerData = jsonDecode(response.body.toString());
  if (response.statusCode == 200) {
    userFollowes.clear();
    for (Map i in userFollowerData) {
      userFollowes.add(FollowersList.fromJson(i as Map<String, dynamic>));
    }
    return userFollowes;
  } else {
    throw Exception('failed to load data $response');
  }
}

