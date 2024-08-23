import 'package:flutter/material.dart';
import 'package:clubproject/models/variable.dart';
import 'package:clubproject/Page/add_info.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key});

  @override
  State<InfoPage> createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  late String clubname;
  late List<Map<String, dynamic>>? ClubData;
  late List<bool> isEditing;
  late List<TextEditingController> titleControllers;
  late List<TextEditingController> contentControllers;

  @override
  void initState() {
    super.initState();
    clubname = variable.clubName;
    ClubData = variable.clubInfo[clubname];
    isEditing = List.filled(ClubData!.length, false);
    titleControllers = ClubData!
        .map((data) => TextEditingController(text: data["title"]))
        .toList();
    contentControllers = ClubData!
        .map((data) => TextEditingController(text: data["content"]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              const Text(
                "Info Page",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 20),
              Expanded(
                child: ListView.builder(
                  itemCount: ClubData?.length ?? 0,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
                      child: Container(
                        constraints: BoxConstraints(minHeight: 200),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(color: Colors.grey.shade300),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                isEditing[index]
                                    ? Expanded(
                                        child: TextField(
                                          controller: titleControllers[index],
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      )
                                    : Text(
                                        ClubData?[index]["title"],
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                Visibility(
                                  visible: variable.userType != "User",
                                  child: Row(
                                    children: [
                                      IconButton(
                                        icon: const Icon(Icons.delete),
                                        onPressed: () {
                                          showDialog(
                                            context: context,
                                            builder: (BuildContext context) =>
                                                AlertDialog(
                                              title: const Text('Delete'),
                                              content: const Text(
                                                  'Are you sure to delete this section?'),
                                              actions: <Widget>[
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(
                                                        context); // Dismiss the dialog
                                                    setState(() {
                                                      variable
                                                          .clubInfo[clubname]
                                                          ?.removeAt(index);
                                                      // Delete the particular row
                                                    });
                                                  },
                                                  child: const Text('OK'),
                                                ),
                                                TextButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: const Text('Cancel'),
                                                ),
                                              ],
                                            ),
                                          );
                                        },
                                      ),
                                      IconButton(
                                        icon: Icon(isEditing[index]
                                            ? Icons.check
                                            : Icons.edit),
                                        onPressed: () {
                                          setState(() {
                                            isEditing[index] =
                                                !isEditing[index];
                                            if (!isEditing[index]) {
                                              // Save changes
                                              variable.clubInfo[clubname]![
                                                      index]["title"] =
                                                  titleControllers[index].text;
                                              variable.clubInfo[clubname]![
                                                      index]["content"] =
                                                  contentControllers[index]
                                                      .text;
                                            }
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                            const Divider(),
                            Align(
                              alignment: Alignment.topLeft,
                              child: isEditing[index]
                                  ? Expanded(
                                      child: TextField(
                                        controller: contentControllers[index],
                                        decoration: InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      ClubData?[index]["content"],
                                    ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to AddEventPage
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddInfoPage(
                addInfoCallback: _addInfo,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addInfo(Map<String, dynamic> newInfo) {
    // Add the new event to the list
    setState(() {
      variable.addInfo(clubname, newInfo);
      // Update ClubData with the latest data after adding the event
      ClubData = variable.clubInfo[clubname];
      isEditing = List.filled(ClubData!.length, false);
      titleControllers = ClubData!
          .map((data) => TextEditingController(text: data["title"]))
          .toList();
      contentControllers = ClubData!
          .map((data) => TextEditingController(text: data["content"]))
          .toList();
    });
  }
}
