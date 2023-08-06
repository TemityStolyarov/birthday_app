import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/guest/models/guest_model.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_text_field.dart';
import 'package:mobyte_birthday/feachures/widgets/custon_rounded_button.dart';
import 'package:mobyte_birthday/generated/l10n.dart';

class AddGuestPanel extends StatefulWidget {
  const AddGuestPanel({super.key});

  @override
  State<AddGuestPanel> createState() => _AddGiftPanelState();
}

class _AddGiftPanelState extends State<AddGuestPanel> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _surnameController = TextEditingController();
  final TextEditingController _birthdayDateController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _professionController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _nameController.dispose();
    _surnameController.dispose();
    _birthdayDateController.dispose();
    _phoneNumberController.dispose();
    _professionController.dispose();
    super.dispose();
  }

  void _addGuest(GuestModel guest) {
    if (_formKey.currentState!.validate()) {
      Hive.box('guests').add(guest);
      Navigator.pop(context);
    }
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
        child: Form(
          key: _formKey,
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
                text: S.of(context).guest_name,
                required: true,
              ),
              SizedBox(height: 12.sp),
              CustomTextField(
                controller: _surnameController,
                text: S.of(context).guest_surname,
                required: true,
              ),
              SizedBox(height: 12.sp),
              CustomDateTextField(
                controller: _birthdayDateController,
                text: S.of(context).guest_birthday,
                required: true,
                predictedDate: DateTime.now(),
              ),
              SizedBox(height: 12.sp),
              CustomPhoneTextField(
                controller: _phoneNumberController,
                text: S.of(context).guest_phone,
                required: false,
              ),
              SizedBox(height: 12.sp),
              CustomTextField(
                controller: _professionController,
                text: S.of(context).guest_profession,
                required: true,
              ),
              SizedBox(height: 50.sp),
              RoundedButton(
                fontSize: 16.sp,
                width: 181.sp,
                height: 50.sp,
                onPressed: () {
                  final newGuest = GuestModel(
                    name: _nameController.text,
                    surname: _surnameController.text,
                    birthdayDate: _birthdayDateController.text,
                    phone: _phoneNumberController.text,
                    profession: _professionController.text,
                  );
                  _addGuest(newGuest);
                },
                text: S.of(context).add_guest,
                buttonColor: secondaryAccentColor,
              ),
              SizedBox(height: 135.sp),
            ],
          ),
        ),
      ),
    );
  }
}
