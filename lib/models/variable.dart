import 'package:flutter/widgets.dart';

class variable {
  static String _username = '';
  static String _password = '';
  static String _userType = '';
  static String _name = '';
  static String _email = '';
  static String clubName = 'Syntech';
  int counter = 0;
  static List<Map<String, dynamic>> users = [
    {
      "username:": "peiqi",
      "password:": "peiqi",
      "name:": "Lee Pei Qi",
      "usertype:": "User",
      "email:": "pei_22002863@utp.edu.my",
    },
    {
      "username:": "test",
      "password:": "test",
      "name:": "Syntech",
      "usertype:": "Club",
      "email:": "syntech@utp.edu.my",
    },
  ];

  static bool checkUser(String username) {
    for (var user in users) {
      if (user["username:"] == username) {
        return false;
      }
    }
    return true;
  }

  static void addUser(String username, String password, String userType) {
    users.add({
      "username:": username,
      "password:": password,
      "usertype:": userType,
    });
  }

  static String setUserType(String newUsername, String newPassword) {
    _username = newUsername;
    _password = newPassword;
    _userType = getUserType(_username, _password);
    _email = getEmail(_username);
    _username = getName(username);

    return _userType;
  }

  static String getName(String username) {
    for (var user in users) {
      if (user["username:"] == username) {
        _name = user["name:"];
        if (_userType == "Club") {
          clubName = user["name:"];
        }
        return user["name:"];
      }
    }
    return _name;
  }

  static String getEmail(String username) {
    for (var user in users) {
      if (user["username:"] == username) {
        _email = user["email:"];

        return user["email:"];
      }
    }
    return _email;
  }

  static String getUserType(String username, String password) {
    for (var user in users) {
      if (user["username:"] == username && user["password:"] == password) {
        return user["usertype:"];
      } else if (user["username:"] == username &&
          user["password:"] != password) {
        return "Password";
      }
    }
    return "Unknown";
  }

  static String get userType => _userType;
  static String get name => _name;
  static String get username => _username;
  static String get email => _email;

  static Map<String, List<Map<String, dynamic>>> clubInfo = {
    "Syntech": [
      {"title": "history", "content": "history of the club"},
      {"title": "activities", "content": "activities done by the club"}
    ],
    "Chinese Cultural Club(CCC)": [
      {"title": "history", "content": "history of the club"},
      {"title": "activities", "content": "activities done by the club"},
      {"title": "achivement", "content": "achievement won by the club"}
    ]
  };

  static Map<String, TextEditingController> _replyControllers = {};
  static List<Map<String, dynamic>> _posts = [
    {
      'id': '1',
      'title': 'Happy Chinese New Year',
      'content': 'Wish all of you a happy Chinese new year. 新年快乐 万事如意 身体健康',
      'clubName': 'UTP CCC',
      'hashtags': ['#CNY2024', '#festive'],
      'replies': <String>[],
    },
    {
      'id': '2',
      'title': 'Workshop #007',
      'content': 'Join us now on Saturday 24/2/2024 at Block 1 4pm.',
      'clubName': 'CLUB1',
      'hashtags': ['#workshop', '#learning'],
      'replies': <String>[],
    },
    {
      'id': '3',
      'title': 'Recruitment Drive',
      'content':
          'This is your opportunity to join our club!! Click on this link to register: https://bit.ly/y70taS3w6',
      'clubName': 'UTP Wyvern DodgeBall',
      'hashtags': ['#recruit', '#cool'],
      'replies': <String>[],
    }
  ];

  static Map<String, TextEditingController> get replyControllers =>
      _replyControllers;
  static List<Map<String, dynamic>> get posts => _posts;

  static Map<String, List<Map<String, dynamic>>> clubOrg = {
    "Syntech": [
      {
        "position": "President",
        "name": "Pres1",
        "email": "pres@utp.edu.my",
      },
      {
        "position": "Vice President",
        "name": "VPres1",
        "email": "vicepres@utp.edu.my",
      },
      {
        "position": "Secretary",
        "name": "Secre1",
        "email": "secre@utp.edu.my",
      },
      {
        "position": "Vice Secretary",
        "name": "VSecre1",
        "email": "secre@utp.edu.my",
      },
      {
        "position": "Tresurer",
        "name": "Tres1",
        "email": "Tres1@utp.edu.my",
      },
    ],
    "Chinese Cultural Club(CCC)": [
      {
        "position": "C_President",
        "name": "C_Pres1",
        "email": "c_pres@utp.edu.my",
      },
      {
        "position": "C_Vice President",
        "name": "C_VPres1",
        "email": "c_vicepres@utp.edu.my",
      },
      {
        "position": "C_Secretary",
        "name": "C_Secre1",
        "email": "c_secre@utp.edu.my",
      },
      {
        "position": "C_Vice Secretary",
        "name": "C_VSecre1",
        "email": "c_secre@utp.edu.my",
      },
      {
        "position": "C_Tresurer",
        "name": "C_Tres1",
        "email": "c_Tres1@utp.edu.my",
      },
    ],
  };
  static Map<String, List<Map<String, dynamic>>> clubEvent = {
    "Syntech": [
      {
        "title": "Event 1",
        "content": "about tech club",
        "date": "3 January 2024",
        "time": "5-7pm",
        "venue": "block k"
      },
      {
        "title": "Event 2",
        "content": "more to tech",
        "date": "5 January 2024",
        "time": "5-7pm",
        "venue": "block b"
      },
    ],
    "Chinese Cultural Club(CCC)": [
      {
        "title": "C_Event 2",
        "content": "about ccc club",
        "date": "7 January 2024",
        "time": "5-7pm",
        "venue": "ch"
      },
      {
        "title": "C_Event 2",
        "content": "more to ccc",
        "date": "3 January 2024",
        "time": "5-7pm",
        "venue": "mainhall"
      },
    ]
  };

  static void addEvent(String clubName, Map<String, dynamic> eventData) {
    clubEvent[clubName]!.add(eventData);
  }

  static void addInfo(String clubName, Map<String, dynamic> infoData) {
    clubInfo[clubName]!.add(infoData);
  }
}
