import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <Map<String, dynamic>>[].obs;

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  void fetchMessages(String chatId) {
    _firestore
        .collection('chats')
        .doc(chatId)
        .collection('messages')
        .orderBy('timestamp', descending: true)
        .snapshots()
        .listen((snapshot) {
      messages.clear();
      for (var doc in snapshot.docs) {
        messages.add(doc.data());
      }
    });
  }

  void sendMessage(String chatId, String message, String sender) {
    _firestore.collection('chats').doc(chatId).set({});
    _firestore.collection('chats').doc(chatId).collection('messages').add({
      'message': message,
      'sender': sender,
      'timestamp': FieldValue.serverTimestamp(),
      'isDeletedForAdmin': false,
      'isDeletedForEveryone': false,
    });
  }

  void deleteMessageForEveryone(String chatId, String messageId) {
    _firestore.collection('chats').doc(chatId).collection('messages').doc(messageId).update({
      'isDeletedForEveryone': true,
    });
  }

  void deleteMessageForAdmin(String chatId, String messageId) {
    _firestore.collection('chats').doc(chatId).collection('messages').doc(messageId).update({
      'isDeletedForAdmin': true,
    });
  }
}
