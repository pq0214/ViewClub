import 'package:clubproject/models/club.dart';
import 'package:flutter/material.dart';
import 'package:clubproject/Component/bottom_nav_bar.dart';
import 'package:clubproject/Component/const.dart';
// import 'package:clubproject/Page/search_page.dart';
// import 'favourite_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Club club;
  void navigateBottomBar(int index) {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              showSearch(
                context: context,
                delegate: CustomSearchDelegate(),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      backgroundColor: backgroundColor,
      bottomNavigationBar: MyBottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      // body: _selectedIndex == 0
      //     ? FavouritePage()
      //     : SearchPage(
      //         club: club,
      //       ), // Display FavouritePage or ClubPage based on index
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  List<String> searchTerm = [
    'Chinese Cultural Club(CCC)',
    'Syntech',
  ];

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    throw UnimplementedError();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<String> matchQuery = [];
    for (var club in searchTerm) {
      if (club.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(club);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        var result = matchQuery[index];
        return ListTile(
          title: Text(result),
        );
      },
    );
  }
}
