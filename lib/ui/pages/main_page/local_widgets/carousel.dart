import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ImageCarousel extends StatefulWidget {
  const ImageCarousel({super.key});

  @override
  State<ImageCarousel> createState() => _ImageCarouselState();
}

class _ImageCarouselState extends State<ImageCarousel> {
  int _index = 0;
  List<String> data = [
    '25 августа\n2023',
    'Веселое\nафтерпати',
    'Три дня\nвеселья',
    'Ночные\nразвлечения'
  ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        PageView.builder(
          itemCount: data.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                SizedBox(
                  width: 375.sp,
                  height: 250.sp,
                  child: Image.asset(
                    "assets/images/carousel$index.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 22.5.sp,
                  left: 23.sp,
                  child: SizedBox(
                    child: RichText(
                      text: TextSpan(
                        text: data[index],
                        style: TextStyle(
                          height: 1.sp,
                          color: Colors.white,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        children: const [
                          TextSpan(text: '\n'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
          onPageChanged: (index) {
            setState(() {
              _index = index;
            });
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 11.sp,
            ),
            child: CarouselIndicator(
              length: data.length,
              selected: _index,
            ),
          ),
        ),
      ],
    );
  }
}

class CarouselIndicator extends StatelessWidget {
  final int length;
  final int selected;

  const CarouselIndicator({
    super.key,
    required this.length,
    required this.selected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(length, (index) {
        return AnimatedContainer(
          duration: const Duration(milliseconds: 100),
          height: 5.sp,
          width: selected == index ? 30.sp : 5.sp,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(40.sp),
          ),
        );
      }).expand((e) => [e, SizedBox(width: 7.sp)]).toList(),
    );
  }
}
