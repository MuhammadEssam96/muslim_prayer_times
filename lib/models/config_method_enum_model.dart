import 'package:hive/hive.dart';

part 'config_method_enum_model.g.dart';

@HiveType(typeId: 3)
enum ConfigMethod {
  @HiveField(0)
  universityOfIslamicSciencesKarachi,

  @HiveField(1)
  islamicSocietyOfNorthAmerica,

  @HiveField(2)
  muslimWorldLeague,

  @HiveField(3)
  ummAlQuraUniversityMakkah,

  @HiveField(4)
  egyptianGeneralAuthorityOfSurvey,

  @HiveField(5)
  instituteOfGeophysicsUniversityOfTehran,

  @HiveField(6)
  gulfRegion,

  @HiveField(7)
  kuwait,

  @HiveField(8)
  qatar,

  @HiveField(9)
  majlisUgamaIslamSingapuraSingapore,

  @HiveField(10)
  unionOrganizationIslamicDeFrance,

  @HiveField(11)
  diyanetIsleriBaskanligiTurkey,

  @HiveField(12)
  spiritualAdministrationOfMuslimsOfRussia
}