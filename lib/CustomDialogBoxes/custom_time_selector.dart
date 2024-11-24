import 'package:flutter/material.dart';

class CustomTimeSelector extends StatelessWidget {
  final String title;
  final Function(String) onTimeSelected;

  const CustomTimeSelector({
    super.key,
    required this.title,
    required this.onTimeSelected,
  });

  @override
  Widget build(BuildContext context) {
    final timeSlots = ['9:00 AM - 12:00 PM', '1:00 PM - 3:00 PM', '4:00 PM - 6:00 PM'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Wrap(
          spacing: 8,
          children: timeSlots
              .map((slot) => ChoiceChip(
            label: Text(slot),
            selected: false,
            onSelected: (selected) {
              if (selected) {
                onTimeSelected(slot);
              }
            },
          ))
              .toList(),
        ),
      ],
    );
  }
}
