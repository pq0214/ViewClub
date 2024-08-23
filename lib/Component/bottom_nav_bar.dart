import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

//complete
class MyBottomNavBar extends StatelessWidget {
  final void Function(int)? onTabChange;
  const MyBottomNavBar({
    super.key,
    required this.onTabChange,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(25.0),
      child: GNav(
          onTabChange: (value) => onTabChange!(value),
          color: Colors.grey[400],
          mainAxisAlignment:
              MainAxisAlignment.center, //move the button of icon to center
          tabs: const [
            GButton(
              icon: Icons.favorite_outlined,
              text: 'Favourite',
            ),
            GButton(
              icon: Icons.circle,
              text: 'Club',
            ),
          ]),
    );
  }
}
