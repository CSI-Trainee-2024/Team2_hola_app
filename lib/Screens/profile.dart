import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/api/allpostApi.dart';
import 'package:hola_app/subScreen/profile/mainProfile.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:hola_app/utils/gesture.Detector.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({super.key});

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  List data = ['30', '1.5k', '1250'];
  List dataName = ['Post', 'Followers', 'Following'];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: SingleChildScrollView(
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Image.asset(
                'assets/images/natureImage.png',
                width: double.infinity,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const CircleAvatar(
            radius: 50,
            backgroundImage: AssetImage('assets/images/userImage.png'),
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
            child: Expanded(
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
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              gestureDetector(
                onPressed: () {},
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
          Container(
              width: MediaQuery.sizeOf(context).width,
              height: MediaQuery.sizeOf(context).height * 0.7,
              child: const mainProfile()),
        ],
      ),
    )));
  }
}
