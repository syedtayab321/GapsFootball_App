import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:gaps_football_app/CommonScreens/welcome.dart';
import 'package:get/get.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gaps Football',
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: const ColorScheme.light(
          primary: Colors.white,
          secondary: Colors.amber,
        ),
        useMaterial3: true,
      ),
      home: WelcomeScreen(),
    );
  }
}
