import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:gaps_football_app/CustomWidgets/Snakbar.dart';
import 'package:get/get.dart';

class BookingController extends GetxController {
  var selectedType = ''.obs;
  var price = ''.obs;
  var availableSize = ''.obs;
  var location = ''.obs;
  var ageGroup = ''.obs;
  var customAgeGroup = ''.obs;
  var selectedDay = ''.obs;
  var selectedTimeSlots = ''.obs;
  var description = ''.obs;
  var isLoading = false.obs;

  List<String> bookingTypes = [
    'Uniform Booking',
    'Group Session Booking',
    'Private One-on-One Session'
  ];
  List<String> kitSizes = ['Small', 'Medium', 'Large', 'All Sizes'];
  List<String> ageGroups = ['4-15', '8-14', '7-10', 'Other'];
  List<String> daysOfWeek = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday'
  ];
  List<String> timeSlots = ['9 AM - 12 PM', '12 PM - 3 PM', '3 PM - 6 PM'];


  void resetFields() {
    selectedType.value = '';
    price.value = '';
    availableSize.value = '';
    location.value = '';
    ageGroup.value = '';
    customAgeGroup.value = '';
    selectedDay.value = '';
    selectedTimeSlots.value = '';
    description.value = '';
  }

  Future<void> storeBookingData() async {
    Map<String, dynamic> bookingData = {
      'type': selectedType.value,
      'createdAt': Timestamp.now(),
    };

    if (selectedType.value == 'Uniform Booking') {
      bookingData.addAll({
        'price': price.value,
        'availableSize': availableSize.value,
      });
    } else if (selectedType.value == 'Group Session Booking') {
      bookingData.addAll({
        'location': location.value,
        'ageGroup': ageGroup.value,
        'customAgeGroup': customAgeGroup.value.isNotEmpty ? customAgeGroup.value : null,
        'selectedDay': selectedDay.value,
        'selectedTimeSlot':selectedTimeSlots.value,
      });
    } else if (selectedType.value == 'Private One-on-One Session') {
      bookingData.addAll({
        'description': description.value,
        'price': price.value,
      });
    } else {
      showErrorSnackbar('Invalid booking type selected.');
      return;
    }
    bookingData.removeWhere((key, value) => value == null || (value is List && value.isEmpty));
    try {
      await FirebaseFirestore.instance.collection('services').add(bookingData);
      showSuccessSnackbar('Booking data saved successfully!');
      resetFields();
    } catch (e) {
      showErrorSnackbar('Failed to save booking data: $e');
    }
  }

  Future<void> deleteService(String serviceId) async {
    try {
      await FirebaseFirestore.instance.collection('services').doc(serviceId).delete();
      showSuccessSnackbar('Service deleted successfully!');
    } catch (e) {
      showErrorSnackbar('Failed to delete service: $e');
    }
  }
}
