import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../CustomWidgets/Snakbar.dart';

class BookNowController extends GetxController {

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneController = TextEditingController();
  final addressController = TextEditingController();

  final kitNameController = TextEditingController();
  final quantityController = TextEditingController();
  var kitSize = ''.obs;

  final ageController = TextEditingController();
  var sex = ''.obs;
  var position = ''.obs;
  var level = ''.obs;

  final locationController = TextEditingController();
  final concentrationController = TextEditingController();
  var isLoading = false.obs;
  User? user = FirebaseAuth.instance.currentUser;

  @override
  void onInit() {
    super.onInit();
    fetchUserDetails();
  }

  Future<void> fetchUserDetails() async {
    try {
      isLoading.value = true;

      final userDoc = await FirebaseFirestore.instance
          .collection('Users')
          .doc(user!.uid)
          .get();

      if (userDoc.exists) {
        final data = userDoc.data()!;
        nameController.text = data['name'] ?? '';
        emailController.text = data['email'] ?? '';
        phoneController.text = '';
        addressController.text = '';
      }
    } catch (e) {
      showErrorSnackbar('Failed to fetch user details: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void saveDetails(Map<String, dynamic> serviceData) async {
    try {
      Map<String, dynamic> bookingData = {
        'serviceDetails': serviceData,
        'name': nameController.text.trim(),
        'email': emailController.text.trim(),
        'uid': user!.uid,
        'status':'Pending',
        'created_at': FieldValue.serverTimestamp(),
      };

      if (serviceData['type'] == 'Uniform Booking') {
        bookingData.addAll({
          'User kitSize': kitSize.value,
          'User kitName': kitNameController.text.trim(),
          'User Quantity': quantityController.text.trim(),
        });
      } else if (serviceData['type'] == 'Group Session Booking') {
        bookingData.addAll({
          'User age': ageController.text.trim(),
          'User gender': sex.value,
          'User position': position.value,
          'User level': level.value,
        });
      } else if (serviceData['type'] == 'Private One-on-One Session') {
        bookingData.addAll({
          'User age': ageController.text.trim(),
          'User gender': sex.value,
          'User location': locationController.text.trim(),
          'User concentration': concentrationController.text.trim(),
        });
      }

      await FirebaseFirestore.instance.collection('Orders').add(bookingData);
      showSuccessSnackbar('Booking saved successfully!');
      clearFields();
    } catch (e) {
      showErrorSnackbar('Failed to save booking: $e');
    } finally {
      isLoading.value = false;
    }
  }

  void clearFields() {
    nameController.clear();
    emailController.clear();
    phoneController.clear();
    addressController.clear();
    kitNameController.clear();
    quantityController.clear();
    ageController.clear();
    locationController.clear();
    concentrationController.clear();
    kitSize.value = '';
    sex.value = '';
    position.value = '';
    level.value = '';
  }
}
