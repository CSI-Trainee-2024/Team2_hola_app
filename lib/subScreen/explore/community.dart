import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/api/communityApi.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class communityPage extends StatefulWidget {
  const communityPage({super.key});

  @override
  State<communityPage> createState() => _communityPageState();
}

class _communityPageState extends State<communityPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: FutureBuilder(
          future: communityApi(),
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
                itemCount: communtiyList.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    minVerticalPadding: 20,
                    title: Text(communtiyList[index].users![2].toString()),
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
