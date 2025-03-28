import 'package:flutter/material.dart';
import 'package:hola_app/Screens/HomeScreen.dart';
import 'package:hola_app/Screens/explore.dart';
import 'package:hola_app/Screens/profile.dart';
import 'package:hola_app/Screens/createPost.dart';
import 'package:hola_app/Screens/reels.dart';

class navigationBar extends StatefulWidget {
  navigationBar({super.key});

  @override
  State<navigationBar> createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  int currentIndex = 0;

  final List screens = [
    const homeScreen(),
    const exploreScreen(),
    const createPostScreen(),
    const reelPage(),
    const profileScreen(),
  ];

  void itemTapped(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.explore), label: 'Explore'),
            BottomNavigationBarItem(
                icon: Icon(Icons.add_box_outlined), label: 'Reels'),
            BottomNavigationBarItem(icon: Icon(Icons.video_library_rounded), label: 'Reels'),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile')
          ],
          currentIndex: currentIndex,
          onTap: itemTapped,
        ),
      ),
    );
  }
}
