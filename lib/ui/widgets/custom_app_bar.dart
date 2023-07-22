import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';

class CustomAppBar extends StatelessWidget {
  final String text;
  const CustomAppBar({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 48.sp,
        padding: EdgeInsets.symmetric(horizontal: 8.sp),
        decoration: BoxDecoration(
          color: backgroundColor,
          boxShadow: [
            BoxShadow(
              color: tertiaryColor,
              offset: Offset(0, 5.sp),
              blurRadius: 6.sp,
              spreadRadius: 0,
            ),
          ],
        ),
        child: Stack(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                icon: const Icon(Icons.arrow_back_ios_rounded),
                color: secondaryColor,
                iconSize: 18.sp,
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),
            Align(
              alignment: Alignment.center,
              child: Text(
                'Вишлист',
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(0, 0, 0, 1),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
