import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/profile/userProfileApi.dart';
import 'package:hola_app/themes/colors.dart';

class mainProfile extends StatefulWidget {
  const mainProfile({super.key});

  @override
  State<mainProfile> createState() => _mainProfileState();
}

class _mainProfileState extends State<mainProfile> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: FutureBuilder(
              future: userPosts(),
              builder: (context, snapshot) {
                if (!snapshot.hasData) {
                  return const Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircularProgressIndicator(
                        color: colors.mainColor,
                      ),
                      SizedBox(height: 20),
                      Text(
                        "Loading...",
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ],
                  );
                } else {
                  return GridView.builder(
                      //physics: NeverScrollableScrollPhysics(),
                      itemCount: userPostList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        String mediaUrl = userPostList[index].media.toString();
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: mediaUrl != "null" &&
                                  mediaUrl !=
                                      "http://res.cloudinary.com/dy1a8nyco/image/upload/null"
                              ? Image.network(
                                  mediaUrl,
                                  fit: BoxFit.cover,
                                )
                              : Container(
                                  color: colors.greyColor,
                                  child: Center(
                                      child: Text(userPostList[index]
                                          .content
                                          .toString())),
                                ),
                        );
                      });
                }
              }),
        )
      ],
    );
  }
}
