import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobyte_birthday/feachures/main/widgets/bloc/carousel_bloc.dart';
import 'package:mobyte_birthday/generated/l10n.dart';

class ImageCarousel extends StatelessWidget {
  const ImageCarousel({super.key});

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
                    S.of(context).asset_src(index),
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
            context.read<CarouselBloc>().add(CarouselSwapEvent(index));
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: EdgeInsets.only(
              bottom: 11.sp,
            ),
            child: BlocBuilder<CarouselBloc, CarouselState>(
              builder: (context, state) {
                return _CarouselIndicator(
                  length: data.length,
                  selected: state.index,
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}

class _CarouselIndicator extends StatelessWidget {
  final int length;
  final int selected;

  const _CarouselIndicator({
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
