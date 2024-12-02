import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaps_football_app/CustomWidgets/Snakbar.dart';
Future<void> orderConfirmation(String orderId, String status) async {
  try {
    Map<String, dynamic> updateData = {
      'status': status,
    };
    if (status == 'Canceled') {
      updateData['canceled_at'] = FieldValue.serverTimestamp();
    } else if (status == 'Approved') {
      updateData['approved_at'] = FieldValue.serverTimestamp();
    }
    await FirebaseFirestore.instance.collection('Orders').doc(orderId).update(updateData);
  } catch (e) {
    showErrorSnackbar('Error updating order: $e');
  }
}


Future<void>  deleteOrder(String uid) async {
  final orderRef = FirebaseFirestore.instance.collection('orders').doc(uid);
  await orderRef.delete();
  showErrorSnackbar("The order has been deleted.");
}