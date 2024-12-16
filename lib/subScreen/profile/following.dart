import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/chatting/chatSection.dart';
import 'package:hola_app/subScreen/otherUserProfile/mainPro.dart';
import 'package:hola_app/subScreen/profile/userProfileApi.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/subScreen/api/allpostApi.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/utils/smallButton.dart';

class UserFollowing extends StatefulWidget {
  const UserFollowing({super.key});

  @override
  State<UserFollowing> createState() => _UserFollowingState();
}

class _UserFollowingState extends State<UserFollowing> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Following',
          style: textTheme.apptextTheme.headlineSmall,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getFollowing(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Column(
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
                      ),
                    );
                  } else {
                    return ListView.builder(
                        itemCount: userFollowing.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              //horizontalTitleGap: 10,
                              minVerticalPadding: 15,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const OtherUserMain()));
                              },
                              leading: const CircleAvatar(
                                radius: 40,
                                backgroundImage:
                                    AssetImage("assets/images/userImage.png"),
                              ),
                              title: Text(
                                userFollowing[index]
                                    .username
                                    .toString()
                                    .split('@')[0],
                                style: textTheme.apptextTheme.bodyLarge,
                              ),
                              subtitle: Text(
                                userFollowing[index].id.toString(),
                                style: textTheme.apptextTheme.displaySmall,
                              ),
                              trailing: Messaagebutton(
                                  buttonPadding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 8, vertical: 5),
                                  onButtonPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => ChatScreen(),
                                        ));
                                  },
                                  textData: 'Message'));
                        });
                  }
                }),
          ),
        ],
      ),
    ));
  }
}
