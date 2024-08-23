import 'package:flutter/material.dart';

class AddEventPage extends StatefulWidget {
  final Function(Map<String, dynamic>) addEventCallback;

  const AddEventPage({Key? key, required this.addEventCallback})
      : super(key: key);

  @override
  _AddEventPageState createState() => _AddEventPageState();
}

class _AddEventPageState extends State<AddEventPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _venueController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Event'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: const InputDecoration(
                labelText: 'Title',
              ),
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _contentController,
              decoration: const InputDecoration(
                labelText: 'Content',
              ),
              maxLines: null, // Allow multiple lines for content
            ),
            const SizedBox(height: 16.0),
            TextField(
              controller: _dateController,
              decoration: const InputDecoration(
                labelText: 'Date',
              ),
            ),
            TextField(
              controller: _timeController,
              decoration: const InputDecoration(
                labelText: 'Time',
              ),
            ),
            TextField(
              controller: _venueController,
              decoration: const InputDecoration(
                labelText: 'Venue',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add the new event
                Map<String, dynamic> newEvent = {
                  'title': _titleController.text,
                  'content': _contentController.text,
                  'date': _dateController.text,
                  'time': _timeController.text,
                  'venue': _venueController.text,
                };

                // Call the callback function to add the new event
                widget.addEventCallback(newEvent);

                // Navigate back to the previous page
                Navigator.pop(context);
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Dispose controllers
    _titleController.dispose();
    _contentController.dispose();
    _dateController.dispose();
    _timeController.dispose();
    _venueController.dispose();
    super.dispose();
  }
}
