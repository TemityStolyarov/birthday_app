import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/guest/models/guest_model.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_text_field.dart';
import 'package:mobyte_birthday/feachures/widgets/custon_rounded_button.dart';
import 'package:mobyte_birthday/generated/l10n.dart';

class EditImagePanel extends StatefulWidget {
  final GuestModel guest;
  final int index;
  const EditImagePanel({
    super.key,
    required this.index,
    required this.guest,
  });

  @override
  State<EditImagePanel> createState() => _EditImagePanelState();
}

class _EditImagePanelState extends State<EditImagePanel> {
  final TextEditingController _linkController = TextEditingController();

  @override
  void dispose() {
    _linkController.dispose();
    super.dispose();
  }

  void _presetValue(GuestModel guest) {
    _linkController.text = guest.image ?? '';
  }

  @override
  Widget build(BuildContext context) {
    GuestModel guest = Hive.box('guests').getAt(widget.index);
    _presetValue(guest);

    return SingleChildScrollView(
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(context).viewInsets.bottom / 1.5.h, // Keyboard Inset
      ),
      child: Padding(
        padding: EdgeInsets.all(16.sp),
        child: SizedBox(
          height: 380.sp,
          child: Center(
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  Container(
                    height: 4.sp,
                    width: 35.sp,
                    decoration: BoxDecoration(
                      color: tertiaryColor,
                      borderRadius: BorderRadius.circular(40.sp),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 40.sp,
                      vertical: 16.sp,
                    ),
                    child: Text(
                      S.of(context).input_image,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 14.sp,
                      ),
                    ),
                  ),
                  SizedBox(height: 16.sp),
                  ImageTextField(
                    controller: _linkController,
                    text: S.of(context).guest_image,
                    required: false,
                  ),
                  SizedBox(height: 16.sp),
                  RoundedButton(
                    fontSize: 16.sp,
                    width: 181.sp,
                    height: 50.sp,
                    onPressed: () {
                      final guestWithUpdatedImage = GuestModel(
                        name: guest.name,
                        surname: guest.surname,
                        birthdayDate: guest.birthdayDate,
                        profession: guest.profession,
                        image: _linkController.text,
                      );
                      Hive.box('guests')
                          .putAt(widget.index, guestWithUpdatedImage);
                      Navigator.of(context).pop();
                    },
                    text: S.of(context).load_image,
                    buttonColor: secondaryAccentColor,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
