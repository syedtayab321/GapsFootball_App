import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import 'package:gaps_football_app/CustomWidgets/ElevatedButton.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:get/get.dart';

class ViewDetailsPage extends StatelessWidget {
  final String title = "Service Details";
  final String description =
      "This is a premium service that offers top-notch features to help you achieve your goals. Designed with elegance and functionality in mind.";
  final double price = 150.00;

  const ViewDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: CustomTextWidget(
          title: "View Details",
          color: Colors.black,
          weight: FontWeight.bold,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.asset(
                        'assets/images/onetoone.webp',
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: (){},
                      icon: Icon(FontAwesomeIcons.heart),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Center(
                child: CustomTextWidget(
                  title: title,
                  color: Colors.black,
                  size: 24,
                  weight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              // Rating Section
              Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: List.generate(5, (index) {
                    return const Icon(
                      Icons.star,
                      color:AppColors.lightGolden,
                      size: 20,
                    );
                  }),
                ),
              ),
              const SizedBox(height: 20),
              // Description
              CustomTextWidget(
                title: description,
                color: Colors.black54,
                size: 16,
                height: 1.5,
              ),
              const SizedBox(height: 20),
              // Price Section
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const CustomTextWidget(
                          title: "Price",
                          color: Colors.black87,
                          size: 18,
                          weight: FontWeight.bold,
                        ),
                        const SizedBox(width: 10),
                        CustomTextWidget(
                          title: "\$$price",
                          color: AppColors.lightGolden,
                          size: 20,
                          weight: FontWeight.bold,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: (){
                      },
                      child: const Icon(
                        Icons.message,
                        color: AppColors.lightGolden,
                        size: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30),
              const CustomTextWidget(
                title: "Features",
                color: Colors.black,
                size: 20,
                weight: FontWeight.bold,
              ),
              const SizedBox(height: 15),
              Column(
                children: [
                  featureTile("High-Quality Service"),
                  featureTile("24/7 Customer Support"),
                  featureTile("User-Friendly Interface"),
                  featureTile("Affordable Pricing"),
                ],
              ),
              const SizedBox(height: 30),
              Row(
                children: [
                  Expanded(
                    child: CustomElevatedButton(
                      text: 'Book Now',
                      color: Colors.white,
                      backcolor: AppColors.lightGolden,
                      padding: 10,
                      radius: 10,
                      path: (){},
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget featureTile(String feature) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          const Icon(
            Icons.check_circle,
            color: AppColors.lightGolden,
          ),
          const SizedBox(width: 10),
          CustomTextWidget(
            title: feature,
            color: Colors.black54,
            size: 16,
          ),
        ],
      ),
    );
  }
}
