import 'package:flutter/material.dart';
import 'package:clubproject/models/variable.dart';
import 'package:clubproject/Page/add_event.dart';
import 'package:flutter/widgets.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key});

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  late String clubname = variable.clubName;
  late List<Map<String, dynamic>>? ClubData;
  late List<bool> isEditing;
  late List<TextEditingController> titleControllers;
  late List<TextEditingController> contentControllers;
  late List<TextEditingController> dateControllers;
  late List<TextEditingController> timeControllers;
  late List<TextEditingController> venueControllers;

  @override
  void initState() {
    super.initState();
    // Update ClubData with the latest data after adding the event
    ClubData = variable.clubEvent[clubname];
    isEditing = List.filled(ClubData!.length, false);
    titleControllers = ClubData!
        .map((data) => TextEditingController(text: data["title"]))
        .toList();
    contentControllers = ClubData!
        .map((data) => TextEditingController(text: data["content"]))
        .toList();
    dateControllers = ClubData!
        .map((data) => TextEditingController(text: data["date"]))
        .toList();
    timeControllers = ClubData!
        .map((data) => TextEditingController(text: data["time"]))
        .toList();
    venueControllers = ClubData!
        .map((data) => TextEditingController(text: data["venue"]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              const Text(
                "Event Page",
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(height: 25),
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
                                              variable.clubInfo[clubname]![
                                                      index]["date"] =
                                                  dateControllers[index].text;
                                              variable.clubInfo[clubname]![
                                                      index]["time"] =
                                                  timeControllers[index].text;
                                              variable.clubInfo[clubname]![
                                                      index]["venue"] =
                                                  venueControllers[index].text;
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
                                        decoration: const InputDecoration(
                                          border: InputBorder.none,
                                        ),
                                      ),
                                    )
                                  : Text(
                                      ClubData?[index]["content"],
                                    ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const Divider(),
                            if (isEditing[index])
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Date:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: dateControllers[index],
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Time:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: timeControllers[index],
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Venue:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      const SizedBox(
                                        width: 10,
                                      ),
                                      Expanded(
                                        child: TextField(
                                          controller: venueControllers[index],
                                          decoration: const InputDecoration(
                                            border: InputBorder.none,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            else
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      const Text(
                                        'Date:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        ClubData?[index]["date"],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Time:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        ClubData?[index]["time"],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      const Text(
                                        'Venue:',
                                        style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.w800,
                                        ),
                                      ),
                                      Text(
                                        ClubData?[index]["venue"],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
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
              builder: (context) => AddEventPage(
                addEventCallback: _addEvent,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addEvent(Map<String, dynamic> newEvent) {
    // Add the new event to the list
    setState(() {
      variable.addEvent(clubname, newEvent);
      // Update ClubData with the latest data after adding the event
      ClubData = variable.clubEvent[clubname];
      isEditing = List.filled(ClubData!.length, false);
      titleControllers = ClubData!
          .map((data) => TextEditingController(text: data["title"]))
          .toList();
      contentControllers = ClubData!
          .map((data) => TextEditingController(text: data["content"]))
          .toList();
      dateControllers = ClubData!
          .map((data) => TextEditingController(text: data["date"]))
          .toList();
      timeControllers = ClubData!
          .map((data) => TextEditingController(text: data["time"]))
          .toList();
      venueControllers = ClubData!
          .map((data) => TextEditingController(text: data["venue"]))
          .toList();
    });
  }
}
