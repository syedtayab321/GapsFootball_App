import 'package:cloud_firestore/cloud_firestore.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> sendMessage({
    required String conversationId,
    required String senderId,
    required String receiverId,
    required String message,
    required String userName,
  }) async {
    try {
      final messageData = {
        "senderId": senderId,
        "receiverId": receiverId,
        "message": message,
        "timestamp": FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection('conversations')
          .doc(conversationId)
          .collection('messages')
          .add(messageData);

      final conversationData = {
        "userId": senderId,
        "userName": userName,
        "adminId": receiverId,
        "lastMessage": message,
        "timestamp": FieldValue.serverTimestamp(),
      };

      await _firestore
          .collection('conversations')
          .doc(conversationId)
          .set(conversationData);
    } catch (e) {
      print("Error sending message: $e");
    }
  }

  Stream<QuerySnapshot> getMessages(String conversationId) {
    return _firestore
        .collection('conversations')
        .doc(conversationId)
        .collection('messages')
        .orderBy('timestamp', descending: false)
        .snapshots();
  }

  Stream<QuerySnapshot> getConversations() {
    return _firestore.collection('conversations').orderBy('timestamp', descending: true).snapshots();
  }
}
