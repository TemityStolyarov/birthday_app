import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/widgets/list_entertainments.dart';

class RoundedButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? borderRadius;
  final Color? buttonColor;
  final double? elevation;
  final double? width;
  final double? height;
  final double? fontSize;

  const RoundedButton({
    super.key,
    required this.onPressed,
    required this.text,
    this.borderRadius,
    this.buttonColor,
    this.elevation,
    this.width,
    this.height,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        elevation: elevation ?? 0,
        fixedSize: Size(width ?? 156.sp, height ?? 50.sp),
        backgroundColor: buttonColor ?? primaryAccentColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius ?? 15),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 16.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? topPadding;
  final double? bottomPadding;

  const Header({
    super.key,
    required this.text,
    this.fontSize,
    this.topPadding,
    this.bottomPadding,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: topPadding ?? 0,
        bottom: bottomPadding ?? 0,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize ?? 24.sp,
          fontFamily: 'YesevaOne',
        ),
      ),
    );
  }
}

class MenuGrid extends StatelessWidget {
  final List list;
  const MenuGrid({super.key, required this.list});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GridView.builder(
          semanticChildCount: 6,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8.sp, // 8 = 30 - 22
            crossAxisSpacing: 31.sp,
            childAspectRatio: 140.sp / 162.sp, // 162 = 140 + 22
          ),
          itemCount: 6,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Expanded(
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
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    list[index],
                    style: TextStyle(fontSize: 14.sp),
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}

class EntertaimentsList extends StatelessWidget {
  final List titles;
  final List subtitles;

  const EntertaimentsList(
      {super.key, required this.titles, required this.subtitles});

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
      itemCount: titles.length == subtitles.length ? titles.length : 0,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 16.sp);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.vertical,
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor: backgroundColor,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: ScreenUtilInit(
        designSize: const Size(375, 812), // Размеры макета
        //minTextAdapt: true,
        //splitScreenMode: true,
        builder: (context, child) {
          return SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  SizedBox(
                    width: 375.sp,
                    height: 250.sp,
                    child: Image.asset(
                      'assets/images/image.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(16.sp),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!',
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(height: 15.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundedButton(
                              onPressed: () {/* TODO */},
                              text: 'Список гостей',
                            ),
                            RoundedButton(
                              onPressed: () {/* TODO */},
                              text: 'Вишлист',
                            ),
                          ],
                        ),
                        Header(
                          text: 'Меню',
                          topPadding: 30.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.sp,
                            right: 10.sp,
                            top: 16.sp,
                            bottom: 12.sp,
                          ),
                          child: const MenuGrid(
                            list: [
                              'Канапе',
                              'Сырная тарелка',
                              'Шашлык на мангале',
                              'Морепродукты',
                              'Свежие фрукты',
                              'Авторские лимонады',
                            ],
                          ),
                        ),
                        Text('Свернуть'),
                        Header(
                          text: 'Развлечения',
                          topPadding: 30.sp,
                          bottomPadding: 16.sp,
                        ),
                        const EntertaimentsList(
                          titles: [
                            'Настольные игры',
                            'Бассейн',
                          ],
                          subtitles: [
                            'Мафия, уно, домино, экивоки и другие',
                            'Два бассейна с подогревом',
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 16.sp),
                          child: Text('Развернуть'),
                        ),
                        Header(
                          text: 'Место',
                          topPadding: 30.sp,
                          bottomPadding: 16.sp,
                        ),
                        SizedBox(
                          width: 343.sp,
                          height: 246.sp,
                          child: Image.asset(
                            'assets/images/place.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.sp, bottom: 10.sp),
                          child: Text(
                            'Центральная ул., 84, хутор Седых',
                            style: TextStyle(
                                fontSize: 14.sp, color: secondaryFontColor),
                          ),
                        ),
                        Text(
                          'Перейти на сайт места',
                          style: TextStyle(
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline),
                        ),
                        SizedBox(height: 89.sp),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
