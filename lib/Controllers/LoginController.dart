import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/Snakbar.dart';
import '../SharedPreferences.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  Future<void> login() async {
    isLoading.value = false;
    if (emailController.text != '' && passwordController.text != '') {
      isLoading.value = true;
      try {
        UserCredential user = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email:emailController.text,
          password:passwordController.text,
        );
        saveData(emailController.text);
        // Get.off(MainDashboardPage());
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        showErrorSnackbar('Error: Wrong Credentials');
      }
    } else {
      isLoading.value = false;
      showErrorSnackbar('Please fill all the fields first');
    }
  }
}
