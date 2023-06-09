// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'random_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RandomModelAdapter extends TypeAdapter<RandomModel> {
  @override
  final int typeId = 0;

  @override
  RandomModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RandomModel(
      id: fields[0] as String,
      title: fields[1] as TitleModel,
      malId: fields[2] as int?,
      isLicensed: fields[3] as bool,
      image: fields[4] as String,
      color: fields[5] as String?,
      cover: fields[6] as String,
      description: fields[7] as String,
      releaseDate: fields[8] as int,
      totalEpisodes: fields[9] as int,
      currentEpisode: fields[10] as int,
      genres: (fields[11] as List).cast<String>(),
      season: fields[12] as String?,
      subOrDub: fields[13] as String,
    );
  }

  @override
  void write(BinaryWriter writer, RandomModel obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.malId)
      ..writeByte(3)
      ..write(obj.isLicensed)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.cover)
      ..writeByte(7)
      ..write(obj.description)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.totalEpisodes)
      ..writeByte(10)
      ..write(obj.currentEpisode)
      ..writeByte(11)
      ..write(obj.genres)
      ..writeByte(12)
      ..write(obj.season)
      ..writeByte(13)
      ..write(obj.subOrDub);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RandomModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
