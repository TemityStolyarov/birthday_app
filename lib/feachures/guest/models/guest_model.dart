import 'package:hive/hive.dart';

part 'guest_model.g.dart';

@HiveType(typeId: 0)
class GuestModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String surname;
  @HiveField(2)
  final String birthdayDate;
  @HiveField(3)
  final String profession;
  @HiveField(4)
  final String? phone;
  @HiveField(5)
  final String? image;

  GuestModel({
    required this.name,
    required this.surname,
    required this.birthdayDate,
    required this.profession,
    this.phone,
    this.image,
  });
}
