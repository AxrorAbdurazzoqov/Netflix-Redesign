// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'top100_series_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class Top100SeriesModelAdapter extends TypeAdapter<Top100SeriesModel> {
  @override
  final int typeId = 3;

  @override
  Top100SeriesModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Top100SeriesModel(
      rank: fields[0] as int,
      title: fields[1] as String,
      description: fields[2] as String,
      image: fields[3] as String,
      bigImage: fields[4] as String,
      genre: (fields[5] as List).cast<String>(),
      thumbnail: fields[6] as String,
      rating: fields[7] as double,
      id: fields[8] as String,
      year: fields[9] as String,
      imdbid: fields[10] as String,
      imdbLink: fields[11] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Top100SeriesModel obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.rank)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.image)
      ..writeByte(4)
      ..write(obj.bigImage)
      ..writeByte(5)
      ..write(obj.genre)
      ..writeByte(6)
      ..write(obj.thumbnail)
      ..writeByte(7)
      ..write(obj.rating)
      ..writeByte(8)
      ..write(obj.id)
      ..writeByte(9)
      ..write(obj.year)
      ..writeByte(10)
      ..write(obj.imdbid)
      ..writeByte(11)
      ..write(obj.imdbLink);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Top100SeriesModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
