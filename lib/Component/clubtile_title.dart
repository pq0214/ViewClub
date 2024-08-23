import 'package:clubproject/models/club.dart';
import 'package:flutter/material.dart';
import 'package:clubproject/models/variable.dart';

class ClubTile extends StatelessWidget {
  final Widget nextPage;
  final Widget icon;
  final Club_display club;
  final bool click = true; //adding
  const ClubTile(
      {super.key,
      required this.club,
      required this.nextPage,
      required this.icon});

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
        title: Text(club.c_name),
        //subtitle: ,
        leading: Image.asset(club.c_logo),
        trailing: IconButton(
          icon: icon,
          onPressed: () {
            variable.clubName = club.c_name;
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => nextPage),
            );
          },
        ),
      ),
    );
  }
}
