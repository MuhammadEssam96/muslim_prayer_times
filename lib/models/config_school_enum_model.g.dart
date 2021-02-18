part of 'config_school_enum_model.dart';

class ConfigSchoolAdapter extends TypeAdapter<ConfigSchool> {
  @override
  final int typeId = 2;

  @override
  ConfigSchool read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ConfigSchool.shafi;
      case 1:
        return ConfigSchool.hanafi;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ConfigSchool obj) {
    switch (obj) {
      case ConfigSchool.shafi:
        writer.writeByte(0);
        break;
      case ConfigSchool.hanafi:
        writer.writeByte(1);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is ConfigSchoolAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
  }
}