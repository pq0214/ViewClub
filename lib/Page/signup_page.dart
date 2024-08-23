import 'package:clubproject/Component/popup_msg.dart';
import 'package:clubproject/Page/login_page.dart';
import 'package:flutter/material.dart';
import 'package:clubproject/models/variable.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: SignUp(),
  ));
}

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  //text editing controller
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String userStatus = 'User';
  bool addUser = false;
  //sign in

  void signUpMethod(BuildContext context) {
    if (usernameController.text != '' && passwordController.text != '') {
      addUser = variable.checkUser(usernameController.text);
      if (addUser) {
        variable.addUser(
            usernameController.text, passwordController.text, userStatus);
        popUpMsg(
          context: context,
          title: 'Sign Up',
          content: 'Sign Up sucessfully! Please login again.',
          nextPage: const Login(),
        );
      } else {
        popUpMsg(
          context: context,
          title: 'Sign Up',
          content: 'Username is being used. Try to use a new username.',
          nextPage: const SignUp(),
        );
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Row(
          children: [
            Icon(
              Icons.warning,
              color: Colors.white38,
            ), // Icon
            SizedBox(width: 15),
            Text('Please fill in all the required field.'), // Text
          ],
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              const SizedBox(height: 50),
              //logo
              const Icon(
                Icons.how_to_reg,
                size: 100,
              ),
              const SizedBox(height: 50),
              //welcome back
              Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 25,
                ),
              ),

              const SizedBox(height: 50),

              //username
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: usernameController,
                  obscureText: false, //hide text input
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'UserName',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
              //password textfield
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: TextField(
                  controller: passwordController,
                  obscureText: true, //hide text input
                  decoration: InputDecoration(
                    enabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey.shade400),
                    ),
                    fillColor: Colors.grey.shade200,
                    filled: true,
                    hintText: 'Password',
                    hintStyle: TextStyle(color: Colors.grey[500]),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                          fixedSize: Size(200, 50)),
                      onPressed: () {
                        signUpMethod(context);
                      },
                      child: Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.grey[700],
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                        fixedSize: const Size(200, 50)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const Login()),
                      );
                    },
                    child: Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.grey[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
