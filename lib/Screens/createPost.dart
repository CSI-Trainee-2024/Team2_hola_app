import 'dart:io';
import 'package:flutter/material.dart';
import 'package:hola_app/Screens/HomeScreen.dart';
import 'package:hola_app/Screens/navigationBar.dart';
import 'package:hola_app/subScreen/createPostSub/createPostApi.dart';
import 'package:hola_app/subScreen/createPostSub/postCreated.dart';
import 'package:hola_app/themes/colors.dart';
import 'package:hola_app/themes/customTheme/textTheme.dart';
import 'package:image_picker/image_picker.dart';

class createPostScreen extends StatefulWidget {
  const createPostScreen({super.key});

  @override
  State<createPostScreen> createState() => createPostScreenState();
}

class createPostScreenState extends State<createPostScreen> {
  final TextEditingController postController = TextEditingController();
  final TextEditingController captionController = TextEditingController();
  bool isLoading = false;

  File? selectedImage;
  Future<void> pickImage() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text(
          'CREATE POST',
          style: textTheme.apptextTheme.bodyLarge,
        ),
        leading: IconButton(
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => navigationBar()));
            },
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextField(
                controller: captionController,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Add a caption...',
                ),
              ),
              const SizedBox(height: 20),
              selectedImage != null
                  ? ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Image.file(
                        selectedImage!,
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    )
                  : Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: colors.greyColor),
                      child: Center(
                        child: Text(
                          'Select a Image',
                          style: textTheme.apptextTheme.titleLarge,
                        ),
                      ),
                    ),
              TextButton.icon(
                onPressed: pickImage,
                icon: const Icon(Icons.image),
                label: const Text('Upload Image'),
              ),
              const SizedBox(height: 10),
              // Post Content TextField
              TextField(
                controller: postController,
                maxLines: 2,
                decoration: const InputDecoration(
                  hintText: 'Add Tags...',
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (captionController.text.isNotEmpty) {
                    setState(() {
                      isLoading = true;
                    });
                    try {
                      print(captionController.text);
                      print(selectedImage?.path.toString());
                      await createdPost(
                          captionController.text.toString(),
                          selectedImage?.path.toString(),
                          postController.text.toString());
                      setState(() {
                        isLoading = false;
                      });
                    } catch (e) {
                      setState(() {
                        isLoading = false;
                      });
                    }
                  }
                  // to navigate to a next page
                  /* if (postController.text.isNotEmpty || selectedImage != null) {
                    setState(
                      () {
                        posts.add({
                          'text': postController.text,
                          'caption': captionController.text,
                          'image': selectedImage,
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => postCreated()));
                      },
                    );
                    postController.clear();
                    captionController.clear();
                    selectedImage = null;
                  }*/
                },
                child: const Text('Post'),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
