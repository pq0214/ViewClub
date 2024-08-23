import 'package:flutter/material.dart';

class AddInfoPage extends StatefulWidget {
  final Function(Map<String, dynamic>) addInfoCallback;

  const AddInfoPage({Key? key, required this.addInfoCallback})
      : super(key: key);

  @override
  _AddInfoPageState createState() => _AddInfoPageState();
}

class _AddInfoPageState extends State<AddInfoPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Info'),
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
            ElevatedButton(
              onPressed: () {
                // Add the new event
                Map<String, dynamic> newInfo = {
                  'title': _titleController.text,
                  'content': _contentController.text,
                };

                // Call the callback function to add the new event
                widget.addInfoCallback(newInfo);

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
    super.dispose();
  }
}
