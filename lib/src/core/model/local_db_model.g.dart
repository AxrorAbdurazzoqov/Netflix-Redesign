// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_db_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class LocalDbModelAdapter extends TypeAdapter<LocalDbModel> {
  @override
  final int typeId = 1;

  @override
  LocalDbModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LocalDbModel(
      model: fields[0] as dynamic,
      isLiked: fields[1] as bool,
      isDownloaded: fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LocalDbModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.model)
      ..writeByte(1)
      ..write(obj.isLiked)
      ..writeByte(2)
      ..write(obj.isDownloaded);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LocalDbModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
