import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/profile/editProfile.dart';
import 'package:hola_app/subScreen/profile/followes.dart';
import 'package:hola_app/subScreen/profile/following.dart';
import 'package:hola_app/subScreen/profile/mainProfile.dart';
import 'package:hola_app/subScreen/profile/posts.dart';
import 'package:hola_app/subScreen/profile/userProfileApi.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/utils/gesture.Detector.dart';
import 'package:hola_app/utils/newApi/AllUserApi.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  var uniqueId;
  List data = ['0', '0', '0'];
  List dataName = ['Post', 'Followers', 'Following'];
  List screens = [const ProfilePost(), const Followes(), const UserFollowing()];
  Future<void> refreshData() async {
    await userProfile();
    setState(() {
      data[0] = profile['num_posts'].toString();
      data[1] = profile['num_followers'].toString();
      data[2] = profile['num_following'].toString();
      uniqueId = profile['id'];
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Expanded(
            child: FutureBuilder(
          future: userProfile(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("LOading"),
                    SizedBox(
                      height: 20,
                    ),
                    CircularProgressIndicator(
                      color: colors.mainColor,
                    )
                  ],
                ),
              );
            } else {
              return RefreshIndicator(
                onRefresh: refreshData,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        height: 200,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: profile['background_photo'] != null &&
                                        profile['background_photo'].isNotEmpty
                                    ? NetworkImage(
                                        profile['profile_photo'].toString(),
                                      )
                                    : const AssetImage(
                                        'assets/images/natureImage.png'),
                                fit: BoxFit.cover)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      CircleAvatar(
                          radius: 50,
                          backgroundImage: profile['profile_photo'] != null &&
                                  profile['profile_photo'].isNotEmpty
                              ? NetworkImage(
                                  profile['profile_photo'].toString())
                              : const AssetImage('assets/images/userImage.png')
                          // NetworkImage(
                          //     profile['profile_photo']?.toString() ??
                          //         'assets/images/userImage.png'),
                          ),
                      Text(
                        profile['username'].toString(),
                        style: textTheme.apptextTheme.labelMedium,
                      ),
                      Text(
                          textAlign: TextAlign.center,
                          style: textTheme.apptextTheme.labelSmall,
                          profile['bio'] ??
                              'I am delighted to introduce myself'),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: SizedBox(
                          width: MediaQuery.sizeOf(context).width,
                          height: 100,
                          child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) {
                                return Row(
                                  children: [
                                    const SizedBox(
                                      width: 35,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(
                                          builder: (context) {
                                            return screens[index];
                                          },
                                        ));
                                      },
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            data[index],
                                            style: textTheme
                                                .apptextTheme.bodyLarge,
                                          ),
                                          Text(
                                            dataName[index],
                                            style: textTheme
                                                .apptextTheme.labelLarge,
                                          )
                                        ],
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 35,
                                    ),
                                  ],
                                );
                              },
                              separatorBuilder: (context, index) {
                                return const VerticalDivider(
                                  color: colors.whiteColor,
                                  indent: 20,
                                  endIndent: 20,
                                  thickness: 1,
                                  //width: 50,
                                );
                              },
                              itemCount: 3),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          gestureDetector(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => editProfile()));
                            },
                            textData: 'Edit profile',
                            textStyle: textTheme.apptextTheme.labelLarge,
                            isColored: false,
                          ),
                          gestureDetector(
                            onPressed: () {
                              geteditProfile(
                                  "Naman Singh", "This is the bio of me");
                            },
                            textData: 'Share profile',
                            isColored: false,
                            textStyle: textTheme.apptextTheme.labelLarge,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Container(
                          width: MediaQuery.sizeOf(context).width,
                          height: MediaQuery.sizeOf(context).height * 0.7,
                          child: const mainProfile()),
                    ],
                  ),
                ),
              );
            }
          },
        ))
      ],
    )));
  }
}
