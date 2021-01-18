import 'package:hive/hive.dart';
import 'package:muslim_prayer_times/data/models/location_model.dart';

part 'config_model.g.dart';

@HiveType(typeId: 0)
class Config {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final Location location;

  @HiveField(2)
  final String method;

  @HiveField(3)
  final String timeZoneString;

  @HiveField(4)
  final String school;

  const Config(
    this.id,
    this.location,
    this.method,
    this.timeZoneString,
    this.school
  );
}