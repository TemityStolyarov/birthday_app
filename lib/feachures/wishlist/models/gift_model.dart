import 'package:hive/hive.dart';

part 'gift_model.g.dart';

@HiveType(typeId: 1)
class GiftModel {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final String link;
  @HiveField(2)
  final bool reserved;

  GiftModel({
    required this.name,
    required this.link,
    required this.reserved,
  });
}
