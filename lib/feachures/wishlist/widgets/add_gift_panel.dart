import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_text_field.dart';
import 'package:mobyte_birthday/feachures/widgets/custon_rounded_button.dart';
import 'package:mobyte_birthday/feachures/wishlist/models/gift_model.dart';
import 'package:mobyte_birthday/generated/l10n.dart';

class AddGiftPanel extends StatefulWidget {
  const AddGiftPanel({
    Key? key,
  }) : super(key: key);

  @override
  State<AddGiftPanel> createState() => _AddGiftPanelState();
}

class _AddGiftPanelState extends State<AddGiftPanel> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _linkController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _linkController.dispose();
    super.dispose();
  }

  void _addGift(GiftModel newGift) {
    // if (_formKey.currentState!.validate()) {
    Hive.box('gifts').add(newGift);
    Navigator.pop(context);
    // }
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
              controller: _nameController,
              text: S.of(context).gift_name,
              required: true,
            ),
            SizedBox(height: 12.sp),
            CustomTextField(
              controller: _linkController,
              text: S.of(context).gift_link,
              required: true,
            ),
            SizedBox(height: 50.sp),
            RoundedButton(
              fontSize: 16.sp,
              width: 181.sp,
              height: 50.sp,
              onPressed: () {
                final newGift = GiftModel(
                  name: _nameController.text,
                  link: _linkController.text,
                  reserved: false,
                );
                _addGift(newGift);
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
