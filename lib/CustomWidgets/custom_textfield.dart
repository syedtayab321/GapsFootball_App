import 'package:flutter/material.dart';
import 'package:gaps_football_app/CustomWidgets/TextWidget.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final Function(String)? onChanged;
  final int maxLines;
  final String? hintText;
  final TextEditingController? controller;
  final bool? enabled;
  final TextInputType? type;
  const CustomTextField({
    super.key,
    required this.title,
     this.onChanged,
    this.maxLines = 1,
    this.hintText = 'Write ....',
    this.controller,
    this.enabled = true,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomTextWidget(title: title, weight: FontWeight.bold),
        const SizedBox(height: 8),
        TextField(
          cursorColor: Colors.black,
          keyboardType: type,
          maxLines: maxLines,
          enableSuggestions: true,
          controller: controller,
          decoration: InputDecoration(
              border: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black),
                  borderRadius: BorderRadius.circular(8),
              ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: Colors.black),
              borderRadius: BorderRadius.circular(8),
            ),
              hintText:hintText ,
          ),
          onChanged: onChanged,
          enabled: enabled,
        ),
      ],
    );
  }
}
