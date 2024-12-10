import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/chatting/chatSection.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/utils/gesture.Detector.dart';

class OtherUserMain extends StatefulWidget {
  const OtherUserMain({super.key});

  @override
  State<OtherUserMain> createState() => _OtherUserMainState();
}

class _OtherUserMainState extends State<OtherUserMain> {
  List data = ['12', '2.1k', '400'];
  List dataName = ['Post', 'Followers', 'Following'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(25),
                child: Image.asset(
                  "assets/images/otherUser.png",
                  width: double.infinity,
                  height: 200,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage("assets/images/otherUserPhoto.png"),
              ),
              Text(
                'Paul Jarvis',
                style: textTheme.apptextTheme.labelMedium,
              ),
              Text(
                  textAlign: TextAlign.center,
                  style: textTheme.apptextTheme.labelSmall,
                  'I am delighted to introduce myself as a \nprofressional artist'),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  data[index],
                                  style: textTheme.apptextTheme.bodyLarge,
                                ),
                                Text(
                                  dataName[index],
                                  style: textTheme.apptextTheme.labelLarge,
                                )
                              ],
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
                            builder: (context) => ChatScreen(),
                          ));
                    },
                    textData: 'Message',
                  ),
                  gestureDetector(
                    onPressed: () {},
                    textData: 'Following',
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
