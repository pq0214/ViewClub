import 'package:clubproject/Page/event_summary.dart';
import 'package:clubproject/Page/forum_page.dart';
import 'package:clubproject/Page/info_page.dart';
import 'package:clubproject/Page/organization_page.dart';
import 'package:clubproject/models/organizational.dart';
import 'package:clubproject/models/variable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ClubHome(),
  ));
}

SpeedDialChild _buildSpeedDialChild(
    IconData icon, String label, Function(int) onTap, int index) {
  return SpeedDialChild(
    shape: const CircleBorder(),
    child: Icon(icon, size: 30),
    backgroundColor: Colors.white,
    foregroundColor: Colors.grey[500],
    label: label,
    labelBackgroundColor: Colors.transparent,
    labelStyle: const TextStyle(fontSize: 12.0),
    onTap: () => onTap(index),
  );
}

//import package

class ClubHome extends StatefulWidget {
  @override
  State<ClubHome> createState() => _ClubHomeState();
}

class _ClubHomeState extends State<ClubHome> {
  String clubname = '';
  int _selectedIndex = 0;
  List<Widget> screen = [];
  late Org org;
  @override
  void initState() {
    super.initState();
    org = Org();
    screen = [
      const InfoPage(),
      const ForumPage(),
      const EventSummary(),
      OrganisationPage(),
    ];
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(variable.clubName),
        leading: GestureDetector(
          onTap: () {
            // Add your onTap functionality here
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: IndexedStack(
          index: _selectedIndex,
          children: screen,
        ),
      ),
      floatingActionButton: SpeedDial(
        icon: Icons.menu,
        backgroundColor: Colors.grey.shade300,
        foregroundColor: Colors.white,
        activeIcon: Icons.close,
        activeBackgroundColor: Colors.blueGrey,
        activeForegroundColor: Colors.white,
        buttonSize: Size(56, 56), //button size
        visible: true,
        closeManually: false,
        curve: Curves.bounceIn,
        overlayColor: Colors.black,
        overlayOpacity: 0.5, //action when menu closes

        elevation: 8.0, //shadow elevation of button
        shape: const CircleBorder(),
        children: [
          _buildSpeedDialChild(Icons.info, 'Introduction', _onItemTapped, 0),
          _buildSpeedDialChild(Icons.forum, 'Forum', _onItemTapped, 1),
          _buildSpeedDialChild(Icons.event, 'Event', _onItemTapped, 2),
          _buildSpeedDialChild(Icons.group, 'Organisation', _onItemTapped, 3),
        ],
      ),
    );
  }
}
