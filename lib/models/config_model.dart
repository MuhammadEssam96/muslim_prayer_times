import 'package:hive/hive.dart';

import 'config_method_enum_model.dart';
import 'config_school_enum_model.dart';
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