import 'package:flutter/material.dart';
import 'package:gaps_football_app/AdminPortal/DashboardPages/FeedbackPages.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:get/get.dart';

import '../../CommonScreens/welcome.dart';
import '../../CustomDialogBoxes/logout_dialog.dart';

class AdminProfile extends StatelessWidget {
  final Map<String, dynamic> companyData = {
    'companyName': 'Gaps Football.',
    'companyLogo': 'assets/images/logo.png',
    'companyDescription':
    'Tech Innovators Ltd. is a leading company in tech innovations, providing cutting-edge solutions to businesses worldwide.',
    'contactEmail': 'info@techinnovators.com',
    'contactPhone': '+1 234 567 890',
    'website': 'https://www.techinnovators.com',
    'address': '123 Tech Lane, Silicon Valley, CA, USA',
  };

  AdminProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: CustomTextWidget(
          title: 'Company Details',
          color: Colors.black,
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/logo.png'),
              ),
            ),
            const SizedBox(height: 20),
            CustomTextWidget(
              title: companyData['companyName'],
              size: 24,
              weight: FontWeight.bold,
              color: Colors.black,
              align: TextAlign.center,
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: CustomTextWidget(
                title: companyData['companyDescription'],
                size: 16,
                color: Colors.black87,
                align: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            _buildContactInfoSection('Email:', companyData['contactEmail']),
            _buildContactInfoSection('Phone:', companyData['contactPhone']),
            _buildContactInfoSection('Website:', companyData['website']),
            _buildContactInfoSection('Address:', companyData['address']),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                Get.to(FeedbackPage());
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: CustomTextWidget(
                title: 'View Feedback',
                  color: Colors.white,
                  size: 16,
                  weight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
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
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                padding: EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: CustomTextWidget(
                title: 'Logout',
                  color: Colors.white,
                  size: 16,
                  weight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContactInfoSection(String label, String info) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          CustomTextWidget(
            title: label,
            size: 16,
            weight: FontWeight.bold,
            color: Colors.black,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              info,
              style: TextStyle(
                fontSize: 16,
                color: Colors.black54,
              ),
              overflow: TextOverflow.ellipsis,
              softWrap: false,
            ),
          ),
        ],
      ),
    );
  }
}
