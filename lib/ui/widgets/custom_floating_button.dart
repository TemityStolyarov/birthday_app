import 'package:flutter/material.dart';
import 'package:mobyte_birthday/core/constants.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final Color backgroundColor;

  const CustomFloatingButton({
    super.key,
    required this.onTap,
    required this.size,
    this.backgroundColor = secondaryAccentColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: Image.asset('assets/images/plus.png'),
      ),
    );
  }
}
