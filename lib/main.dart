import 'package:flutter/material.dart';
import 'package:mobyte_birthday/constants.dart';
import 'package:mobyte_birthday/widgets/appbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowMaterialGrid: false, //TODO: убрать debug grid
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,
        fontFamily: 'Jost',
      ),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: ScreenUtilInit(
          designSize: const Size(375, 812),
          //minTextAdapt: true,
          //splitScreenMode: true,
          builder: (context, child) {
            return SafeArea(
              child: SingleChildScrollView(
                child: Center(
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
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Приглашаю своих дорогих друзей отметить мой день рождения в замечательном месте с множеством развлечений, вкусных блюд и хорошим настроением!',
                              style: TextStyle(
                                fontSize: 14.sp,
                              ),
                            ),
                            SizedBox(height: 15.sp),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    fixedSize: Size(156.sp, 50.sp),
                                    backgroundColor: primaryAccentColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Список гостей',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    elevation: 0,
                                    fixedSize: Size(156.sp, 50.sp),
                                    backgroundColor: primaryAccentColor,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Вишлист',
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 30.sp),
                            Text(
                              'Меню',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontFamily: 'YesevaOne',
                              ),
                            ),
                            Text(
                              'Развлечения',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontFamily: 'YesevaOne',
                              ),
                            ),
                            Text(
                              'Место',
                              style: TextStyle(
                                fontSize: 24.sp,
                                fontFamily: 'YesevaOne',
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
