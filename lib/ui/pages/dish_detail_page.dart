import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/ui/widgets/custom_app_bar.dart';

final receipts = [
  ['Хлеб', 'Ветчина', 'Салат', 'Яйцо'],
  ['Пармезан', 'Моцарелла', 'Грецкий орех', 'Виноград', 'Сырный соус'],
  ['Говядина', 'Помидоры', 'Кетчуп'],
  ['Креветки', 'Устрицы', 'Мидии', 'Лимон', 'Огурец'],
  ['Ананас', 'Арбуз', 'Киви', 'Драгонфрукт', 'Виноград', 'Гранат', 'Персик'],
  ['Тропикал', 'Биттер-фреш', 'Оранж-микс', 'Блади-берри'],
];

class DishDetailPage extends StatelessWidget {
  final String dishName;
  final int index;
  const DishDetailPage({
    super.key,
    required this.dishName,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(48.sp),
            child: CustomAppBar(text: dishName),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              children: [
                Stack(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: FractionalTranslation(
                        translation: Offset(0.2.sp, -0.16.sp),
                        child: ClipOval(
                          child: SizedBox(
                            width: 357.sp,
                            height: 264.sp,
                            child: Image.asset(
                              'assets/images/image$index.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 162.sp,
                        left: 16.sp,
                      ),
                      child: Text(
                        insertLineBreaks(dishName),
                        style: TextStyle(
                          fontFamily: 'YesevaOne',
                          fontSize: 24.sp,
                        ),
                      ),
                    ),
                  ],
                ),
                GridView.builder(
                  semanticChildCount: receipts[index].length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 20.sp,
                      mainAxisExtent: 24.sp),
                  itemCount: receipts[index].length,
                  itemBuilder: (context, item) {
                    return Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.sp),
                      child: ReceiptItem(index: index, item: item),
                    );
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  String insertLineBreaks(String text) {
    const marker = r"$";
    String textWithoutSpaces = text.replaceAll(' ', marker);

    List<String> lines = textWithoutSpaces.split(marker);

    if (lines[0][3] == 'е') {
      String firstPart = lines[0].substring(0, 4);
      String secondPart = lines[0].substring(4);
      lines[0] = "$firstPart-\n$secondPart";
    }
    if (lines[0][5] == 'с') {
      String firstPart = lines[0].substring(0, 6);
      String secondPart = lines[0].substring(6);
      lines[0] = "$firstPart-\n$secondPart";
    }

    String result = lines.join("\n");

    return result;
  }
}

class ReceiptItem extends StatelessWidget {
  final int item;
  final int index;
  const ReceiptItem({
    super.key,
    required this.item,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          'assets/images/receipt.png',
          height: 24.sp,
          width: 24.sp,
          fit: BoxFit.cover,
        ),
        SizedBox(width: 17.sp),
        Expanded(
          child: Text(
            receipts[index][item],
            style: TextStyle(fontSize: 14.sp),
          ),
        ),
      ],
    );
  }
}