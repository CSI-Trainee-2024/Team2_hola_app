import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/api/followingApi.dart';
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
              future: followApi(),
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
                      itemCount: followList.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Text(
                            followList[index].author.toString(),
                            style: textTheme.apptextTheme.bodyLarge,
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
