import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/Snakbar.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/custom_dropdown.dart';
import '../Controllers/booking_controller.dart';
import '../../CustomWidgets/custom_textfield.dart';

class BookingForm extends StatelessWidget {
  const BookingForm({super.key});

  @override
  Widget build(BuildContext context) {
    final BookingController controller = Get.put(BookingController());

    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(title: 'Booking Form'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomDropdown(
              title: "Select Booking Type",
              options: controller.bookingTypes.cast<String>(),
              onChanged: (value) => controller.selectedType.value = value ?? '',
            ),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.selectedType.value == 'Uniform Booking') {
                return Column(
                  children: [
                    CustomTextField(
                      title: "Enter Price",
                      hintText: "Enter the uniform price",
                      onChanged: (value) => controller.price.value = value,
                    ),
                    CustomDropdown(
                      title: "Available Sizes",
                      options: controller.kitSizes.cast<String>(),
                      onChanged: (value) => controller.availableSize.value ?? '',
                      isMultiSelect: true,
                    ),
                  ],
                );
              } else if (controller.selectedType.value == 'Group Session Booking') {
                return Column(
                  children: [
                    CustomTextField(
                      title: "Enter Location",
                      hintText: "Enter the location",
                      onChanged: (value) => controller.location.value = value,
                    ),
                    CustomDropdown(
                      title: "Select Time Slot",
                      options: controller.timeSlots.cast<String>(),
                      onChanged: (value) {
                        controller.selectedTimeSlots.value = value ?? '';
                      },
                    ),
                    CustomDropdown(
                      title: "Select Age Group",
                      options: controller.ageGroups.cast<String>(),
                      onChanged: (value) {
                        controller.ageGroup.value = value ?? '';
                        if (value == 'Other') {
                          controller.customAgeGroup.value = value ?? '';
                        }
                      },
                    ),
                    if (controller.ageGroup.value == 'Other')
                      CustomTextField(
                        title: "Enter Custom Age Group",
                        hintText: "Specify a custom age group",
                        onChanged: (value) => controller.customAgeGroup.value = value,
                      ),
                    CustomDropdown(
                      title: "Select Available Day",
                      options: controller.daysOfWeek.cast<String>(),
                      onChanged: (value) => controller.selectedDay.value = value ?? '',
                    ),
                  ],
                );
              } else if (controller.selectedType.value == 'Private One-on-One Session') {
                return Column(
                  children: [
                    CustomTextField(
                      title: "Description",
                      hintText: "Enter session details",
                      maxLines: 4,
                      onChanged: (value) => controller.description.value = value,
                    ),
                    CustomTextField(
                      title: "Enter Price",
                      hintText: "Enter the session price",
                      onChanged: (value) => controller.price.value = value,
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
            const SizedBox(height: 30),
            Obx((){
              return controller.isLoading.value ?
                  CircularProgressIndicator(color: Colors.black,):
                  ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.white,
                  textStyle: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  minimumSize: const Size(double.infinity, 50),
                ),
                onPressed: () async {
                  controller.isLoading.value = true;
                  try{
                    await controller.storeBookingData();
                  }catch(e){
                    showErrorSnackbar(e.toString());
                  }finally{
                    controller.isLoading.value = false;
                  }
                },
                child: const CustomTextWidget(title: 'Submit'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
