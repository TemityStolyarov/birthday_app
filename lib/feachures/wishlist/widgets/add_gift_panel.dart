import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_text_field.dart';
import 'package:mobyte_birthday/feachures/widgets/custon_rounded_button.dart';
import 'package:mobyte_birthday/generated/l10n.dart';

class AddGiftPanel extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddGift;

  const AddGiftPanel({
    Key? key,
    required this.onAddGift,
  }) : super(key: key);

  @override
  State<AddGiftPanel> createState() => _AddGiftPanelState();
}

class _AddGiftPanelState extends State<AddGiftPanel> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _subtitleController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _subtitleController.dispose();
    super.dispose();
  }

  Map<String, dynamic> injectGiftModel() {
    return {
      'title': _titleController.text,
      'subtitle': _subtitleController.text,
      'reserved': false,
    };
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 4.sp,
              width: 35.sp,
              decoration: BoxDecoration(
                color: tertiaryColor,
                borderRadius: BorderRadius.circular(40.sp),
              ),
            ),
            SizedBox(height: 20.sp),
            CustomTextField(
              controller: _titleController,
              text: S.of(context).gift_name,
            ),
            SizedBox(height: 12.sp),
            CustomTextField(
              controller: _subtitleController,
              text: S.of(context).gift_link,
            ),
            SizedBox(height: 50.sp),
            RoundedButton(
              fontSize: 16.sp,
              width: 181.sp,
              height: 50.sp,
              onPressed: () {
                widget.onAddGift(injectGiftModel());
                Navigator.pop(context);
              },
              text: S.of(context).add_gift,
              buttonColor: secondaryAccentColor,
            ),
            SizedBox(height: 351.sp),
          ],
        ),
      ),
    );
  }
}
