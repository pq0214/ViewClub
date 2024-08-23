import 'package:flutter/material.dart';
import 'package:clubproject/models/variable.dart';

class EventSummary extends StatefulWidget {
  const EventSummary({Key? key});

  @override
  State<EventSummary> createState() => _EventSummaryState();
}

class _EventSummaryState extends State<EventSummary> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          child: Column(
            children: [
              const Text(
                "Event Page",
                style: TextStyle(fontSize: 20),
              ),
              Expanded(
                // Added Expanded widget here
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: ListView.builder(
                    itemCount: variable.clubEvent.length,
                    itemBuilder: (context, clubIndex) {
                      final clubName =
                          variable.clubEvent.keys.toList()[clubIndex];
                      final clubData = variable.clubEvent[clubName]!;
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10),
                          Text(
                            clubName,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          ListView.builder(
                            itemCount: clubData.length,
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemBuilder: (context, eventIndex) {
                              final event = clubData[eventIndex];
                              return Container(
                                margin: EdgeInsets.only(bottom: 10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  border:
                                      Border.all(color: Colors.grey.shade300),
                                ),
                                child: ListTile(
                                  title: Text(event["title"]),
                                  subtitle: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Divider(),
                                      Align(
                                        child: Text(event["content"]),
                                        alignment: Alignment.topLeft,
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      const Divider(),
                                      SizedBox(height: 5),
                                      Text(
                                        'Date: ${event["date"]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Time: ${event["time"]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        'Venue: ${event["venue"]}',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10.0),
                                              ),
                                              fixedSize: Size(120, 50)),
                                          onPressed: () {},
                                          child: Text(
                                            'Register',
                                            style: TextStyle(
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15,
                                            ),
                                          ),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
