import 'package:flutter/material.dart';

class MyTextBox extends StatelessWidget {
  final String text1;
  final String text2;
  final String sectionName;
  final void Function()? onPressed;

  const MyTextBox(
      {super.key,
      required this.text1,
      required this.text2,
      required this.sectionName,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.teal[100],
        borderRadius: BorderRadius.circular(8),
      ),
      padding: const EdgeInsets.only(left: 15, bottom: 15),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sectionName,
                      style: const TextStyle(
                          color: Color.fromARGB(255, 91, 84, 84),
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                    Text(text1, style: const TextStyle(color: Colors.black)),
                    Text(text2, style: const TextStyle(color: Colors.black)),
                  ],
                ),
              ),
              // IconButton(
              //   onPressed: () {},
              //   icon: Icon(
              //     Icons.edit,
              //     color: Colors.grey[500],
              //   ),
              // ),
            ],
          )
        ],
      ),
    );
  }
}
