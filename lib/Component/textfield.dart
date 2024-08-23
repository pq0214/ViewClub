import 'package:flutter/material.dart';

class textfield extends StatelessWidget {
  final controller;
  final String hintText;
  final bool obscureTest;

  const textfield({
    Key? key,
    required this.controller,
    required this.hintText,
    required this.obscureTest,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        controller: controller,
        obscureText: obscureTest, //hide text input
        decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey.shade400),
          ),
          fillColor: Colors.grey.shade200,
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[500]),
        ),
      ),
    );
  }
}
