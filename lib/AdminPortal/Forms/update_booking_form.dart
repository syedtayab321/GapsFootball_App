import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/ElevatedButton.dart';
import '../../CustomWidgets/custom_dropdown.dart';
import '../Controllers/update_data_controller.dart';
import '../../CustomWidgets/custom_textfield.dart';

class UpdateBookingForm extends StatefulWidget {
  final String docId;
  const UpdateBookingForm({super.key, required this.docId});

  @override
  State<UpdateBookingForm> createState() => _UpdateBookingFormState();
}

class _UpdateBookingFormState extends State<UpdateBookingForm> {
  final UpdateDataController controller = Get.put(UpdateDataController());
  @override
  void initState() {
    super.initState();
    controller.getServiceDataForEditing(widget.docId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CustomTextWidget(title: 'Update Service'),
        backgroundColor: Colors.amber,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Obx(() {
              return CustomTextField(
                title: "Booking Type",
                hintText: controller.selectedType.value,
                enabled: false,
              );
            }),
            const SizedBox(height: 20),
            Obx(() {
              if (controller.selectedType.value == 'Uniform Booking') {
                return Column(
                  children: [
                    CustomTextField(
                      title: "Enter Price",
                      hintText: "Enter the uniform price",
                      controller: TextEditingController(text: controller.price.value),
                      onChanged: (value) => controller.price.value = value,
                    ),
                    CustomDropdown(
                      title: "Available Sizes",
                      options: controller.kitSizes.cast<String>(),
                      onChanged: (value) => controller.availableSizes.value = value!,
                      isMultiSelect: true,
                      value: controller.availableSizes.value,
                    ),
                  ],
                );
              } else if (controller.selectedType.value == 'Group Session Booking') {
                return Column(
                  children: [
                    CustomTextField(
                      title: "Enter Location",
                      hintText: "Enter the location",
                      controller: TextEditingController(text: controller.location.value),
                      onChanged: (value) => controller.location.value = value,
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
                      value: controller.ageGroup.value,
                    ),
                    if (controller.ageGroup.value == 'Other')
                      CustomTextField(
                        title: "Enter Custom Age Group",
                        hintText: "Specify a custom age group",
                        controller: TextEditingController(text: controller.customAgeGroup.value),
                        onChanged: (value) => controller.customAgeGroup.value = value,
                      ),
                    CustomDropdown(
                      title: "Select Available Day",
                      options: controller.daysOfWeek.cast<String>(),
                      onChanged: (value) => controller.selectedDays.value = value!,
                      value: controller.selectedDays.value,
                    ),
                  ],
                );
              } else if (controller.selectedType.value == 'Private One-on-One Session') {
                return Column(
                  children: [
                    CustomTextField(
                      title: "Description",
                      hintText: "Enter session details",
                      controller: TextEditingController(text: controller.description.value),
                      maxLines: 4,
                      onChanged: (value) => controller.description.value = value,
                    ),
                    CustomTextField(
                      title: "Enter Price",
                      hintText: "Enter the session price",
                      controller: TextEditingController(text: controller.price.value),
                      onChanged: (value) => controller.price.value = value,
                    ),
                  ],
                );
              }
              return const SizedBox.shrink();
            }),
            const SizedBox(height: 30),
            Obx(() {
              return controller.isLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : CustomElevatedButton(
                text: 'Update',
                color: Colors.white,
                backcolor: Colors.green,
                padding: 10,
                radius: 10,
                height: 50,
                path: ()async{
                   controller.updateService();
                },
              );
            })
          ],
        ),
      ),
    );
  }
}
