import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/api/videoApi.dart';
import 'package:hola_app/subScreen/reels/allReels.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';

class reelPage extends StatefulWidget {
  const reelPage({super.key});

  @override
  State<reelPage> createState() => _reelPageState();
}

class _reelPageState extends State<reelPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Column(
      children: [
        Expanded(
            child: FutureBuilder(
          future: videoAPi(),
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
                    'Loading...',
                    style: textTheme.apptextTheme.bodyLarge,
                  )
                ],
              );
            } else {
              return PageView.builder(
                scrollDirection: Axis.vertical,
                itemCount: videoList.length,
                itemBuilder: (context, index) {
                  return reelItems(
                      urlVideo: videoList[index].videoUrl,
                      thumbnailUrl: videoList[index].thumbnailUrl,
                      );
                },
              );
            }
          },
        ))
      ],
    )));
  }
}
