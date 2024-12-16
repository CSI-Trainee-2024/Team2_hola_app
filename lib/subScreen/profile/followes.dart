import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/chatting/chatSection.dart';
import 'package:hola_app/subScreen/otherUserProfile/mainPro.dart';
import 'package:hola_app/subScreen/profile/userProfileApi.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/utils/smallButton.dart';

class Followes extends StatefulWidget {
  const Followes({super.key});

  @override
  State<Followes> createState() => _FollowesState();
}

class _FollowesState extends State<Followes> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'Followers',
          style: textTheme.apptextTheme.headlineSmall,
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getFollowers(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
                        itemCount: userFollowes.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              //horizontalTitleGap: 10,
                              minVerticalPadding: 5,
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
                                userFollowes[index]
                                    .username
                                    .toString()
                                    .split('@')[0],
                                style: textTheme.apptextTheme.bodyLarge,
                              ),
                              subtitle: Text(
                                userFollowes[index].id.toString(),
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
