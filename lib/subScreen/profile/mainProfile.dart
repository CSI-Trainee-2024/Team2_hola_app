import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/api/allpostApi.dart';
import 'package:hola_app/themes/colors.dart';

class mainProfile extends StatefulWidget {
  const mainProfile({super.key});

  @override
  State<mainProfile> createState() => _mainProfileState();
}

class _mainProfileState extends State<mainProfile> {
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
                    mainAxisAlignment: MainAxisAlignment.start,
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
                  return GridView.builder(
                      //physics: NeverScrollableScrollPhysics(),
                      itemCount: postList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1.5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 10),
                      itemBuilder: (context, index) {
                        return ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                              fit: BoxFit.cover,
                              postList[index].downloadUrl.toString()),
                        );
                      });
                }
              }),
        )
      ],
    );
  }
}
