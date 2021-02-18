// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../settings_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SettingsAdapter extends TypeAdapter<Settings> {
  @override
  final int typeId = 4;

  @override
  Settings read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte() : reader.read(),
    };
    return Settings(
      defaultConfigId: fields[0] as int,
      languageSelected: fields[1] as String,
      notificationSaved: (fields[2] as List)?.cast<NotificationOptions>(),
      showSunriseTime: fields[3] as bool,
      showImsakTime: fields[4] as bool,
      showMidnightTime: fields[5] as bool,
      darkMode: fields[6] as bool
    );
  }

  @override
  void write(BinaryWriter writer, Settings obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.defaultConfigId)
      ..writeByte(1)
      ..write(obj.languageSelected)
      ..writeByte(2)
      ..write(obj.notificationSaved)
      ..writeByte(3)
      ..write(obj.showSunriseTime)
      ..writeByte(4)
      ..write(obj.showImsakTime)
      ..writeByte(5)
      ..write(obj.showMidnightTime)
      ..writeByte(6)
      ..write(obj.darkMode);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is SettingsAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
  }
}
