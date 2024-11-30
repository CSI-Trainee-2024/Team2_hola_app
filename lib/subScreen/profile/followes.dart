import 'package:flutter/material.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/subScreen/api/allpostApi.dart';
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
          'Followes',
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
                    );
                  } else {
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                              //horizontalTitleGap: 10,
                              minVerticalPadding: 5,
                              onTap: () {
                                // Navigator.push(
                                //     context,
                                //     MaterialPageRoute(
                                //         builder: (context) => ));
                              },
                              leading: CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    postList[index].downloadUrl.toString()),
                              ),
                              title: Text(
                                postList[index].author.toString(),
                                style: textTheme.apptextTheme.labelLarge,
                              ),
                              subtitle: Text(
                                'Allen003',
                                style: textTheme.apptextTheme.displaySmall,
                              ),
                              trailing: Messaagebutton(
                                  buttonPadding:
                                      const EdgeInsetsDirectional.symmetric(
                                          horizontal: 8, vertical: 5),
                                  onButtonPressed: () {},
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
