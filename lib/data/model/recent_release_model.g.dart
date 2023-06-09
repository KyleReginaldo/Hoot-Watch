// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recent_release_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class RecentReleaseModelAdapter extends TypeAdapter<RecentReleaseModel> {
  @override
  final int typeId = 4;

  @override
  RecentReleaseModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentReleaseModel(
      currentPage: fields[0] as int,
      hasNextPage: fields[1] as bool,
      totalPages: fields[2] as int,
      totalResults: fields[3] as int,
      results: (fields[4] as List).cast<RecentResultEntity>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecentReleaseModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.currentPage)
      ..writeByte(1)
      ..write(obj.hasNextPage)
      ..writeByte(2)
      ..write(obj.totalPages)
      ..writeByte(3)
      ..write(obj.totalResults)
      ..writeByte(4)
      ..write(obj.results);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentReleaseModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class RecentResultModelAdapter extends TypeAdapter<RecentResultModel> {
  @override
  final int typeId = 5;

  @override
  RecentResultModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return RecentResultModel(
      id: fields[0] as String,
      malId: fields[1] as int,
      title: fields[2] as TitleModel,
      image: fields[3] as String,
      rating: fields[4] as int?,
      color: fields[5] as String?,
      episodeId: fields[6] as String,
      episodeTitle: fields[7] as String,
      episodeNumber: fields[8] as int,
      genres: (fields[9] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, RecentResultModel obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.malId)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.rating)
      ..writeByte(5)
      ..write(obj.color)
      ..writeByte(6)
      ..write(obj.episodeId)
      ..writeByte(7)
      ..write(obj.episodeTitle)
      ..writeByte(8)
      ..write(obj.episodeNumber)
      ..writeByte(9)
      ..write(obj.genres);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RecentResultModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
