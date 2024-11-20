// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/components/likeShareComment.dart';
import 'package:hola_app/subScreen/api/allpostApi.dart';
import 'package:hola_app/subScreen/demoData.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class alluserPost extends StatefulWidget {
  const alluserPost({super.key});

  @override
  State<alluserPost> createState() => _alluserPostState();
}

class _alluserPostState extends State<alluserPost> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
                future: getPostApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Text('Loading');
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
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
                                        postList[index].author.toString(),
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
                                      postList[index].downloadUrl.toString(),
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
