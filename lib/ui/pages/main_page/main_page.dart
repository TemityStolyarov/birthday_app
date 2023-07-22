import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/ui/widgets/carousel.dart';
import 'package:mobyte_birthday/ui/widgets/entertainments_list.dart';
import 'package:mobyte_birthday/ui/widgets/menu_grid.dart';
import 'package:mobyte_birthday/ui/widgets/yandex_map.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _wrappedMenu = false;
  bool _wrappedEntertainments = true;

  void onMenuWrapperTap() {
    setState(() {
      _wrappedMenu = !_wrappedMenu;
    });
  }

  void onEntertainmentsWrapperTap() {
    setState(() {
      _wrappedEntertainments = !_wrappedEntertainments;
    });
  }

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
                    height: 250.sp,
                    child: const ImageCarousel(),
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
                              onPressed: () {
                                Navigator.of(context).pushNamed('/guests');
                              },
                              text: 'Список гостей',
                            ),
                            RoundedButton(
                              onPressed: () {
                                Navigator.of(context).pushNamed('/wishlist');
                              },
                              text: 'Вишлист',
                            ),
                          ],
                        ),
                        _Header(
                          fontSize: 24.sp,
                          text: 'Меню',
                          topPadding: 30.sp,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.sp,
                            right: 10.sp,
                            top: 16.sp,
                          ),
                          child: MenuGrid(
                            isWrapped: _wrappedMenu,
                            list: const [
                              'Канапе',
                              'Сырная тарелка',
                              'Шашлык на мангале',
                              'Морепродукты',
                              'Свежие фрукты',
                              'Авторские лимонады',
                            ],
                          ),
                        ),
                        TextButton(
                          style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent)),
                          child: Text(
                            _wrappedMenu ? 'Развернуть ▼' : 'Свернуть ▲',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            onMenuWrapperTap();
                          },
                        ),
                        _Header(
                          fontSize: 24.sp,
                          text: 'Развлечения',
                          topPadding: 30.sp,
                          bottomPadding: 16.sp,
                        ),
                        EntertaimentsList(
                          isWrapped: _wrappedEntertainments,
                          titles: const [
                            'Настольные игры',
                            'Бассейн',
                            'Экстремальные прятки'
                          ],
                          subtitles: const [
                            'Мафия, уно, домино, экивоки и другие',
                            'Два бассейна с подогревом',
                            'В полной темноте и без ограничений'
                          ],
                        ),
                        TextButton(
                          style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent)),
                          child: Text(
                            _wrappedEntertainments
                                ? 'Развернуть ▼'
                                : 'Свернуть ▲',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.black,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                          onPressed: () {
                            onEntertainmentsWrapperTap();
                          },
                        ),
                        _Header(
                          fontSize: 24.sp,
                          text: 'Место',
                          topPadding: 30.sp,
                          bottomPadding: 16.sp,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: secondaryFontColor,
                            width: 1.sp,
                          )),
                          width: 343.sp,
                          height: 246.sp,
                          child: const YandexMapkit(),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 4.sp, bottom: 10.sp),
                          child: Text(
                            'Центральная ул., 84, хутор Седых',
                            style: TextStyle(
                                fontSize: 14.sp, color: secondaryFontColor),
                          ),
                        ),
                        TextButton(
                          style: const ButtonStyle(
                              overlayColor:
                                  MaterialStatePropertyAll(Colors.transparent)),
                          child: Text(
                            'Перейти на сайт места',
                            style: TextStyle(
                                fontSize: 14.sp,
                                decoration: TextDecoration.underline),
                          ),
                          onPressed: () => launchUrl(
                              Uri.parse('https://yandex.ru/maps/-/CPgiUbr')),
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

class _Header extends StatelessWidget {
  final String text;
  final double? fontSize;
  final double? topPadding;
  final double? bottomPadding;

  const _Header({
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
          fontSize: fontSize,
          fontFamily: 'YesevaOne',
        ),
      ),
    );
  }
}
