// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trending_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TrendingModelAdapter extends TypeAdapter<TrendingModel> {
  @override
  final int typeId = 2;

  @override
  TrendingModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrendingModel(
      currentPage: fields[0] as int,
      hasNextPage: fields[1] as bool,
      results: (fields[2] as List).cast<TrendingResultEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, TrendingModel obj) {
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
      other is TrendingModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class TrendingResultModelAdapter extends TypeAdapter<TrendingResultModel> {
  @override
  final int typeId = 3;

  @override
  TrendingResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TrendingResultModel(
      id: fields[0] as String,
      malId: fields[1] as int?,
      title: fields[2] as TitleModel,
      image: fields[3] as String,
      description: fields[4] as String,
      cover: fields[5] as String,
      rating: fields[6] as int?,
      releaseDate: fields[7] as int?,
      color: fields[8] as String?,
      genres: (fields[9] as List).cast<String>(),
      totalEpisodes: fields[10] as int?,
      duration: fields[11] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, TrendingResultModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.malId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.cover)
      ..writeByte(6)
      ..write(obj.rating)
      ..writeByte(7)
      ..write(obj.releaseDate)
      ..writeByte(8)
      ..write(obj.color)
      ..writeByte(9)
      ..write(obj.genres)
      ..writeByte(10)
      ..write(obj.totalEpisodes)
      ..writeByte(11)
      ..write(obj.duration);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TrendingResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
