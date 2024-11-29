import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/api/allpostApi.dart';
import 'package:hola_app/subScreen/api/communityApi.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/themes/models/allpost.dart';

class communityPage extends StatefulWidget {
  const communityPage({super.key});

  @override
  State<communityPage> createState() => _communityPageState();
}

class _communityPageState extends State<communityPage> {
  late Future<List<allpost>> futurePosts;
  @override
  void initState() {
    super.initState();
    futurePosts = getPostApi();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
          future: futurePosts,
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const CircularProgressIndicator(
                    color: colors.mainColor,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Loading...",
                    style: textTheme.apptextTheme.bodyLarge,
                  )
                ],
              );
            } else {
              return ListView.builder(
                itemCount: postList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    minVerticalPadding: 20,
                    title: Text(
                      postList[index].author.toString(),
                      //communtiyList[index].users![2].toString()
                      style: textTheme.apptextTheme.bodyLarge,
                    ),
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage(postList[index].downloadUrl.toString()),
                      radius: 30,
                    ),
                    subtitle: Text(
                      '7.4M Million',
                      style: textTheme.apptextTheme.bodySmall,
                    ),
                  );
                },
              );
            }
          },
        ))
      ],
    );
  }
}
