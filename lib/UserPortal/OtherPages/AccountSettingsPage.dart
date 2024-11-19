import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';

class AccountSettingsPage extends StatelessWidget {
  final Map<String, String> userData = {
    "Full Name": "John Doe",
    "Email Address": "johndoe@example.com",
    "Phone Number": "+1 123 456 7890",
    "Address": "123 Main Street, Cityville",
    "Date of Birth": "January 1, 1990",
  };
  AccountSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          title: "Account Settings",
          size: 22,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
        elevation: 5,
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Container(
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: ListView(
            children: [
              CustomTextWidget(
                title: "Personal Information",
                size: 20,
                weight: FontWeight.bold,
                color: Colors.black,
              ),
              SizedBox(height: 10),
              ...userData.entries.map((entry) => _buildEditableField(entry.key, entry.value)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEditableField(String label, String value) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomTextWidget(
                   title:  label,
                    size: 16,
                    weight: FontWeight.bold,
                    color: Colors.grey.shade700,
                  ),
                  SizedBox(height: 5),
                  CustomTextWidget(
                    title: value,
                    size: 14,
                    color: Colors.black,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    Icons.edit,
                    color: Colors.amber.shade700,
                  ),
                  onPressed: () {
                    print("Edit $label");
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.cancel,
                    color: Colors.red.shade400,
                  ),
                  onPressed: () {
                    print("Cancel $label");
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
