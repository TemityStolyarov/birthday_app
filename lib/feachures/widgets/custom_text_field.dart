import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String text;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: TextStyle(
        fontSize: 16.sp,
        fontWeight: FontWeight.w700,
      ),
      cursorColor: secondaryAccentColor,
      decoration: InputDecoration(
        filled: true,
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.circular(4.sp),
          borderSide: BorderSide.none,
        ),
        labelText: text,
        labelStyle: const TextStyle(
          fontWeight: FontWeight.w400,
          color: secondaryFontColor,
        ),
        fillColor: textInputBackbroundColor,
        contentPadding: EdgeInsets.symmetric(
          vertical: 8.sp,
          horizontal: 12.sp,
        ),
      ),
    );
  }
}
