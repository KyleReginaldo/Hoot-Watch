// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'title_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TitleModelAdapter extends TypeAdapter<TitleModel> {
  @override
  final int typeId = 1;

  @override
  TitleModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TitleModel(
      romaji: fields[0] as String?,
      english: fields[1] as String?,
      native: fields[2] as String?,
      userPreferred: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, TitleModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.romaji)
      ..writeByte(1)
      ..write(obj.english)
      ..writeByte(2)
      ..write(obj.native)
      ..writeByte(3)
      ..write(obj.userPreferred);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TitleModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
