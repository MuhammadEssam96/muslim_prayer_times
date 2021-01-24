import 'package:hive/hive.dart';

part 'location_model.g.dart';

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
    this.city,
    this.country,
    this.latitude,
    this.longitude
  });

  Location.latAndLong({
    this.latitude,
    this.longitude
  });

  Location.cityAndCountry({
    this.city,
    this.country
  });

  bool isLocationEmpty(Location location) => location.city.isEmpty || location.country.isEmpty || location.latitude.isEmpty || location.longitude.isEmpty;
}