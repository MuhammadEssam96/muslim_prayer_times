// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../prayer_enum_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerAdapter extends TypeAdapter<Prayer> {
  @override
  final int typeId = 6;

  @override
  Prayer read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return Prayer.fajr;
      case 1:
        return Prayer.dhuhr;
      case 2:
        return Prayer.asr;
      case 3:
        return Prayer.maghrib;
      case 4:
        return Prayer.isha;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, Prayer obj) {
    switch (obj) {
      case Prayer.fajr:
        writer.writeByte(0);
        break;
      case Prayer.dhuhr:
        writer.writeByte(1);
        break;
      case Prayer.asr:
        writer.writeByte(2);
        break;
      case Prayer.maghrib:
        writer.writeByte(3);
        break;
      case Prayer.isha:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is PrayerAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
  }
}
