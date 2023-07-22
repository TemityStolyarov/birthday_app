import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_birthday/core/constants.dart';
import 'package:mobyte_birthday/ui/widgets/custom_app_bar.dart';
import 'package:mobyte_birthday/ui/widgets/custom_floating_button.dart';

class GuestPage extends StatefulWidget {
  const GuestPage({Key? key}) : super(key: key);

  @override
  State<GuestPage> createState() => _GuestPageState();
}

List<Map<String, dynamic>> persons = [
  {
    'name': 'Playstation 5',
    'age': '19 лет',
    'profession': 'Студент',
  },
  {
    'name': 'GTA V',
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
        return Scaffold(
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
            child: const CustomAppBar(text: 'Список гостей'),
          ),
          resizeToAvoidBottomInset: false,
          backgroundColor: backgroundColor,
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      PersonsList(
                        persons: persons,
                        //TODO onImageChange: onImageChange,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
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
        return Container();
        //TODO
        // AddPersonPanel(
        //   onAddPerson: onAddPerson,
        // );
      },
    );
  }
}

class Person extends StatelessWidget {
  final String name;
  final String age;
  final String profession;
  final String? phone;
  final String? image;
  final VoidCallback onTap;

  const Person({
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
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    name,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    age,
                    style:
                        TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    profession,
                    style: TextStyle(
                        fontSize: 14.sp, decoration: TextDecoration.underline),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class PersonsList extends StatefulWidget {
  final List<Map<String, dynamic>> persons;

  const PersonsList({
    Key? key,
    required this.persons,
  }) : super(key: key);

  @override
  State<PersonsList> createState() => _PersonsListState();
}

class _PersonsListState extends State<PersonsList> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (BuildContext context, int index) {
        return Person(
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
      scrollDirection: Axis.vertical,
    );
  }
}
