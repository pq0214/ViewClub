import 'package:flutter/material.dart';
import 'package:clubproject/models/variable.dart'; // Import the variable file

class OrganizationalDisplay {
  final String o_position;
  final String o_name;
  final String o_email;

  OrganizationalDisplay({
    required this.o_position,
    required this.o_name,
    required this.o_email,
  });
}

class Org extends ChangeNotifier {
  List<OrganizationalDisplay> _orgdisplay = [];

  List<OrganizationalDisplay> get org => _orgdisplay;

  List<OrganizationalDisplay> _userCart = [];

  List<OrganizationalDisplay> get userCart => _userCart;

  void addOrg() {
    // Fetch organizational data for the selected clubName from the variable file
    List<Map<String, dynamic>> clubOrgData =
        variable.clubOrg[variable.clubName] ?? [];

    // Clear the existing organizational display
    _orgdisplay.clear();

    // Populate the organizational display with data for the selected club
    for (var orgData in clubOrgData) {
      _orgdisplay.add(OrganizationalDisplay(
        o_position: orgData['position'] ?? '',
        o_name: orgData['name'] ?? '',
        o_email: orgData['email'] ?? '',
      ));
    }

    notifyListeners();
  }

  void removeOrg(OrganizationalDisplay club) {
    _userCart.remove(club);
    notifyListeners();
  }
}
