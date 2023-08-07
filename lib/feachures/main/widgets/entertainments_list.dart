import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/generated/l10n.dart';

class EntertaimentsList extends StatelessWidget {
  final List titles;
  final List subtitles;
  final bool isWrapped;

  const EntertaimentsList({
    Key? key,
    required this.titles,
    required this.subtitles,
    required this.isWrapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeOut,
      alignment: Alignment.topCenter,
      duration: const Duration(milliseconds: 300),
      child: ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return _Entertaiment(
            title: titles[index],
            subtitle: subtitles[index],
            onPressedRight: () {
              //TODO animation ?
            },
            image: S.of(context).asset_entertaiment(index),
          );
        },
        itemCount: isWrapped ? 2 : titles.length,
        separatorBuilder: (BuildContext context, int index) {
          return SizedBox(height: 16.sp);
        },
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}

class _Entertaiment extends StatelessWidget {
  final String title;
  final String subtitle;
  final String image;

  const _Entertaiment({
    required this.title,
    required this.subtitle,
    required this.onPressedRight,
    required this.image,
  });

  final VoidCallback onPressedRight;

  @override
  Widget build(BuildContext context) {
    return Row(
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
                style: TextStyle(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: secondaryFontColor,
                ),
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
    );
  }
}
