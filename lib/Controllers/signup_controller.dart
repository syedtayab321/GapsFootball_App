import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:gaps_football_app/CommonScreens/welcome.dart';
import 'package:get/get.dart';
import '../CustomWidgets/Snakbar.dart';

class SignUpController extends GetxController{
  var isLoading = false.obs;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  Future<void> signUp() async {
    try {
      UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      User? user = userCredential.user;
      if (user != null && !user.emailVerified) {
        await user.sendEmailVerification();
        showSuccessSnackbar('Email verification sent. Check your email.');

        FirebaseFirestore.instance.collection('Users').doc(user.uid).set({
          'name': nameController.text,
          'email': emailController.text.trim(),
          'role': 'User',
          'uid': user.uid,
        });
        await FirebaseAuth.instance.signOut();
        Get.off(WelcomeScreen());
      }
    } on FirebaseAuthException catch (e) {
      showErrorSnackbar(e.message.toString());
    }finally {
      isLoading.value = false;
    }
  }
}

class ViewPasswordController extends GetxController{

  RxBool show=true.obs;

  void showPassword(){
    show.value=!show.value;
  }
}