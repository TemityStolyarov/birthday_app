import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_app_bar.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_floating_button.dart';
import 'package:mobyte_birthday/feachures/widgets/custom_scaffold.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  State<GuestPage> createState() => _GuestPageState();
}

List<Map<String, dynamic>> persons = [
  {
    'name': 'Иван Иванов',
    'age': '19 лет',
    'profession': 'Студент',
  },
  {
    'name': 'Марья Морская',
    'age': '23 года',
    'profession': 'Дизайнер',
  },
];

class _GuestPageState extends State<GuestPage> {
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
                  _showSlidingPanel(context, 'AddPersonPanel');
                },
              ),
            ),
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(48.sp),
              child: const CustomAppBar(text: 'Список гостей'),
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
                          '${persons.length} гостя',
                          style: TextStyle(
                            fontSize: 14.sp,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            _showSlidingPanel(context, 'Sorting');
                          },
                          child: Text(
                            'По имени      ▼',
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
          age: widget.persons[index]['age'],
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

void _showSlidingPanel(BuildContext context, String text) {
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
      //TODO
      // AddPersonPanel(
      //   onAddPerson: onAddPerson,
      // );
    },
  );
}

class _Person extends StatelessWidget {
  final String name;
  final String age;
  final String profession;
  final String? phone;
  final String? image;
  final VoidCallback onTap;

  const _Person({
    Key? key,
    required this.onTap,
    required this.name,
    required this.age,
    required this.profession,
    this.image,
    this.phone,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            _showSlidingPanel(context, 'Uploading photo');
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
              name,
              style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              age,
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
