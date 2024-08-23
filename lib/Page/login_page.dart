import 'package:clubproject/Page/signup_page.dart';
import 'package:clubproject/home.dart';
import 'package:flutter/material.dart';
import 'package:clubproject/models/variable.dart';
import 'package:clubproject/Component/popup_msg.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Login(),
  ));
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  int _counter = 0;
  String message = "Your Password is Wrong, Please try again";

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 1) {
        message = "You forget your password ady is it?";
      } else if (_counter == 2) {
        message = "Forgot your password. Your brain has too many tabs open.";
      } else if (_counter == 3) {
        message =
            "Your memory abit bad. I think you could plan your surprise party.";
      } else if (_counter == 4) {
        message =
            "Soooooo Sorry, I misunderstand u. Your password is correct actually";
      } else {
        message =
            "Soooooo Sorry, I misunderstand u. Your password is correct actually";
      }
    });
  }

  //text editing controller
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  String userStatus = '';
  //sign in

  void signInMethod(BuildContext context) {
    String username = usernameController.text;
    String password = passwordController.text;
    userStatus = variable.setUserType(username, password);

    if (userStatus == "Unknown") {
      popUpMsg(
        context: context,
        title: 'Login',
        content: message,
        nextPage: const SignUp(),
      );
    } else if (userStatus == "Password") {
      popUpMsg(
        context: context,
        title: 'Login',
        content: message,
        nextPage: const Login(),
      );
    } else {
      if (_counter == 6) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => HomeApp()),
        );
      } else {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: Text('Login'),
            content: Text(message),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  _incrementCounter(); //increment the counter
                  if (_counter == 6) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => HomeApp(),
                      ),
                    );
                  } else {
                    Navigator.pop(context);
                  }
                },
                child: Text('OK lo'),
              ),
            ],
          ),
        );
      }
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
                Icons.book,
                size: 100,
              ),
              const SizedBox(height: 50),
              //welcome back
              Text(
                "Welcome back you've been missed",
                style: TextStyle(
                  color: Colors.grey[800],
                  fontSize: 16,
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
                        _incrementCounter();
                        signInMethod(context);
                      },
                      child: Text(
                        'Sign In',
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
                        fixedSize: Size(200, 50)),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => SignUp()),
                      );
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
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
