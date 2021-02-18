import 'package:hive/hive.dart';

part 'config_school_enum_model.g.dart';

@HiveType(typeId: 2)
enum ConfigSchool {
  @HiveField(0)
  shafi,

  @HiveField(1)
  hanafi
}