import 'package:flutter/material.dart';
import 'package:clubproject/models/variable.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Welcome to the Forum Page!',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ForumAdmin(),
    );
  }
}

class ForumAdmin extends StatefulWidget {
  const ForumAdmin({Key? key}) : super(key: key);

  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumAdmin> {
  Map<String, TextEditingController> _replyControllers = {};

  @override
  void initState() {
    super.initState();
    _replyControllers = {};
    // Initialize reply controllers for each post
    variable.posts.forEach((post) {
      _replyControllers[post['id']] = TextEditingController();
    });
  }

  @override
  void dispose() {
    // Dispose reply controllers to prevent memory leaks
    _replyControllers.values.forEach((controller) {
      controller.dispose();
    });
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Column(
          children: [
            const Text(
              "Forum Page",
              style: TextStyle(fontSize: 20),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: variable.posts.length,
                itemBuilder: (context, index) {
                  return PostWidget(
                    title: variable.posts[index]['title'],
                    content: variable.posts[index]['content'],
                    clubName: variable.posts[index]['clubName'],
                    hashtags: variable.posts[index]['hashtags'],
                    replies: variable.posts[index]['replies'] as List<String>,
                    // Cast replies to List<String>
                    replyController:
                        _replyControllers[variable.posts[index]['id']],
                    onReply: (replyContent) {
                      // Handle reply submission here
                      setState(() {
                        variable.posts[index]['replies'].add(replyContent);
                        _replyControllers[variable.posts[index]['id']]!.clear();
                      });
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navigate to a page to add a new forum post
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddPostPage(
                addPostCallback: _addPost,
              ),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _addPost(Map<String, dynamic> newPost) {
    // Add the new post to the list
    setState(() {
      variable.posts.add(newPost);
      // Initialize reply controller for the new post
      _replyControllers[newPost['id']] = TextEditingController();
    });
  }
}

class PostWidget extends StatelessWidget {
  final String title;
  final String content;
  final String clubName;
  final List<String> hashtags;
  final List<String>? replies;
  final TextEditingController? replyController;
  final Function(String)? onReply;

  const PostWidget({
    Key? key,
    required this.title,
    required this.content,
    required this.clubName,
    required this.hashtags,
    this.replies,
    this.replyController,
    this.onReply,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'LoveloBlack',
                ),
              ),
              const SizedBox(height: 5),
              Text(
                clubName,
                style: const TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  content,
                ),
              ),
              const SizedBox(width: 10),
              Wrap(
                spacing: 5,
                children:
                    hashtags.map((tag) => Chip(label: Text(tag))).toList(),
              ),
            ],
          ),
          const SizedBox(height: 10),
          if (replies != null)
            ...replies!.asMap().entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(
                      'Anon #${entry.key + 1}: ${entry.value}',
                      style: const TextStyle(fontStyle: FontStyle.italic),
                    ),
                  ),
                ),
          if (replyController != null && onReply != null) ...[
            TextField(
              controller: replyController,
              decoration: const InputDecoration(
                hintText: 'Write your reply here.....',
              ),
            ),
            const SizedBox(height: 5),
            ElevatedButton(
              onPressed: () {
                if (replyController!.text.trim().isNotEmpty) {
                  onReply!(replyController!.text.trim());
                  replyController!.clear();
                }
              },
              child: const Text('Reply'),
            ),
          ],
        ],
      ),
    );
  }
}

class AddPostPage extends StatefulWidget {
  final Function(Map<String, dynamic>) addPostCallback;

  const AddPostPage({Key? key, required this.addPostCallback})
      : super(key: key);

  @override
  _AddPostPageState createState() => _AddPostPageState();
}

class _AddPostPageState extends State<AddPostPage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _contentController = TextEditingController();
  final TextEditingController _hashtagsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add New Forum Post'),
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
              controller: _hashtagsController,
              decoration: const InputDecoration(
                labelText: 'Hashtags (comma-separated)',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Add the new post
                Map<String, dynamic> newPost = {
                  'id': DateTime.now().millisecondsSinceEpoch.toString(),
                  'title': _titleController.text,
                  'content': _contentController.text,
                  'clubName': variable.clubName,
                  'hashtags': _hashtagsController.text
                      .split(',')
                      .map((e) => '#' + e.trim())
                      .toList(),
                  'replies': <String>[],
                };

                // Call the callback function to add the new post
                widget.addPostCallback(newPost);

                // Navigate back to the forum page
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
    _hashtagsController.dispose();
    super.dispose();
  }
}
