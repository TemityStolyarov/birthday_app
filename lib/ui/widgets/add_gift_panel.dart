import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/ui/pages/main_page/main_page.dart';

class AddGiftPanel extends StatelessWidget {
  const AddGiftPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.sp,
              width: 35.sp,
              decoration: BoxDecoration(
                color: tertiaryColor,
                borderRadius: BorderRadius.circular(40.sp),
              ),
            ),
            SizedBox(height: 20.sp),
            TextField(
              style: TextStyle(
                fontFamily: 'Jost',
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
                labelText: 'Название',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: secondaryFontColor,
                ),
                fillColor: textInputBackbroundColor,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.sp, horizontal: 12.sp),
              ),
            ),
            SizedBox(height: 12.sp),
            TextField(
              style: TextStyle(
                fontFamily: 'Jost',
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
                labelText: 'Ссылка',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: secondaryFontColor,
                ),
                fillColor: textInputBackbroundColor,
                contentPadding:
                    EdgeInsets.symmetric(vertical: 8.sp, horizontal: 12.sp),
              ),
            ),
            SizedBox(height: 50.sp),
            RoundedButton(
              fontSize: 16.sp,
              width: 181.sp,
              height: 50.sp,
              onPressed: () {
                Navigator.pop(context);
              },
              text: 'Добавить подарок',
              buttonColor: secondaryAccentColor,
            ),
            SizedBox(height: 351.sp),
          ],
        ),
      ),
    );
  }
}
