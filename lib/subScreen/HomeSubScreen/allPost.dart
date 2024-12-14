// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/components/likeShareComment.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/utils/newApi/AllUserApi.dart';
import 'package:hola_app/utils/newModels/homePageModel.dart';

class alluserPost extends StatefulWidget {
  const alluserPost({super.key});

  @override
  State<alluserPost> createState() => _alluserPostState();
}

class _alluserPostState extends State<alluserPost>
    with AutomaticKeepAliveClientMixin<alluserPost> {
  late Future<HomePage?> futureHomePage;
  @override
  void initState() {
    super.initState();
    futureHomePage = ApiService().fetchHomePageData();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Column(
      children: [
        Expanded(
            child: FutureBuilder<HomePage?>(
                future: futureHomePage,
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
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
                    HomePage homePage = snapshot.data!;
                    List<Posts> posts = homePage.posts ?? [];
                    return ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          Posts post = posts[index];
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      const CircleAvatar(
                                        radius: 25,
                                        backgroundImage: AssetImage(
                                            'assets/images/userImage.png'),
                                      ),
                                      Text(
                                        post.createdBy.toString(),
                                        style: textTheme.apptextTheme.bodyLarge,
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
                                    post.content ?? 'Nature is Love',
                                    style: textTheme.apptextTheme.bodySmall,
                                  ),
                                  Text(
                                    post.tags ?? '#Explore',
                                    style: textTheme.apptextTheme.labelLarge,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      post.media ?? "No Media",
                                      height: 250,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const likecommentShare()
                                ],
                              ),
                            ),
                          );
                        });
                  }
                }))
      ],
    );
  }

  @override
  bool get wantKeepAlive => true;
}
