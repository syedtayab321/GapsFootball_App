import 'package:flutter/material.dart';
import '../../CustomWidgets/TextWidget.dart';

class AdminMessageScreen extends StatelessWidget {
  final List<Map<String, String>> messages = [
    {
      'userName': 'John Doe',
      'lastMessage': 'Hello, I need more details about football coaching.',
      'time': '10:30 AM',
      'profileImage': 'assets/images/user1.png',
    },
    {
      'userName': 'Jane Smith',
      'lastMessage': 'Can I reschedule my session?',
      'time': '9:45 AM',
      'profileImage': 'assets/images/user2.png',
    },
    {
      'userName': 'Mark Johnson',
      'lastMessage': 'Thanks for the update!',
      'time': 'Yesterday',
      'profileImage': 'assets/images/user3.png',
    },
  ];

  AdminMessageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const CustomTextWidget(
          title: "Messages",
          color: Colors.black,
          weight: FontWeight.w500,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.search, color: Colors.black),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: messages.length,
        padding: const EdgeInsets.symmetric(vertical: 8),
        itemBuilder: (context, index) {
          final message = messages[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            child: ListTile(
              leading: const CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://th.bing.com/th/id/R.28674b3ec8aa1a32aa098ba1ce19a65a?rik=tSlhj5yOjXXeBw&pid=ImgRaw&r=0'),
                radius: 25,
              ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    message['userName']!,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Text(
                    message['time']!,
                    style: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
              subtitle: Text(
                message['lastMessage']!,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.black54,
                ),
              ),
              onTap: () {},
            ),
          );
        },
      ),
    );
  }
}
