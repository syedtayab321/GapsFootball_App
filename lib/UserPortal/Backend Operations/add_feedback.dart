import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:gaps_football_app/CustomWidgets/Snakbar.dart';

class FeedbackService {
  final CollectionReference _feedbackCollection =
  FirebaseFirestore.instance.collection('feedback');

  Future<void> saveFeedback({required String feedback, required int rating}) async {
    User? user = FirebaseAuth.instance.currentUser;
    try {
      await _feedbackCollection.add({
        'userUid':user!.uid,
        'feedback': feedback,
        'rating': rating,
        'timestamp': FieldValue.serverTimestamp(),
      });
      showSuccessSnackbar("Feedback saved successfully!");
    } catch (e) {
     showErrorSnackbar("Error saving feedback: $e");
      rethrow;
    }
  }
}
