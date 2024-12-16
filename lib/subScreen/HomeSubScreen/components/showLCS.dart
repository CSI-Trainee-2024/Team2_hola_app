import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hola_app/subScreen/HomeSubScreen/comment/comment.dart';
import 'package:hola_app/subScreen/profile/userProfileApi.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class LikeCommentShare extends StatefulWidget {
  const LikeCommentShare({super.key});

  @override
  State<LikeCommentShare> createState() => _LikeCommentShareState();
}

class _LikeCommentShareState extends State<LikeCommentShare> {
  bool isLike = false;
  late List<Post>
      userPostList; // Assuming Post is a class representing a single post

  @override
  void initState() {
    super.initState();
    // Fetch the data when the widget is initialized
    fetchUserData();
  }

  // Fetch the posts from the API
  Future<void> fetchUserData() async {
    // Simulate an API call (replace this with actual API call)
    List<Post> posts = await fetchPostsFromApi();
    setState(() {
      userPostList = posts;
    });
  }

  // Function to toggle like count
  void toggleLike(int index) {
    setState(() {
      if (userPostList[index].isLiked) {
        userPostList[index].likesCount--;
        userPostList[index].isLiked = false;
      } else {
        userPostList[index].likesCount++;
        userPostList[index].isLiked = true;
      }
    });
  }

  // Increment the comment count
  void incrementComment(int index) {
    setState(() {
      userPostList[index].commentsCount++; // Increase comment count
    });
  }

  @override
  Widget build(BuildContext context) {
    return userPostList == null
        ? CircularProgressIndicator() // Show loading if data is not available yet
        : ListView.builder(
            itemCount: userPostList.length,
            itemExtent: 70,
            itemBuilder: (context, index) {
              final post = userPostList[index];
              return Row(
                children: [
                  // Like Button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      IconButton(
                        onPressed: () => toggleLike(index),
                        icon: Icon(
                          Icons.favorite,
                          color: post.isLiked
                              ? colors.redColor
                              : colors.whiteColor,
                          size: 22,
                        ),
                      ),
                      Text(
                        post.likesCount.toString(),
                        style: textTheme.apptextTheme.labelLarge,
                      ),
                    ],
                  ),
                  // Comment Button
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          incrementComment(index);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => commentScreen()),
                          );
                        },
                        icon: const Icon(
                          Icons.comment_outlined,
                          color: colors.whiteColor,
                          size: 22,
                        ),
                      ),
                      Text(
                        post.commentsCount.toString(), // Using the post data
                        style: textTheme.apptextTheme.labelLarge,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  // Share Button
                  Row(
                    children: [
                      Image.asset('assets/images/Share.png'),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        post.sharesCount.toString(), // Using the post data
                        style: textTheme.apptextTheme.labelLarge,
                      ),
                    ],
                  ),
                ],
              );
            },
          );
  }

  // Dummy API fetch function for example
  Future<List<Post>> fetchPostsFromApi() async {
    await Future.delayed(Duration(seconds: 2)); // Simulate network delay
    // Replace this with actual API fetching logic and data structure
    return [
      Post(likesCount: 120, commentsCount: 25, sharesCount: 10, isLiked: false),
      Post(likesCount: 60, commentsCount: 15, sharesCount: 5, isLiked: false),
    ];
  }
}

// Post class represents a single post
class Post {
  int likesCount;
  int commentsCount;
  int sharesCount;
  bool isLiked;

  Post({
    required this.likesCount,
    required this.commentsCount,
    required this.sharesCount,
    required this.isLiked,
  });
}
