import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:gaps_football_app/UserPortal/OtherPages/AccountSettingsPage.dart';
import 'package:gaps_football_app/UserPortal/OtherPages/ConversationPage.dart';
import 'package:gaps_football_app/UserPortal/OtherPages/FaqsPage.dart';
import 'package:gaps_football_app/UserPortal/OtherPages/GiveFeedbackPage.dart';
import 'package:gaps_football_app/UserPortal/OtherPages/NotificationsPage.dart';
import 'package:get/get.dart';

import '../../DialogBoxes/LogoutDialogBox.dart';

class UserSettingsPage extends StatelessWidget {
  const UserSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("User Settings", style: TextStyle(color: Colors.black)),
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
              // Profile Section
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
                            title: 'Update your profile',
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
                FontAwesomeIcons.bell,
                'Notifications',
                    () {
                  Get.to(NotificationsPage());
                },
              ),
              _settingOption(
                context,
                FontAwesomeIcons.person,
                'Account Settings',
                    () {
                  Get.to(AccountSettingsPage());
                },
              ),
              _settingOption(
                context,
                FontAwesomeIcons.message,
                'Message Admin',
                    () {
                  Get.to(ConversationPage());
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
                    Get.dialog(LogoutDialog());
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
