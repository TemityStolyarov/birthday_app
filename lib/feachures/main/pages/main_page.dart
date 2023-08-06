import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/main/widgets/carousel.dart';
import 'package:mobyte_birthday/feachures/main/widgets/entertainments_list.dart';
import 'package:mobyte_birthday/feachures/main/widgets/menu_grid.dart';
import 'package:mobyte_birthday/feachures/main/widgets/yandex_map.dart';
import 'package:mobyte_birthday/feachures/widgets/custon_rounded_button.dart';
import 'package:mobyte_birthday/core/utils/routes/name_routes.dart';
import 'package:mobyte_birthday/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

const dishNames = [
  'Канапе',
  'Сырная тарелка',
  'Шашлык на мангале',
  'Морепродукты',
  'Свежие фрукты',
  'Авторские лимонады',
];

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
        designSize: const Size(375, 812),
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
                          S.of(context).welcome_text,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(height: 15.sp),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            RoundedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(NameRoutes.guests);
                              },
                              text: S.of(context).guestlist,
                            ),
                            RoundedButton(
                              onPressed: () {
                                Navigator.of(context)
                                    .pushNamed(NameRoutes.wishlist);
                              },
                              text: S.of(context).wishlist,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.sp),
                        _Header(text: S.of(context).header_menu),
                        Padding(
                          padding: EdgeInsets.only(
                            left: 16.sp,
                            right: 10.sp,
                            top: 16.sp,
                          ),
                          child: MenuGrid(
                            isWrapped: _wrappedMenu,
                            dishNames: dishNames,
                          ),
                        ),
                        TextButton(
                          style: const ButtonStyle(
                            overlayColor:
                                MaterialStatePropertyAll(Colors.transparent),
                          ),
                          child: Text(
                            _wrappedMenu
                                ? S.of(context).unwrap
                                : S.of(context).wrap,
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
                        SizedBox(height: 30.sp),
                        _Header(text: S.of(context).header_entertaiments),
                        SizedBox(height: 16.sp),
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
                                MaterialStatePropertyAll(Colors.transparent),
                          ),
                          child: Text(
                            _wrappedEntertainments
                                ? S.of(context).unwrap
                                : S.of(context).wrap,
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
                        SizedBox(height: 30.sp),
                        _Header(text: S.of(context).header_place),
                        SizedBox(height: 16.sp),
                        const YandexMapKit(),
                        SizedBox(height: 4.sp),
                        Text(
                          'Центральная ул., 84, хутор Седых',
                          style: TextStyle(
                            fontSize: 14.sp,
                            color: secondaryFontColor,
                          ),
                        ),
                        SizedBox(height: 10.sp),
                        GestureDetector(
                          onTap: () => launchUrl(
                            Uri.parse('https://yandex.ru/maps/-/CPgiUbr'),
                          ),
                          child: Text(
                            S.of(context).go_to_site,
                            style: TextStyle(
                              fontSize: 14.sp,
                              decoration: TextDecoration.underline,
                            ),
                          ),
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

class _Header extends StatelessWidget {
  final String text;

  const _Header({
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 24.sp,
        fontFamily: 'YesevaOne',
      ),
    );
  }
}
