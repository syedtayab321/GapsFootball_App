import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:gaps_football_app/Messages/send_message.dart';
import 'package:get/get.dart';
import 'conversation_page.dart';

class AdminChatList extends StatelessWidget {
  final ChatService chatService = ChatService();
  AdminChatList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(
          title: "Users",
          weight: FontWeight.bold,
        ),
        backgroundColor: Colors.amber,
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: chatService.getConversations(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final conversations = snapshot.data!.docs;
          return ListView.builder(
            itemCount: conversations.length,
            itemBuilder: (context, index) {
              final conversationData =
              conversations[index].data() as Map<String, dynamic>;
              final userName = conversationData['userName'];
              final conversationId = conversations[index].id;

              return GestureDetector(
                onTap: () {
                  Get.to(
                    ConversationPage(
                      conversationId: conversationId,
                      senderId: conversationData['adminId'],
                      receiverId: conversationData['userId'],
                      userName: userName,
                    ),
                  );
                },
                child: Card(
                  margin: const EdgeInsets.symmetric(
                      horizontal: 10, vertical: 5),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ListTile(
                    contentPadding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                    leading: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.amber.shade100,
                      child: CustomTextWidget(
                       title:  userName.isNotEmpty
                            ? userName[0].toUpperCase()
                            : '?',
                          weight: FontWeight.bold,
                          size: 20,
                          color: Colors.amber.shade800,
                      ),
                    ),
                    title: Text(
                      userName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    subtitle: Text(
                      conversationData['lastMessage'],
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.grey,
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
