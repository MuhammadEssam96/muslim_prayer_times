import 'package:geocode/geocode.dart';
import 'package:muslim_prayer_times/ui/constants/secrets.dart';

class GeoCodeService {
  static Future<Address> reverseGeocoding({double latitude, double longitude}) {
    final GeoCode geoCode = GeoCode(apiKey: Secrets.geoCodeXYZAPIKey);

    try {
      return geoCode.reverseGeocoding(latitude: latitude, longitude: longitude);
    } on RequestThrottledException {
      return reverseGeocoding(latitude: latitude, longitude: longitude);
    }
  }
}