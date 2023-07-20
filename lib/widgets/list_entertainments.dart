import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Entertaiment extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const Entertaiment({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onPressedTile,
    required this.onPressedRight,
    required this.image,
  });

  final VoidCallback onPressedTile;
  final VoidCallback onPressedRight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //InkWell
        Row(
          children: [
            SizedBox(
              width: 42.sp,
              height: 42.sp,
              child: ClipOval(
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(width: 12.sp),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              ),
            ),
            IconButton(
              icon: Icon(
                Icons.navigate_next,
                size: 15.sp,
              ),
              onPressed: onPressedRight,
              splashRadius: 15.sp,
              constraints: BoxConstraints(minWidth: 0.sp),
              padding: const EdgeInsets.all(0),
            ),
          ],
        ),
      ],
    );
  }
}
