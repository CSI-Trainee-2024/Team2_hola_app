import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hola_app/loginScreens/components/customInput1.dart';
import 'package:hola_app/loginScreens/register.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:image_picker/image_picker.dart';

class editProfile extends StatefulWidget {
  const editProfile({super.key});

  @override
  State<editProfile> createState() => _editProfileState();
}

class _editProfileState extends State<editProfile> {
  final nameController = TextEditingController(text: 'Paul Jarvis');
  final userController = TextEditingController(text: 'Allen003');
  final bioController =
      TextEditingController(text: 'Trust the process of nature');

  // image upload
  File? selectedImage;

  Future<void> pickImage(ImageSource source) async {
    final ImagePicker picker = ImagePicker();
    final XFile? pickedFile = await picker.pickImage(source: source);

    if (pickedFile != null && pickedFile.path.isNotEmpty) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit profile',
          style: textTheme.apptextTheme.bodyLarge,
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => registorScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
        child: SingleChildScrollView(
          child: Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: selectedImage != null
                            ? FileImage(selectedImage!) as ImageProvider
                            : const AssetImage('assets/images/userImage.png'),
                      )
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              TextButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            ListTile(
                              leading: Icon(Icons.camera),
                              title: Text('Take a photo'),
                              onTap: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.camera);
                              },
                            ),
                            ListTile(
                              leading: Icon(Icons.photo),
                              title: Text('Choose from gallery'),
                              onTap: () {
                                Navigator.pop(context);
                                pickImage(ImageSource.gallery);
                              },
                            ),
                          ],
                        );
                      });
                },
                child: Text(
                  'Edit picture',
                  style: textTheme.apptextTheme.bodyMedium,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              inputField1(
                controller1: nameController,
                obscureText: false,
                labelText: 'Name',
              ),
              const SizedBox(
                height: 20,
              ),
              inputField1(
                controller1: userController,
                obscureText: false,
                labelText: 'Username',
              ),
              const SizedBox(
                height: 20,
              ),
              inputField1(
                  controller1: bioController,
                  labelText: 'Bio',
                  obscureText: false)
            ],
          ),
        ),
      ),
    );
  }
}
