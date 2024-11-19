import 'package:flutter/material.dart';
import 'package:gaps_football_app/CommonScreens/SignUpScreen.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:gaps_football_app/UserPortal/UserDashboardPage.dart';
import 'package:get/get.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(top: 50, left: 20),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                  const CustomTextWidget(
                    title: "Login",
                      color: Colors.white,
                      size: 18,
                      weight: FontWeight.bold,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            ClipRRect(
              borderRadius: BorderRadius.circular(60),
              child: Image.asset(
                'assets/images/logo.png',
                height: 180,
                width: 180,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            const CustomTextWidget(
                title: "Login",
                color: Colors.white,
                size: 30,
                weight: FontWeight.bold,
            ),
            const SizedBox(height: 10),
            const CustomTextWidget(
              title: "Sign in to continue.",
                color: Colors.white54,
                size: 16,
            ),
            const SizedBox(height: 30),
            Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const CustomTextWidget(
                      title: "EMAIL",
                        color: Colors.white54,
                        weight: FontWeight.bold,
                        size: 14,
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[850],
                        hintText: "hello@reallygreatsite.com",
                        hintStyle: const TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Email is required';
                        }
                        if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$")
                            .hasMatch(value)) {
                          return 'Enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const CustomTextWidget(
                      title: "PASSWORD",
                        color: Colors.white54,
                        weight: FontWeight.bold,
                        size: 14,
                    ),
                    const SizedBox(height: 5),
                    TextFormField(
                      controller: _passwordController,
                      obscureText: true,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.grey[850],
                        hintText: "******",
                        hintStyle: const TextStyle(color: Colors.white54),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Password is required';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 30),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          // if (_formKey.currentState!.validate()) {
                          // }
                          Get.to(UserDashboardPage());
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:AppColors.lightGolden,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 15),
                        ),
                        child: const CustomTextWidget(
                          title: "Login",
                            color: Colors.white,
                            size: 16,
                            weight: FontWeight.bold,
                          ),
                        ),
                      ),
                    const SizedBox(height: 15),
                    Center(
                      child: Column(
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const CustomTextWidget(
                              title: "Forgot Password?",
                                color: Colors.white54,
                                size: 14,
                              ),
                            ),
                          TextButton(
                            onPressed: () {
                             Get.to(SignUpPage());
                            },
                            child: const CustomTextWidget(
                              title:"Signup!",
                                color: Color(0xFFD4AF37),
                                size: 14,
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
