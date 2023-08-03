import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/widgets/custon_rounded_button.dart';

class AddGuestPanel extends StatefulWidget {
  final Function(Map<String, dynamic>) onAddPerson;

  const AddGuestPanel({
    Key? key,
    required this.onAddPerson,
  }) : super(key: key);

  @override
  State<AddGuestPanel> createState() => _AddGiftPanelState();
}

class _AddGiftPanelState extends State<AddGuestPanel> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birthdayDateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _birthdayDateController.dispose();
    _phoneNumberController.dispose();
    _professionController.dispose();
    super.dispose();
  }

  Map<String, dynamic> injectGuestModel() {
    return {
      'name': _nameController.text,
      'surname': _surnameController.text,
      'birthday': _birthdayDateController.text,
      'phone': _phoneNumberController.text,
      'profession': _professionController.text,
    };
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(context).viewInsets.bottom / 1.5.h, // Keyboard Inset
      ),
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
            TextField(
              controller: _nameController,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              cursorColor: secondaryAccentColor,
              decoration: InputDecoration(
                filled: true,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(4.sp),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Имя *',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: secondaryFontColor,
                ),
                fillColor: textInputBackbroundColor,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.sp,
                  horizontal: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 12.sp),
            TextField(
              controller: _surnameController,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              cursorColor: secondaryAccentColor,
              decoration: InputDecoration(
                filled: true,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(4.sp),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Фамилия *',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: secondaryFontColor,
                ),
                fillColor: textInputBackbroundColor,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.sp,
                  horizontal: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 12.sp),
            TextField(
              controller: _birthdayDateController,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              cursorColor: secondaryAccentColor,
              decoration: InputDecoration(
                filled: true,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(4.sp),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Дата рождения *',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: secondaryFontColor,
                ),
                fillColor: textInputBackbroundColor,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.sp,
                  horizontal: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 12.sp),
            TextField(
              controller: _phoneNumberController,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              cursorColor: secondaryAccentColor,
              decoration: InputDecoration(
                filled: true,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(4.sp),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Телефон',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: secondaryFontColor,
                ),
                fillColor: textInputBackbroundColor,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.sp,
                  horizontal: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 12.sp),
            TextField(
              controller: _professionController,
              style: TextStyle(
                fontSize: 16.sp,
                fontWeight: FontWeight.w700,
              ),
              cursorColor: secondaryAccentColor,
              decoration: InputDecoration(
                filled: true,
                border: UnderlineInputBorder(
                  borderRadius: BorderRadius.circular(4.sp),
                  borderSide: BorderSide.none,
                ),
                labelText: 'Профессия *',
                labelStyle: const TextStyle(
                  fontWeight: FontWeight.w400,
                  color: secondaryFontColor,
                ),
                fillColor: textInputBackbroundColor,
                contentPadding: EdgeInsets.symmetric(
                  vertical: 8.sp,
                  horizontal: 12.sp,
                ),
              ),
            ),
            SizedBox(height: 50.sp),
            RoundedButton(
              fontSize: 16.sp,
              width: 181.sp,
              height: 50.sp,
              onPressed: () {
                widget.onAddPerson(injectGuestModel());
                Navigator.pop(context);
              },
              text: 'Записаться',
              buttonColor: secondaryAccentColor,
            ),
            SizedBox(height: 135.sp),
          ],
        ),
      ),
    );
  }
}
