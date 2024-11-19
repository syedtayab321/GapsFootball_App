import 'package:get/get.dart';

class ChatController extends GetxController {
  var messages = <Map<String, String>>[
    {'sender': 'admin', 'message': 'Hello! How can I assist you today?'},
    {'sender': 'user', 'message': 'I need help with my account.'},
    {'sender': 'admin', 'message': 'Sure! What seems to be the issue?'},
  ].obs;
  void sendMessage(String message) {
    if (message.isNotEmpty) {
      messages.add({'sender': 'user', 'message': message});
      update();
    }
  }
}
