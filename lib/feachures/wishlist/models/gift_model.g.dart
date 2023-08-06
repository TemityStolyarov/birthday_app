// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GiftModelAdapter extends TypeAdapter<GiftModel> {
  @override
  final int typeId = 1;

  @override
  GiftModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return GiftModel(
      name: fields[0] as String,
      link: fields[1] as String,
      reserved: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, GiftModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.link)
      ..writeByte(2)
      ..write(obj.reserved);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GiftModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
