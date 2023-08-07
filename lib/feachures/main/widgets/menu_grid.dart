import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/feachures/main/models/dish_name_model.dart';
import 'package:mobyte_birthday/core/utils/routes/name_routes.dart';
import 'package:mobyte_birthday/generated/l10n.dart';

class MenuGrid extends StatelessWidget {
  final bool isWrapped;
  final List<String> dishNames;

  const MenuGrid({
    super.key,
    required this.dishNames,
    required this.isWrapped,
  });

  bool isLeftItem(int index) {
    return index % 2 == 0;
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      curve: Curves.easeOutCubic,
      alignment: Alignment.topCenter,
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          GridView.builder(
            semanticChildCount: dishNames.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 8.sp, // 8 = 30 - 22
              crossAxisSpacing: 31.sp,
              childAspectRatio: 140.sp / 162.sp, // 162 = 140 + 22
            ),
            itemCount: isWrapped ? 2 : dishNames.length,
            itemBuilder: (context, index) {
              final dishName = dishNames[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.of(context).pushNamed(
                          NameRoutes.dishdetail,
                          arguments: DishNameModel(
                            name: dishName,
                            index: index,
                          ),
                        );
                      },
                      child: ClipRRect(
                        borderRadius: isLeftItem(index)
                            ? BorderRadius.only(
                                bottomLeft: Radius.circular(25.sp),
                                topRight: Radius.circular(25.sp),
                              )
                            : BorderRadius.only(
                                topLeft: Radius.circular(25.sp),
                                bottomRight: Radius.circular(25.sp),
                              ),
                        child: Image.asset(
                          S.of(context).asset_menu(index),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    dishName,
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
