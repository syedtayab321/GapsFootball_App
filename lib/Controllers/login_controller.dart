import 'package:gaps_football_app/UserPortal/UserDashboardPage.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../AdminPortal/admin_dashboard.dart';
import '../CustomWidgets/Snakbar.dart';
import '../Modals/login_modal.dart';
import '../SharedPreferences/login_preferences.dart';
class LoginController extends GetxController {
  var isLoading = false.obs;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final AuthService authService = AuthService();

  Future<void> login() async {
    isLoading.value = false;
    if (emailController.text != '' && passwordController.text != '') {
      isLoading.value = true;
      try {
        User? user = await authService.signIn(emailController.text, passwordController.text);
        if (user != null) {
          isLoading.value = false;
          await authService.saveUserToPreferences(user.uid);
          String? uid = await authService.getUserFromPreferences();
          LoginModel? userModel = await authService.getUserRole(uid!);
          if (userModel != null) {
            isLoading.value = false;
            if (userModel.role == 'Admin') {
              Get.offAll(() => AdminDashboardPage(), transition: Transition.fadeIn, duration: Duration(seconds: 2));
              showSuccessSnackbar('Login Successfully');
            } else if (userModel.role == 'User') {
              Get.offAll(() => UserDashboardPage(), transition: Transition.fadeIn, duration: Duration(seconds: 2));
              showSuccessSnackbar('Login Successfully');
            }
          } else {
            isLoading.value = false;
            showErrorSnackbar('User role not found.');
          }
        } else {
          isLoading.value = false;
          showErrorSnackbar('Wrong Credentials');
        }
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
