import 'package:geocode/geocode.dart';

import '../repositories/secrets_repository.dart';

class GeoCodeService {
  static Future<Address> reverseGeocoding({double latitude, double longitude}) {
    final GeoCode geoCode = GeoCode(apiKey: SecretsRepository.geoCodeXYZAPIKey);

    try {
      return geoCode.reverseGeocoding(latitude: latitude, longitude: longitude);
    } on RequestThrottledException {
      return reverseGeocoding(latitude: latitude, longitude: longitude);
    }
  }
}