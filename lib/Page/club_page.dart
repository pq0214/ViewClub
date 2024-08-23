import 'package:clubproject/Page/club_home.dart';
import 'package:flutter/material.dart';

class ClubPage extends StatelessWidget {
  const ClubPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
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
                  MaterialPageRoute(builder: (context) => ClubHome()),
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
      ),
    );
  }
}
