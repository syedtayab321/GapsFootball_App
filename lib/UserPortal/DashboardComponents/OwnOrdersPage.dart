import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';

class OrdersPage extends StatelessWidget {
  final List<Map<String, dynamic>> orders = [
    {
      "image": "assets/images/onetoone.webp",
      "title": "Golden Luxury Sofa",
      "status": "Pending",
      "price": "\$250",
      "deliveryTime": "3-5 days",
    },
    {
      "image": "assets/images/onetoone.webp",
      "title": "Classic Wooden Table",
      "status": "Accepted",
      "price": "\$120",
      "deliveryTime": "2-4 days",
    },
    {
      "image": "assets/images/onetoone.webp",
      "title": "Elegant Golden Chair",
      "status": "Delivered",
      "price": "\$80",
      "deliveryTime": "1-2 days",
    },
    {
      "image": "assets/images/onetoone.webp",
      "title": "Premium Office Desk",
      "status": "Cancelled",
      "price": "\$350",
      "deliveryTime": "5-7 days",
    },
  ];

  OrdersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "My Orders",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return _orderCard(order);
        },
      ),
    );
  }

  Widget _orderCard(Map<String, dynamic> order) {
    Color statusColor;
    switch (order["status"]) {
      case "Pending":
        statusColor = Colors.orange;
        break;
      case "Accepted":
        statusColor = Colors.blue;
        break;
      case "Delivered":
        statusColor = Color(0xFFD4AF37);
        break;
      case "Cancelled":
        statusColor = Colors.red;
        break;
      default:
        statusColor = Colors.grey;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade300,
              blurRadius: 10,
              spreadRadius: 2,
              offset: Offset(0, 5),
            )
          ],
          border: Border.all(color: Colors.grey.shade300),
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      order["image"],
                      height: 100,
                      width: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          title: order["title"],
                          color: Colors.black,
                          weight: FontWeight.bold,
                          size: 16,
                        ),
                        const SizedBox(height: 5),
                        CustomTextWidget(
                          title: "Price: ${order["price"]}",
                          color: Colors.black54,
                          size: 14,
                        ),
                        const SizedBox(height: 5),
                        CustomTextWidget(
                          title: "Delivery: ${order["deliveryTime"]}",
                          color: Colors.black54,
                          size: 14,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            CustomTextWidget(
                              title: "Status:",
                              color: Colors.black54,
                              weight: FontWeight.w500,
                              size: 14,
                            ),
                            const SizedBox(width: 5),
                            CustomTextWidget(
                              title: order["status"],
                              color: statusColor,
                              weight: FontWeight.bold,
                              size: 14,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (order["status"] == "Pending")
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade700,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: CustomTextWidget(
                        title: "Cancel Order",
                        color: Colors.white,
                        weight: FontWeight.bold,
                        size: 14,
                      ),
                    ),
                  if (order["status"] != "Pending")
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: CustomTextWidget(
                        title: "Delete",
                        color: Colors.white,
                        weight: FontWeight.bold,
                        size: 14,
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
}
