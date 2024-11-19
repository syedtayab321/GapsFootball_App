import 'package:flutter/material.dart';
class CustomIconButton extends StatelessWidget {
  final Icon icon;
  final Color? color;
  final VoidCallback onPressed;

  const CustomIconButton({
    required this.icon,
    required this.onPressed,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: icon,
      color: color,
      onPressed: onPressed,
    );
  }
}
