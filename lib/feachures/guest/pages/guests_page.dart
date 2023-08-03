import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/guest/widgets/add_guest_panel.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_app_bar.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_floating_button.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_scaffold.dart';
import 'package:mobyte_birthday/generated/l10n.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  State<GuestPage> createState() => _GuestPageState();
}

List<Map<String, dynamic>> persons = [
  {
    'name': 'Иван',
    'surname': 'Иванов',
    'birthday': '19 лет',
    'profession': 'Студент',
  },
  {
    'name': 'Марья',
    'surname': 'Морская',
    'birthday': '23 года',
    'profession': 'Дизайнер',
  },
];

class _GuestPageState extends State<GuestPage> {
  void onAddPerson(Map<String, dynamic> gift) {
    setState(() {
      persons.add(gift);
    });
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
        return AddGuestPanel(
          onAddPerson: onAddPerson,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
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
            body: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(16.sp),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '${persons.length} ${S.of(context).guests(persons.length)}',
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
                    _PersonsList(
                      persons: persons,
                      //TODO onImageChange: onImageChange,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _PersonsList extends StatefulWidget {
  final List<Map<String, dynamic>> persons;

  const _PersonsList({
    Key? key,
    required this.persons,
  }) : super(key: key);

  @override
  State<_PersonsList> createState() => _PersonsListState();
}

class _PersonsListState extends State<_PersonsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return _Person(
          name: widget.persons[index]['name'],
          surname: widget.persons[index]['surname'],
          birthdayDate: widget.persons[index]['birthday'],
          profession: widget.persons[index]['profession'],
          onTap: () {/*TODO*/},
        );
      },
      itemCount: widget.persons.length,
      separatorBuilder: (BuildContext context, int index) {
        return SizedBox(height: 16.sp);
      },
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
    );
  }
}

// TODO Remove Todo Panel
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

class _Person extends StatelessWidget {
  final String name;
  final String surname;
  final String birthdayDate;
  final String profession;
  final String? phone;
  final String? image;
  final VoidCallback onTap;

  const _Person({
    Key? key,
    required this.name,
    required this.surname,
    required this.birthdayDate,
    required this.profession,
    this.phone,
    this.image,
    required this.onTap,
  }) : super(key: key);

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
              child: Image.asset(
                'assets/images/person.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(width: 12.sp),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '$name $surname',
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              birthdayDate,
              style: TextStyle(
                fontSize: 12.sp,
                color: secondaryFontColor,
              ),
            ),
            Text(
              profession,
              style: TextStyle(
                fontSize: 14.sp,
                color: secondaryFontColor,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
