import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/subScreen/HomeSubScreen/components/likeShareComment.dart';
import 'package:hola_app/subScreen/api/allpostApi.dart';
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
                future: getPostApi(),
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
    ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;
}
