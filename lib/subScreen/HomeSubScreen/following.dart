// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/components/likeShareComment.dart';
import 'package:hola_app/subScreen/api/followingApi.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class followingPost extends StatefulWidget {
  const followingPost({super.key});

  @override
  State<followingPost> createState() => _followingPostState();
}

class _followingPostState extends State<followingPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
                future: followApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: followList.length,
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
                                        followList[index].author.toString(),
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
                                    'The Earth has music for all those who listen',
                                    style: textTheme.apptextTheme.bodySmall,
                                  ),
                                  Text(
                                    '#NatureLovers #Explore #WildlifePhotography #MotherNature #NaturePerfection',
                                    style: textTheme.apptextTheme.labelLarge,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      followList[index].downloadUrl.toString(),
                                      height: 250,
                                      width: double.infinity,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  likecommentShare()
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
}
