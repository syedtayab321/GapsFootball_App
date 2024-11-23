import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaps_football_app/CustomWidgets/Snakbar.dart';
import 'package:get/get.dart';

class AddServiceController extends GetxController {
  RxBool isLoading = false.obs;
  final selectedDate = ''.obs;
  final features = <String>[].obs;

  Future<void> saveService(String title, String description, double price, List<String> features) async {
    try {
      isLoading.value = true;
      await Future.delayed(const Duration(seconds: 2));

      await FirebaseFirestore.instance.collection('services').add({
        'title': title,
        'description': description,
        'price': price,
        'features': features,
        'createdAt': Timestamp.now(),
      });

      isLoading.value = false;
      showSuccessSnackbar('Service saved successfully!');
    } catch (e) {
      isLoading.value = false;
      showErrorSnackbar('Failed to save service: $e');
    }
  }
}