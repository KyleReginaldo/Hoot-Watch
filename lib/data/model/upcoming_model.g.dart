// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upcoming_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UpcomingModelAdapter extends TypeAdapter<UpcomingModel> {
  @override
  final int typeId = 6;

  @override
  UpcomingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UpcomingModel(
      currentPage: fields[0] as int,
      hasNextPage: fields[1] as bool,
      results: (fields[2] as List).cast<UpcomingResultEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, UpcomingModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.currentPage)
      ..writeByte(1)
      ..write(obj.hasNextPage)
      ..writeByte(2)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpcomingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UpcomingResultModelAdapter extends TypeAdapter<UpcomingResultModel> {
  @override
  final int typeId = 7;

  @override
  UpcomingResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UpcomingResultModel(
      id: fields[0] as String,
      malId: fields[1] as int?,
      episode: fields[2] as int,
      airingAt: fields[3] as int,
      title: fields[4] as TitleModel,
      image: fields[5] as String,
      description: fields[6] as String?,
      cover: fields[7] as String,
      color: fields[8] as String?,
      rating: fields[9] as int?,
      releaseDate: fields[10] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, UpcomingResultModel obj) {
    writer
      ..writeByte(11)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.malId)
      ..writeByte(2)
      ..write(obj.episode)
      ..writeByte(3)
      ..write(obj.airingAt)
      ..writeByte(4)
      ..write(obj.title)
      ..writeByte(5)
      ..write(obj.image)
      ..writeByte(6)
      ..write(obj.description)
      ..writeByte(7)
      ..write(obj.cover)
      ..writeByte(8)
      ..write(obj.color)
      ..writeByte(9)
      ..write(obj.rating)
      ..writeByte(10)
      ..write(obj.releaseDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UpcomingResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
