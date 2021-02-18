import 'package:hive/hive.dart';

import 'location_model.dart';

part 'config_model.g.dart';

@HiveType(typeId: 0)
class Config {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final Location location;

  @HiveField(2)
  final ConfigMethod method;

  @HiveField(3)
  final ConfigSchool school;

  @HiveField(4)
  final bool isDefault;

  @HiveField(5)
  final String name;

  const Config({
    this.id,
    this.location,
    this.method,
    this.school,
    this.isDefault,
    this.name
  });
}

@HiveType(typeId: 2)
enum ConfigSchool {
  @HiveField(0)
  shafi,

  @HiveField(1)
  hanafi
}

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