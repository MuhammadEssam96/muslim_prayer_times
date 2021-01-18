// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ConfigAdapter extends TypeAdapter<Config> {
  @override
  final int typeId = 0;

  @override
  Config read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Config(
      id: fields[0] as int,
      location: fields[1] as Location,
      method: fields[2] as String,
      timeZoneString: fields[3] as String,
      school: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Config obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.location)
      ..writeByte(2)
      ..write(obj.method)
      ..writeByte(3)
      ..write(obj.timeZoneString)
      ..writeByte(4)
      ..write(obj.school);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
