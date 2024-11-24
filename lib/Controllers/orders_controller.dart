import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaps_football_app/CustomWidgets/Snakbar.dart';
  Future<void> cancelOrder(String orderId) async {
    try {
      await FirebaseFirestore.instance.collection('Orders').doc(orderId).update({
        'status': 'Canceled',
        'canceled_at': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      showErrorSnackbar('Error canceling order: $e');
    }
  }
