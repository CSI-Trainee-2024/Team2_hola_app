import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/comment/comment.dart';
import 'package:hola_app/subScreen/profile/userProfileApi.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/themes/colors.dart';

class ProfilePost extends StatefulWidget {
  const ProfilePost({super.key});

  @override
  State<ProfilePost> createState() => _ProfilePostState();
}

class _ProfilePostState extends State<ProfilePost>
    with AutomaticKeepAliveClientMixin<ProfilePost> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Posts',
            style: textTheme.apptextTheme.headlineSmall,
          ),
        ),
        body: Column(
          children: [
            Expanded(
                child: FutureBuilder(
                    future: userPosts(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: CircularProgressIndicator(
                                color: colors.mainColor,
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(
                              "Loading...",
                              style:
                                  TextStyle(fontSize: 16, color: Colors.grey),
                            ),
                          ],
                        );
                      } else {
                        return ListView.builder(
                            itemCount: userPostList.length,
                            itemBuilder: (context, index) {
                              return SingleChildScrollView(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 12, vertical: 20),
                                child: Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: colors.mainColor, width: 2),
                                      color: colors.greyColor,
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          CircleAvatar(
                                            radius: 25,
                                            backgroundImage: userPostList[index]
                                                        .profilePhoto !=
                                                    null
                                                ? NetworkImage(
                                                    userPostList[index]
                                                        .profilePhoto
                                                        .toString())
                                                : const AssetImage(
                                                    'assets/images/userImage.png'),
                                          ),
                                          Text(
                                            userPostList[index]
                                                .createdBy
                                                .toString(),
                                            style: textTheme
                                                .apptextTheme.bodyLarge,
                                          ),
                                          IconButton(
                                              onPressed: () {},
                                              icon: const Icon(
                                                Icons.more_horiz,
                                                color: colors.whiteColor,
                                              ))
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      Text(
                                        userPostList[index].content.toString(),
                                        style: textTheme.apptextTheme.bodySmall,
                                      ),
                                      Text(
                                        userPostList[index].tags.toString(),
                                        style:
                                            textTheme.apptextTheme.labelLarge,
                                      ),
                                      const SizedBox(
                                        height: 15,
                                      ),
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: userPostList[index].media !=
                                                    null &&
                                                userPostList[index].media !=
                                                    "http://res.cloudinary.com/dy1a8nyco/image/upload/null"
                                            ? Image.network(
                                                userPostList[index]
                                                    .media
                                                    .toString(),
                                                height: 250,
                                                width: double.infinity,
                                                fit: BoxFit.cover,
                                              )
                                            : Container(
                                                color: colors.greyColor,
                                                width: double.infinity,
                                                height: 250,
                                                child: Center(
                                                  child: Text(
                                                      userPostList[index]
                                                          .content
                                                          .toString()),
                                                ),
                                              ),
                                      ),
                                      Row(
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              IconButton(
                                                  onPressed: () {},
                                                  icon: const Icon(
                                                    Icons.favorite,
                                                    color: colors.whiteColor,
                                                    size: 22,
                                                  )),
                                              Text(
                                                userPostList[index]
                                                    .likesCount
                                                    .toString(),
                                                style: textTheme
                                                    .apptextTheme.labelLarge,
                                              )
                                            ],
                                          ),
                                          Row(
                                            children: [
                                              IconButton(
                                                  onPressed: () {
                                                    //incrementComment();
                                                    Navigator.push(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                const commentScreen()));
                                                  },
                                                  icon: const Icon(
                                                    Icons.comment_outlined,
                                                    color: colors.whiteColor,
                                                    size: 22,
                                                  )),
                                              Text(
                                                userPostList[index]
                                                    .commentsCount
                                                    .toString(),
                                                style: textTheme
                                                    .apptextTheme.labelLarge,
                                              )
                                            ],
                                          ),
                                          const SizedBox(
                                            width: 15,
                                          ),
                                          Row(
                                            children: [
                                              Image.asset(
                                                  'assets/images/Share.png'),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                userPostList[index]
                                                    .id
                                                    .toString(),
                                                style: textTheme
                                                    .apptextTheme.labelLarge,
                                              )
                                            ],
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              );
                            });
                      }
                    }))
          ],
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
