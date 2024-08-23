import 'package:flutter/material.dart';

class Club_display {
  final String c_name;
  final String c_logo;

  Club_display({
    required this.c_name,
    required this.c_logo,
  });
}

class Club extends ChangeNotifier {
  static List<Club_display> _display = [
    Club_display(
      c_name: 'Chinese Cultural Club(CCC)',
      c_logo: "lib/images/CCC_logo.png",
    ),
    Club_display(
      c_name: 'Syntech',
      c_logo: "lib/images/Syntech_Logo.jpg",
    ),
  ];

  List<Club_display> _userCart = [];

  List<Club_display> get club => _display;

  List<Club_display> get userCart => _userCart;

  get length => null;

  void addClub(Club_display club) {
    _userCart.add(club);
    notifyListeners();
  }

  void removeClub(Club_display club) {
    _userCart.remove(club);
    notifyListeners();
  }
}
