import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:get/get.dart';
import 'chat_controller.dart';
import 'conversation_page.dart';

class AdminChatListScreen extends StatelessWidget {
  final ChatController chatController = Get.put(ChatController());
  AdminChatListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(title: 'Admin Chat List'),
        backgroundColor: Colors.blue,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('chats').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(child: Text("No users have contacted the admin yet"));
          }
          final users = snapshot.data!.docs;
          return ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final userId = user.id;

              return ListTile(
                title: Text(userId),
                onTap: () {
                  Get.to(() => ConversationPage(chatId: userId));
                },
              );
            },
          );
        },
      ),
    );
  }
}
