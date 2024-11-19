import 'package:flutter/material.dart';
import 'package:hola_app/subScreen/HomeSubScreen/notification.dart';

class homeScreen extends StatefulWidget {
  const homeScreen({super.key});

  @override
  State<homeScreen> createState() => _homeScreenState();
}

class _homeScreenState extends State<homeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 100,
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed:() {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>notificationScreen()));
            } ,),
          SizedBox(
            width: 30,
          ),
          Icon(Icons.message_outlined),
          SizedBox(
            width: 15,
          )
        ],
        title: Image.asset('assets/images/hola.png'),
      ),
    ));
  }
}
