import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/chatting/chatSection.dart';
import 'package:hola_app/subScreen/api/allpostApi.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class allchat extends StatefulWidget {
  const allchat({super.key});

  @override
  State<allchat> createState() => _allchatState();
}

class _allchatState extends State<allchat> {
  @override
  Widget build(BuildContext context) {
    return Column(
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
                        return ListTile(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ChatScreen()));
                          },
                          leading: CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                                postList[index].downloadUrl.toString()),
                          ),
                          title: Text(
                            postList[index].author.toString(),
                            style: textTheme.apptextTheme.bodyLarge,
                          ),
                          subtitle: Text(
                            'How was the day?',
                            style: textTheme.apptextTheme.titleMedium,
                          ),
                          trailing: IconButton(
                            icon: const Icon(
                              Icons.camera_enhance,
                              color: colors.whiteColor,
                            ),
                            onPressed: () {},
                          ),
                        );
                      });
                }
              }),
        ),
      ],
    );
  }
}
