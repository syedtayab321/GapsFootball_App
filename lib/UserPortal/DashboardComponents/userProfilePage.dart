import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import 'package:gaps_football_app/CustomWidgets/Snakbar.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:gaps_football_app/Messages/conversation_page.dart';
import 'package:gaps_football_app/UserPortal/OtherPages/FaqsPage.dart';
import 'package:gaps_football_app/UserPortal/OtherPages/GiveFeedbackPage.dart';
import 'package:get/get.dart';
import '../../CommonScreens/welcome.dart';
import '../../CustomDialogBoxes/logout_dialog.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  void navigateToConversationPage(BuildContext context) async {
    String userId = FirebaseAuth.instance.currentUser!.uid;

    try {
      var userSnapshot = await FirebaseFirestore.instance
          .collection('Users')
          .where('uid', isEqualTo: userId)
          .get();
      if (userSnapshot.docs.isNotEmpty) {
        var userData = userSnapshot.docs.first.data();
         Get.to(
           ConversationPage(
               conversationId: userId,
               senderId: userId,
               receiverId: 'SeeBS73D3YRTOCZ7plQvBFCHaet1',
               userName:userData['name'],
           )
         );
      } else {
        showSuccessSnackbar("User data not found in Firestore.");
      }
    } catch (e) {
      showErrorSnackbar("Error fetching user data: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(title: "User Settings", color: Colors.black),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightGolden,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage('assets/images/logo.png'),
                      ),
                      SizedBox(width: 20),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomTextWidget(
                            title: 'John Doe',
                            size: 20,
                            weight: FontWeight.bold,
                            color: Colors.black,
                          ),
                          SizedBox(height: 5),
                          CustomTextWidget(
                            title: 'Welcome to Gaps Football',
                            size: 14,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 30),
              CustomTextWidget(
                title: 'Settings',
                size: 22,
                weight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 20),
              _settingOption(
                context,
                Icons.help_outline,
                'FAQs', () {
                Get.to(FAQPage());
              },
              ),
              _settingOption(
                context,
                Icons.feedback,
                'Give Feedback',
                    () {
                  Get.to(FeedbackPage());
                },
              ),
              _settingOption(
                context,
                FontAwesomeIcons.message,
                'Message Admin', () {
                 navigateToConversationPage(context);
                },
              ),
              SizedBox(height: 30),
              Center(
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    elevation: 5,
                  ),
                  child: Text(
                    'Logout',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Get.to(LogoutDialog(
                      onYesPressed: () {
                        Get.to(WelcomeScreen());
                      },
                      onNoPressed: () {
                        Get.back();
                      },
                    ));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _settingOption(BuildContext context, IconData icon, String title, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(bottom: 20),
        padding: EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        decoration: BoxDecoration(
          color: AppColors.lightGolden,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 5,
            ),
          ],
        ),
        child: Row(
          children: [
            Icon(
              icon,
              size: 30,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            CustomTextWidget(
              title: title,
              size: 18,
              weight: FontWeight.w500,
              color: Colors.black,
            ),
            Spacer(),
            Icon(
              Icons.arrow_forward_ios,
              size: 20,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
