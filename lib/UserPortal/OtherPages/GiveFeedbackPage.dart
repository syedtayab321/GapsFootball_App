import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import '../../Controllers/RatingController.dart';

class FeedbackPage extends StatelessWidget {
  final FeedbackController feedbackController = Get.put(FeedbackController());
  FeedbackPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: CustomTextWidget(
          title: "Give Feedback",
          size: 22,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        backgroundColor: Colors.amber,
        elevation: 8,
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomTextWidget(
              title: 'We Value Your Feedback',
              size: 24,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
            SizedBox(height: 10),
            CustomTextWidget(
              title:
              'Let us know what you think about our app. Your feedback helps us improve!',
              size: 16,
              color: Colors.black54,
            ),
            SizedBox(height: 30),
            _buildStarRating(),
            SizedBox(height: 30),
            TextField(
              maxLines: 5,
              decoration: InputDecoration(
                hintText: 'Write your feedback here...',
                hintStyle: TextStyle(color: Colors.black45),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.amber, width: 1),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide(color: Colors.amber, width: 2),
                ),
              ),
              style: TextStyle(color: Colors.black),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Get.snackbar(
                  'Feedback Received',
                  'Thank you for your feedback!',
                  backgroundColor: AppColors.lightGolden,
                  colorText: Colors.black,
                  snackPosition: SnackPosition.BOTTOM,
                  duration: Duration(seconds: 2),
                );
              },
              child: Ink(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.amber.shade300, Colors.amber.shade700],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Container(
                  alignment: Alignment.center,
                  constraints: BoxConstraints(maxWidth: 200, minHeight: 50),
                  child: CustomTextWidget(
                    title: 'Submit Feedback',
                    size: 18,
                    weight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStarRating() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(
          title: 'Rate Us',
          size: 18,
          weight: FontWeight.bold,
          color: Colors.black,
        ),
        SizedBox(height: 10),
        Obx(() => Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: List.generate(5, (index) {
            return IconButton(
              icon: Icon(
                index < feedbackController.rating.value
                    ? Icons.star
                    : Icons.star_border,
                size: 30,
                color: AppColors.lightGolden,
              ),
              onPressed: () {
                feedbackController.updateRating(index + 1.0);
              },
            );
          }),
        )),
        SizedBox(height: 10),
        Obx(() => CustomTextWidget(
          title:
          'Your Rating: ${feedbackController.rating.value.toInt()} / 5',
          size: 16,
          color: Colors.black54,
        )),
      ],
    );
  }
}
