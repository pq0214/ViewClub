import 'package:clubproject/Page/event_page.dart';
import 'package:clubproject/Page/event_summary.dart';
import 'package:clubproject/Page/forum_admin.dart';
import 'package:clubproject/Page/info_page.dart';
import 'package:clubproject/Page/organization_page.dart';
import 'package:clubproject/Page/profile_page.dart';
import 'package:clubproject/Page/search_page.dart';
import 'package:clubproject/Page/forum_page.dart';
import 'package:clubproject/models/club.dart';
import 'package:clubproject/models/organizational.dart';
import 'package:flutter/material.dart';
import 'models/variable.dart';

void main() {
  runApp(const HomeApp());
}

class HomeApp extends StatefulWidget {
  const HomeApp({super.key});

  @override
  State<HomeApp> createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {
  int _selectedIndex = 0;
  String userType = '';
  String username = '';
  String password = '';
  List<Widget> screen = [];
  late Club club;
  late Org org;
  @override
  void initState() {
    super.initState();
    userType = variable.userType;
    club = Club();
    org = Org();
    if (userType == "User") {
      screen = [
        const ForumPage(),
        SearchPage(
          club: club,
        ),
        const EventSummary(),
        ProfilePage(),
      ];
    } else {
      screen = [
        const InfoPage(),
        const ForumAdmin(),
        ProfilePage(),
        const OrganisationPage(),
        const EventPage(),
      ];
    }
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  } //screenindex

  List<BottomNavigationBarItem> _setBottomNavBarItems() {
    if (userType == "User") {
      return const [
        BottomNavigationBarItem(
          icon: Icon(Icons.forum),
          label: 'Forum',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search),
          label: 'Search',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Event',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Profile',
        ),
      ];
    } else {
      return const [
        BottomNavigationBarItem(
          icon: Icon(Icons.info),
          label: 'Info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.message),
          label: 'Forum',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.group),
          label: 'Organisation',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.event),
          label: 'Event',
        ),
      ];
    }
  } //set navigation bar according to usertype

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: IndexedStack(
            index: _selectedIndex,
            children: screen,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          items: _setBottomNavBarItems(),
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.purple[300],
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
