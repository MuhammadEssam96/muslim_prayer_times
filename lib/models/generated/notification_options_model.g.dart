// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../notification_options_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class NotificationOptionsAdapter extends TypeAdapter<NotificationOptions> {
  @override
  final int typeId = 5;

  @override
  NotificationOptions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte() : reader.read(),
    };

    return NotificationOptions(
      prayer: fields[0] as Prayer,
      timeDifference: fields[1] as int,
      isEnabled: fields[2] as bool
    );
  }

  @override
  void write(BinaryWriter writer, NotificationOptions obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.prayer)
      ..writeByte(1)
      ..write(obj.timeDifference)
      ..writeByte(2)
      ..write(obj.isEnabled);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other)
        || other is NotificationOptionsAdapter
            && runtimeType == other.runtimeType
            && typeId == other.typeId;
  }
}
