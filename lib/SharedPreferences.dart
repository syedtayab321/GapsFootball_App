import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'CommonScreens/Login.dart';

Future<void> saveData(String value) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setString('email', value);
}

Future<String?> getData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return prefs.getString('email');
}

Future<void> clearData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.clear();
  Get.offAll(LoginScreen());
}
