part of '../config_method_enum_model.dart'

class ConfigMethodAdapter extends TypeAdapter<ConfigMethod> {
  @override
  final int typeId = 3;

  @override
  ConfigMethod read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return ConfigMethod.universityOfIslamicSciencesKarachi;
      case 1:
        return ConfigMethod.islamicSocietyOfNorthAmerica;
      case 2:
        return ConfigMethod.muslimWorldLeague;
      case 3:
        return ConfigMethod.ummAlQuraUniversityMakkah;
      case 4:
        return ConfigMethod.egyptianGeneralAuthorityOfSurvey;
      case 5:
        return ConfigMethod.instituteOfGeophysicsUniversityOfTehran;
      case 6:
        return ConfigMethod.gulfRegion;
      case 7:
        return ConfigMethod.kuwait;
      case 8:
        return ConfigMethod.qatar;
      case 9:
        return ConfigMethod.majlisUgamaIslamSingapuraSingapore;
      case 10:
        return ConfigMethod.unionOrganizationIslamicDeFrance;
      case 11:
        return ConfigMethod.diyanetIsleriBaskanligiTurkey;
      case 12:
        return ConfigMethod.spiritualAdministrationOfMuslimsOfRussia;
      default:
        return null;
    }
  }

  @override
  void write(BinaryWriter writer, ConfigMethod obj) {
    switch (obj) {
      case ConfigMethod.universityOfIslamicSciencesKarachi:
        writer.writeByte(0);
        break;
      case ConfigMethod.islamicSocietyOfNorthAmerica:
        writer.writeByte(1);
        break;
      case ConfigMethod.muslimWorldLeague:
        writer.writeByte(2);
        break;
      case ConfigMethod.ummAlQuraUniversityMakkah:
        writer.writeByte(3);
        break;
      case ConfigMethod.egyptianGeneralAuthorityOfSurvey:
        writer.writeByte(4);
        break;
      case ConfigMethod.instituteOfGeophysicsUniversityOfTehran:
        writer.writeByte(5);
        break;
      case ConfigMethod.gulfRegion:
        writer.writeByte(6);
        break;
      case ConfigMethod.kuwait:
        writer.writeByte(7);
        break;
      case ConfigMethod.qatar:
        writer.writeByte(8);
        break;
      case ConfigMethod.majlisUgamaIslamSingapuraSingapore:
        writer.writeByte(9);
        break;
      case ConfigMethod.unionOrganizationIslamicDeFrance:
        writer.writeByte(10);
        break;
      case ConfigMethod.diyanetIsleriBaskanligiTurkey:
        writer.writeByte(11);
        break;
      case ConfigMethod.spiritualAdministrationOfMuslimsOfRussia:
        writer.writeByte(12);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) {
    return identical(this, other) || other is ConfigMethodAdapter && runtimeType == other.runtimeType && typeId == other.typeId;
  }
}