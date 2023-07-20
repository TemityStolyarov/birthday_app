import 'package:flutter/material.dart';
import 'package:mobyte_birthday/core/constants.dart';

class BdayAppBar extends StatelessWidget {
  final Widget? child;

  const BdayAppBar({
    this.child,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      title: const SizedBox(
        // decoration: BoxDecoration(
        //   borderRadius: BorderRadius.circular(10.0),
        // border: Border.all(color: grayLight),
        // ),
        child: Row(
          children: [
            Text(
              ' ',
              style: TextStyle(
                color: primaryFontColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
