import 'package:flutter/material.dart';
import 'package:clubproject/models/variable.dart';

void main() {
  runApp(const ForumPage());
}

class ForumPage extends StatefulWidget {
  const ForumPage({Key? key}) : super(key: key);
  @override
  _ForumPageState createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage> {
  late Map<String, TextEditingController> _replyControllers;
  @override
  void initState() {
    super.initState();
    _replyControllers = {}; // Initialize reply controllers map
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
                    replies: variable.posts[index]['replies']
                        as List<String>, // Cast replies to List<String>
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
    );
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
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
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
                    fontFamily: 'LoveloBlack'),
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
            ...replies!.asMap().entries.map((entry) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5.0),
                  child: Text(
                    'Reply #${entry.key + 1}: ${entry.value}',
                    style: const TextStyle(fontStyle: FontStyle.italic),
                  ),
                )),
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
