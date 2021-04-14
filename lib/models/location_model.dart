import 'package:hive/hive.dart';

part 'generated/location_model.g.dart';

@HiveType(typeId: 1)
class Location {
  @HiveField(0)
  String city;

  @HiveField(1)
  String country;

  @HiveField(2)
  String latitude;

  @HiveField(3)
  String longitude;

  Location({
    required this.city,
    required this.country,
    required this.latitude,
    required this.longitude
  });

  bool isLocationEmpty(Location location) {
    return location.city.isEmpty
        || location.country.isEmpty
        || location.latitude.isEmpty
        || location.longitude.isEmpty;
  }
}