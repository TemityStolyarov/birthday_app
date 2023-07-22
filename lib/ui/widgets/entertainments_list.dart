import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';

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
                    style:
                        TextStyle(fontSize: 14.sp, color: secondaryFontColor),
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

class EntertaimentsList extends StatelessWidget {
  final List titles;
  final List subtitles;
  final bool isWrapped;

  const EntertaimentsList({
    super.key,
    required this.titles,
    required this.subtitles,
    required this.isWrapped,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Entertaiment(
          title: titles[index],
          subtitle: subtitles[index],
          onPressedTile: () {
            //TODO
          },
          onPressedRight: () {
            //TODO
          },
          image: 'assets/images/frame$index.png',
        );
      },
      itemCount: isWrapped ? 2 : titles.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 16.sp);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
    );
  }
}
