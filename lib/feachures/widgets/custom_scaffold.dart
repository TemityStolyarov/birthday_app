import 'package:flutter/material.dart';
import 'package:mobyte_birthday/core/constants.dart';

class CustomSafeArea extends StatelessWidget {
  final Scaffold scaffold;
  const CustomSafeArea({
    super.key,
    required this.scaffold,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: SafeArea(child: scaffold),
    );
  }
}
