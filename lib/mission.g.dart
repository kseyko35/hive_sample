// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mission.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MissionAdapter extends TypeAdapter<Mission> {
  @override
  final int typeId = 0;

  @override
  Mission read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Mission(
      description: fields[0] as String,
      isComplete: fields[1] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Mission obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.description)
      ..writeByte(1)
      ..write(obj.isComplete);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MissionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
