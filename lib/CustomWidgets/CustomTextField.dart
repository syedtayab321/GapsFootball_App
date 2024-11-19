import 'package:flutter/material.dart';

import 'IconButton.dart';
import 'TextWidget.dart';

class ReusableTextField extends StatelessWidget {
  final TextInputType type;
  final TextEditingController? controller;
  final String label;
  final CustomIconButton? suffixicon;
  final Icon? prefixicon;
  final double? radius;
  final bool? value;
  final Color? fillcolor;
  final String? Function(String?)? validator;

  const ReusableTextField({
    super.key,
    required this.type,
    this.controller,
    required this.label,
    this.prefixicon,
    this.suffixicon,
    this.radius = 8.0,
    this.value = false,
    this.validator,
    this.fillcolor,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: type,
      controller: controller,
      decoration: InputDecoration(
        label: CustomTextWidget(title: label,color: Colors.black,),
        prefixIcon: prefixicon,
        suffixIcon: suffixicon,
        fillColor: fillcolor,
        filled: fillcolor != null,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: Colors.black),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: Colors.black, width: 2.0),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: Colors.red),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radius!),
          borderSide: const BorderSide(color: Colors.red, width: 2.0),
        ),
      ),
      obscureText: value!,
      validator: validator,
    );
  }
}
