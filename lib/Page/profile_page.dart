import 'package:flutter/material.dart';
import 'package:clubproject/Component/text_box.dart';
import 'package:clubproject/models/variable.dart';
import 'package:clubproject/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Uint8List? _image;

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });
    }
  }

  Future<void> editField(BuildContext context, String field) async {
    String newValue = "";
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.grey[900],
        title: Text(
          "Edit $field",
          style: const TextStyle(color: Colors.white),
        ),
        content: TextField(
          autofocus: true,
          style: const TextStyle(color: Colors.white),
          decoration: InputDecoration(
            hintText: "Enter new $field",
            hintStyle: const TextStyle(color: Colors.grey),
          ),
          onChanged: (value) {
            newValue = value;
          },
        ),
        actions: [
          TextButton(
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () => Navigator.pop(context)),
          TextButton(
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () => Navigator.of(context).pop(newValue),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        child: Column(
          children: [
            const Text(
              "Profile Page",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(height: 50),
                  Center(
                    child: Stack(
                      children: [
                        if (_image != null)
                          CircleAvatar(
                            radius: 64,
                            backgroundImage: MemoryImage(_image!),
                          ),
                        if (_image == null)
                          const CircleAvatar(
                            radius: 64,
                            backgroundImage: NetworkImage(
                                'https://media.istockphoto.com/id/1393750072/vector/flat-white-icon-man-for-web-design-silhouette-flat-illustration-vector-illustration-stock.jpg?s=612x612&w=0&k=20&c=s9hO4SpyvrDIfELozPpiB_WtzQV9KhoMUP9R9gVohoU='),
                          ),
                        Positioned(
                          bottom: -10,
                          left: 80,
                          child: IconButton(
                            onPressed: selectImage,
                            icon: const Icon(Icons.add_a_photo),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    variable.name,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    variable
                        .email, // Displaying email value from variable class
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                  ),
                  const SizedBox(height: 50),
                  const Padding(
                    padding: EdgeInsets.only(left: 25.0),
                    child: Text(
                      'My Account',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  MyTextBox(
                    text1: ('Username:${variable.name}'),
                    text2: ('Email:${variable.email}'),
                    sectionName: 'My Details',
                    onPressed: () => editField(context, ''),
                  ),
                  MyTextBox(
                    text1: 'Contact No: 016-8888888',
                    text2: 'Address: seri iskandar',
                    sectionName: 'Contact Info',
                    onPressed: () => editField(context, 'contactinfo'),
                  ),
                  Visibility(
                      visible: variable.userType != "Club",
                      child: Column(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Events',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          MyTextBox(
                            text1: 'Joke-A-Thon 2024',
                            text2: 'Project Harmony: CAVE project',
                            sectionName: 'My Favourite Events',
                            onPressed: () => editField(context, 'fav'),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 25.0),
                            child: Text(
                              'Registered Events',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          MyTextBox(
                            text1: 'Flutter Workshop',
                            text2: 'Cloud Computing Workshop',
                            sectionName: 'My Registered Events',
                            onPressed: () => editField(context, 'reg'),
                          ),
                        ],
                      ))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
