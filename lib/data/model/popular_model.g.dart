// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'popular_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PopularModelAdapter extends TypeAdapter<PopularModel> {
  @override
  final int typeId = 8;

  @override
  PopularModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularModel(
      currentPage: fields[1] as int,
      hasNextPage: fields[2] as bool,
      results: (fields[3] as List).cast<PopularResultModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, PopularModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(1)
      ..write(obj.currentPage)
      ..writeByte(2)
      ..write(obj.hasNextPage)
      ..writeByte(3)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class PopularResultModelAdapter extends TypeAdapter<PopularResultModel> {
  @override
  final int typeId = 9;

  @override
  PopularResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return PopularResultModel(
      id: fields[1] as String,
      malId: fields[2] as int?,
      title: fields[3] as TitleModel,
      image: fields[4] as String,
      description: fields[5] as String?,
      cover: fields[6] as String,
      rating: fields[7] as int,
      releaseDate: fields[8] as int,
      color: fields[9] as String?,
      genres: (fields[10] as List).cast<String>(),
      totalEpisodes: fields[11] as int,
      duration: fields[12] as int,
    );
  }

  @override
  void write(BinaryWriter writer, PopularResultModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.malId)
      ..writeByte(3)
      ..write(obj.title)
      ..writeByte(4)
      ..write(obj.image)
      ..writeByte(5)
      ..write(obj.description)
      ..writeByte(6)
      ..write(obj.cover)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.releaseDate)
      ..writeByte(9)
      ..write(obj.color)
      ..writeByte(10)
      ..write(obj.genres)
      ..writeByte(11)
      ..write(obj.totalEpisodes)
      ..writeByte(12)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PopularResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
