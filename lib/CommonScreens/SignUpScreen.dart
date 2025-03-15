import 'package:flutter/material.dart';
import 'package:gaps_football_app/CommonScreens/Login.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:get/get.dart';

import '../Controllers/signup_controller.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});
  final _formKey = GlobalKey<FormState>();
  final ViewPasswordController _visibilityController = Get.put(ViewPasswordController());
  final SignUpController _signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: const Color(0xFF1E1E2C),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Positioned(
                  top: -size.width * 0.4,
                  left: -size.width * 0.4,
                  child: Container(
                    width: size.width * 0.8,
                    height: size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios,
                            color: Colors.white),
                        onPressed: () {
                          Get.back();
                        },
                      ),
                      const CustomTextWidget(
                        title: "Sign Up",
                        size: 20,
                        weight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Column(
                children: const [
                  CustomTextWidget(
                    title: "Create new\nAccount",
                    align: TextAlign.center,
                    size: 28,
                    weight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  SizedBox(height: 5),
                  CustomTextWidget(
                    title: "Already Registered? Log in here.",
                    size: 14,
                    color: Colors.white60,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWidget(
                      title: "NAME",
                      size: 14,
                      color: Colors.white70,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _signUpController.nameController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: "Jira Martins",
                        hintStyle: const TextStyle(color: Colors.white60),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const CustomTextWidget(
                      title: "EMAIL",
                      size: 14,
                      color: Colors.white70,
                    ),
                    const SizedBox(height: 8),
                    TextFormField(
                      controller: _signUpController.emailController,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white24,
                        hintText: "hello@reallygreatsite.com",
                        hintStyle: const TextStyle(color: Colors.white60),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const CustomTextWidget(
                      title: "PASSWORD",
                      size: 14,
                      color: Colors.white70,
                    ),
                    const SizedBox(height: 8),
                    Obx(() {
                      return TextFormField(
                        controller: _signUpController.passwordController,
                        obscureText: _visibilityController.show.value,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.white24,
                          hintText: "*******",
                          hintStyle: const TextStyle(color: Colors.white60),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                          suffixIcon: IconButton(
                            color: Colors.white,
                            onPressed: () {
                              _visibilityController.showPassword();
                            },
                            icon: _visibilityController.show.value
                                ? Icon(Icons.remove_red_eye_outlined)
                                : Icon(Icons.remove_red_eye),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          if (value.length < 6) {
                            return 'Password must be at least 6 characters';
                          }
                          return null;
                        },
                      );
                    }),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: Obx(() {
                        return _signUpController.isLoading.value
                            ? CircularProgressIndicator()
                            : ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.amber,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 16),
                                ),
                                onPressed: () async {
                                  if (_formKey.currentState!.validate()) {
                                    await _signUpController.signUp();
                                  }
                                },
                                child: const CustomTextWidget(
                                  title: "Sign Up",
                                  size: 16,
                                  weight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              );
                      }),
                    ),
                    const SizedBox(height: 20),
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const CustomTextWidget(
                            title: "Already Have Account?",
                            color: Colors.white60,
                          ),
                          TextButton(
                            onPressed: () {
                              Get.to(LoginScreen());
                            },
                            child: const CustomTextWidget(
                              title: "Login!",
                              color: Colors.amber,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
