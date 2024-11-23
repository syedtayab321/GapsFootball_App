import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../CustomWidgets/TextWidget.dart';

class OrderRequestScreen extends StatelessWidget {
  final List<Map<String, String>> orderRequests = [
    {
      'userName': 'John Doe',
      'serviceName': 'Football Coaching',
      'orderDate': 'Nov 18, 2024',
      'status': 'Pending',
    },
    {
      'userName': 'Jane Smith',
      'serviceName': 'Basketball Training',
      'orderDate': 'Nov 19, 2024',
      'status': 'Pending',
    },
  ];

  OrderRequestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: const CustomTextWidget(
          title: "Order Requests",
          color: Colors.black,
          weight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView.builder(
          itemCount: orderRequests.length,
          itemBuilder: (context, index) {
            final order = orderRequests[index];
            return Card(
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomTextWidget(
                          title: order['userName']!,
                          size: 18,
                          weight: FontWeight.bold,
                          color: Colors.black,
                        ),
                        Chip(
                          label: Text(
                            order['status']!,
                            style: const TextStyle(color: Colors.white),
                          ),
                          backgroundColor: Colors.amber,
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    CustomTextWidget(
                      title: "Service: ${order['serviceName']!}",
                      size: 16,
                      color: Colors.black87,
                    ),
                    const SizedBox(height: 5),
                    CustomTextWidget(
                      title: "Order Date: ${order['orderDate']!}",
                      size: 14,
                      color: Colors.black54,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Get.snackbar(
                                "Order Accepted",
                                "You have accepted ${order['userName']}'s request.",
                                backgroundColor: Colors.green,
                                colorText: Colors.white,
                              );
                            },
                            child: const Text(
                              "Accept",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              padding: const EdgeInsets.symmetric(vertical: 12),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              Get.snackbar(
                                "Order Rejected",
                                "You have rejected ${order['userName']}'s request.",
                                backgroundColor: Colors.red,
                                colorText: Colors.white,
                              );
                            },
                            child: const Text(
                              "Reject",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
