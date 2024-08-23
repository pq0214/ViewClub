import 'package:clubproject/Page/club_home.dart';
import 'package:flutter/material.dart';
import 'package:clubproject/Component/clubtile_title.dart';
import 'package:clubproject/models/club.dart';

class SearchPage extends StatefulWidget {
  final Club club;
  const SearchPage({super.key, required this.club});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void addClub(Club_display club) {
    widget.club.addClub(club);
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
                delegate: CustomSearchDelegate(club: widget.club),
              );
            },
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Center(
          child: Column(
            children: [
              const Text(
                "Join us in Club",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.club.club.length,
                  itemBuilder: (context, index) {
                    Club_display eachClub = widget.club.club[index];
                    return ClubTile(
                      icon: const Icon(Icons.favorite_outline_outlined),
                      club: eachClub,
                      nextPage: ClubHome(),
                      // onPressed: () => addClub(eachClub),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate {
  final Club club;
  late List<String> searchTerm;

  CustomSearchDelegate({required this.club}) {
    searchTerm = club.club.map((club) => club.c_name).toList();
  }

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
