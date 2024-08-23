import 'package:clubproject/models/organizational.dart';
import 'package:clubproject/models/variable.dart';
import 'package:flutter/material.dart';
import 'package:clubproject/utils.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:typed_data';

class OrganizeTile extends StatefulWidget {
  final OrganizationalDisplay org;

  const OrganizeTile({
    super.key,
    required this.org,
  });

  @override
  State<OrganizeTile> createState() => _OrganizeTileState();
}

class _OrganizeTileState extends State<OrganizeTile> {
  final bool click = true;
  Uint8List? _image;

  void selectImage() async {
    Uint8List? img = await pickImage(ImageSource.gallery);
    if (img != null) {
      setState(() {
        _image = img;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(
              12) //color for the box decoration and the border radius circular for circle edge of box
          ),
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 10),
      child: ListTile(
        title: Text(
          widget.org.o_position,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ), //change to president
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.org.o_name),
            Text(widget.org.o_email),
          ],
        ),
        leading: Stack(
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
              child: Visibility(
                visible: variable.userType != "User",
                child: IconButton(
                  onPressed: selectImage,
                  icon: const Icon(Icons.add_a_photo),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
