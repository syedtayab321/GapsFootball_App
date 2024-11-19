import 'package:flutter/material.dart';
import 'package:gaps_football_app/CommonScreens/Login.dart';
import 'package:gaps_football_app/CommonScreens/SignUpScreen.dart';
import 'package:get/get.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import '../CustomWidgets/TextWidget.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              const SizedBox(height: 100),
              Center(
                child:   ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Image.asset(
                    'assets/images/logo.png',
                    height: 220,
                    width: 220,
                    fit: BoxFit.cover,
                  ),
                ),
                ),
              const SizedBox(height: 20),
              const CustomTextWidget(
                title: "Gaps Football",
                size: 24,
                weight: FontWeight.bold,
                color: AppColors.lightGolden,
              ),
              const SizedBox(height: 5),
              const CustomTextWidget(
                title: "get better yourself",
                size: 14,
                color: Colors.grey,
              ),
            ],
          ),
          Container(
            decoration: const BoxDecoration(
              color: AppColors.black,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 24),
            width: size.width,
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.lightGolden,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: const CustomTextWidget(
                      title: "Login",
                      size: 16,
                      weight: FontWeight.bold,
                      color: Colors.white,
                      ),
                    ),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: AppColors.lightGolden),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: () {
                      Get.to(SignUpPage());
                    },
                    child: const CustomTextWidget(
                      title: "Sign Up",
                      size: 16,
                      weight: FontWeight.bold,
                      color: Colors.amber,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
