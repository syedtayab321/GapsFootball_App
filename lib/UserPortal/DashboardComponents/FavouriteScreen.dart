import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/AppColors.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';

class FavoriteServicesPage extends StatelessWidget {
  final List<Map<String, dynamic>> favoriteServices = [
    {
      "image": "assets/images/onetoone.webp",
      "name": "Golden Sofa Repair",
      "description": "Professional repair service for luxury sofas.",
      "price": "100 USD",
      "rating": 4.5,
    },
    {
      "image": "assets/images/onetoone.webp",
      "name": "Elegant Chair Design",
      "description": "Custom designs for premium chairs.",
      "price": "150 USD",
      "rating": 4.0,
    },
    {
      "image": "assets/images/onetoone.webp",
      "name": "Office Desk Assembly",
      "description": "Efficient assembly service for your office furniture.",
      "price": "200 USD",
      "rating": 4.8,
    },
    {
      "image": "assets/images/onetoone.webp",
      "name": "Home Decoration",
      "description": "Top-notch home decoration services.",
      "price": "300 USD",
      "rating": 5.0,
    },
  ];

  FavoriteServicesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: AppColors.lightGolden,
        elevation: 0,
        title: CustomTextWidget(
         title: "Favorite Services",
            color: Colors.black,
            weight: FontWeight.bold,
            size: 20,
          ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: favoriteServices.length,
        itemBuilder: (context, index) {
          final service = favoriteServices[index];
          return _serviceCard(service);
        },
      ),
    );
  }
  Widget _serviceCard(Map<String, dynamic> service) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      service["image"],
                      height: 80,
                      width: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextWidget(
                          title: service["name"],
                          color: Colors.black,
                          weight: FontWeight.bold,
                          size: 16,
                        ),
                        const SizedBox(height: 5),
                        CustomTextWidget(
                          title: service["description"],
                          color: Colors.black54,
                          size: 14,
                        ),
                        const SizedBox(height: 8),
                        // Price and Rating
                        Row(
                          children: [
                            CustomTextWidget(
                              title: service["price"],
                              color: AppColors.lightGolden,
                              weight: FontWeight.bold,
                              size: 14,
                            ),
                            const Spacer(),
                            Row(
                              children: List.generate(
                                5,
                                    (starIndex) {
                                  bool isFilled = starIndex <
                                      service["rating"].round();
                                  return Icon(
                                    isFilled
                                        ? Icons.star
                                        : Icons.star_border,
                                    color: AppColors.lightGolden,
                                    size: 18,
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Favorite Icon
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite,
                      color: AppColors.lightGolden,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.redAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: CustomTextWidget(
                        title: "Remove",
                        color: Colors.white,
                        weight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.lightGolden,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: CustomTextWidget(
                        title: "Book Now",
                        color: Colors.white,
                        weight: FontWeight.bold,
                      ),
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
