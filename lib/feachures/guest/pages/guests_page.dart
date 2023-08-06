import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/guest/models/guest_model.dart';
import 'package:mobyte_birthday/feachures/guest/widgets/add_guest_panel.dart';
import 'package:mobyte_birthday/feachures/guest/widgets/edit_guest_panel.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_app_bar.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_floating_button.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_scaffold.dart';
import 'package:mobyte_birthday/generated/l10n.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  State<GuestPage> createState() => _GuestPageState();
}

class _GuestPageState extends State<GuestPage> {
  // Mocked default falues
  void initDefaultGuestValues() {
    Hive.box('guests').put(
      0,
      GuestModel(
        name: 'Иван',
        surname: 'Иванов',
        birthdayDate: '30.10.2003',
        profession: 'Студент',
      ),
    );
    Hive.box('guests').put(
      1,
      GuestModel(
        name: 'Марья',
        surname: 'Морская',
        birthdayDate: '30.10.1999',
        profession: 'Дизайнер',
        image: 'https://i.ibb.co/KqYFzrS/Frame-407.png',
      ),
    );
  }

  void _showSlidingPanel(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.sp),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const AddGuestPanel();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return FutureBuilder(
          future: Hive.openBox('guests'),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              } else {
                initDefaultGuestValues();
                return CustomSafeArea(
                  scaffold: Scaffold(
                    floatingActionButton: Padding(
                      padding: EdgeInsets.only(right: 16.sp),
                      child: CustomFloatingButton(
                        size: 84.spMin,
                        onTap: () {
                          _showSlidingPanel(context);
                        },
                      ),
                    ),
                    appBar: PreferredSize(
                      preferredSize: Size.fromHeight(48.sp),
                      child: CustomAppBar(text: S.of(context).guestlist),
                    ),
                    resizeToAvoidBottomInset: false,
                    backgroundColor: backgroundColor,
                    body: ValueListenableBuilder(
                      valueListenable: Hive.box('guests').listenable(),
                      builder:
                          (BuildContext context, guestsBox, Widget? child) {
                        return SingleChildScrollView(
                          child: Padding(
                            padding: EdgeInsets.all(16.sp),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      '${guestsBox.length} ${S.of(context).guests(guestsBox.length)}',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        _showTodoPanel(context, 'Sorting');
                                      },
                                      child: Text(
                                        S.of(context).sort_by_name_des,
                                        style: TextStyle(
                                          fontSize: 14.sp,
                                          decoration: TextDecoration.underline,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 16.sp),
                                const _GuestsList(
                                    //TODO onImageChange: onImageChange,
                                    ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                );
              }
            } else {
              return const CustomSafeArea(
                scaffold: Scaffold(
                  body: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(
                          color: secondaryAccentColor,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }

  @override
  void dispose() {
    Hive.close();
    super.dispose();
  }
}

class _GuestsList extends StatefulWidget {
  const _GuestsList({
    Key? key,
  }) : super(key: key);

  @override
  State<_GuestsList> createState() => _GuestsListState();
}

class _GuestsListState extends State<_GuestsList> {
  void _showEditingPanel(BuildContext context, int index) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(12.sp),
        ),
      ),
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return EditGuestPanel(index: index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box('guests').listenable(),
      builder: (BuildContext context, guestsBox, Widget? child) {
        return ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            final guestModel = Hive.box('guests').getAt(index) as GuestModel;
            return InkWell(
              overlayColor: const MaterialStatePropertyAll(Colors.transparent),
              onDoubleTap: () => _showEditingPanel(context, index),
              child: _GuestTile(
                guestModel: guestModel,
                guestsBox: guestsBox,
                index: index,
              ),
            );
          },
          itemCount: guestsBox.length,
          separatorBuilder: (BuildContext context, int index) {
            return SizedBox(height: 16.sp);
          },
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
        );
      },
    );
  }
}

// TODO Remove method Todo Panel
void _showTodoPanel(BuildContext context, String text) {
  showModalBottomSheet(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: Radius.circular(12.sp),
      ),
    ),
    context: context,
    isScrollControlled: true,
    builder: (BuildContext context) {
      return SizedBox(
        height: 140.sp,
        child: Center(
          child: Text('TODO: $text'),
        ),
      );
    },
  );
}

class _GuestTile extends StatelessWidget {
  final GuestModel guestModel;
  // final VoidCallback onTapUpdate;
  final Box guestsBox;
  final int index;

  const _GuestTile({
    Key? key,
    required this.guestModel,
    // required this.onTapUpdate,
    required this.guestsBox,
    required this.index,
  }) : super(key: key);

  String calculateAge(String date, BuildContext context) {
    final DateTime birthDate = DateFormat('dd.MM.yyyy').parse(date);
    final DateTime currentDate = DateTime.now();
    int age = currentDate.year - birthDate.year;
    if (birthDate.month > currentDate.month) {
      age--;
    } else if (birthDate.month == currentDate.month) {
      if (birthDate.day > currentDate.day) {
        age--;
      }
    }
    return '$age ${S.of(context).age(age)}';
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _showTodoPanel(context, 'Uploading photo');
          },
          child: SizedBox(
            width: 64.sp,
            height: 64.sp,
            child: ClipOval(
              child: Image.network(
                guestModel.image.toString(),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset(
                    'assets/images/person.png',
                    fit: BoxFit.cover,
                  );
                },
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return const CircularProgressIndicator(
                    color: secondaryAccentColor,
                  );
                },
              ),
            ),
          ),
        ),
        SizedBox(width: 12.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${guestModel.name} ${guestModel.surname}',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              calculateAge(guestModel.birthdayDate, context),
              style: TextStyle(
                fontSize: 12.sp,
                color: secondaryFontColor,
              ),
            ),
            Text(
              guestModel.profession,
              style: TextStyle(
                fontSize: 14.sp,
                color: secondaryFontColor,
              ),
            ),
          ],
        ),
        const Spacer(),
        SizedBox(width: 2.sp),
        SizedBox(
          width: 32.sp,
          height: 64.sp,
          child: IconButton(
            padding: EdgeInsets.all(0.sp),
            splashRadius: 20.sp,
            icon: const Icon(Icons.delete_outline_rounded),
            // TODO Deleting alert
            onPressed: () => guestsBox.deleteAt(index),
          ),
        ),
      ],
    );
  }
}
