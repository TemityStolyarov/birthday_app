import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';

class CustomFloatingButton extends StatelessWidget {
  final VoidCallback onTap;
  final double size;
  final Color backgroundColor;

  const CustomFloatingButton({
    super.key,
    required this.onTap,
    required this.size,
    this.backgroundColor = secondaryAccentColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: backgroundColor,
          shape: BoxShape.circle,
        ),
        child: PlusIcon(
          size: size,
        ),
      ),
    );
  }
}

class PlusIcon extends StatelessWidget {
  final double size;
  const PlusIcon({super.key, required this.size});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _PlusIconPainter(),
    );
  }
}

class _PlusIconPainter extends CustomPainter {
  final Paint _paint = Paint()
    ..color = Colors.white
    ..strokeWidth = 10.spMin
    ..strokeCap = StrokeCap.round;

  @override
  void paint(Canvas canvas, Size size) {
    final double centerX = size.width / 2;
    final double centerY = size.height / 2;
    final double armLength = 16.spMin;

    canvas.drawLine(
      Offset(centerX - armLength, centerY),
      Offset(centerX + armLength, centerY),
      _paint,
    );
    canvas.drawLine(
      Offset(centerX, centerY - armLength),
      Offset(centerX, centerY + armLength),
      _paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
