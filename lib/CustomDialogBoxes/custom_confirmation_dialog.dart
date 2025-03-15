import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';

import '../CustomWidgets/ElevatedButton.dart';

class CustomConfirmationDialog extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback onConfirm;
  final VoidCallback onCancel;

  const CustomConfirmationDialog({
    super.key,
    required this.title,
    required this.description,
    required this.onConfirm,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextWidget(
             title:  title,
              size: 20,
              weight: FontWeight.bold,
              color: Colors.black87,
              align: TextAlign.center,
            ),
            const SizedBox(height: 10),
            CustomTextWidget(
              title: description,
              size: 16,
              color: Colors.grey,
              align: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child:  CustomElevatedButton(
                    text: 'Cancel',
                    color: Colors.white,
                    backcolor: Colors.red,
                    padding: 10,
                    radius: 10,
                    width: 120,
                    height: 40,
                    path: onCancel,
                  ),
                ),
                const SizedBox(width: 10),
                // Confirm Button
                Expanded(
                  child:  CustomElevatedButton(
                    text: 'Confirm',
                    color: Colors.white,
                    backcolor: Colors.amber,
                    padding: 10,
                    radius: 10,
                    width: 120,
                    height: 40,
                    path: onConfirm,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
