import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/ui/pages/dish_detail_page.dart';

class MenuGrid extends StatelessWidget {
  final bool isWrapped;
  final List list;
  const MenuGrid({super.key, required this.list, required this.isWrapped});

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeOutCubic,
      alignment: Alignment.topCenter,
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          GridView.builder(
            semanticChildCount: list.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.sp, // 8 = 30 - 22
              crossAxisSpacing: 31.sp,
              childAspectRatio: 140.sp / 162.sp, // 162 = 140 + 22
            ),
            itemCount: isWrapped ? 2 : list.length,
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DishDetailPage(
                              dishName: list[index], index: index),
                        ));
                      },
                      child: ClipRRect(
                        borderRadius: index % 2 == 0
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(25.sp),
                                topRight: Radius.circular(25.sp),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(25.sp),
                                bottomRight: Radius.circular(25.sp),
                              ),
                        child: Image.asset(
                          'assets/images/image$index.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    list[index],
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }
}
