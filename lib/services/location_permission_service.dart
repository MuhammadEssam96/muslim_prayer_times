import 'package:location/location.dart';

class LocationPermissionService {
  static Future<PermissionStatus> checkPermissionStatus() {
    return Location().hasPermission();
  }

  static Future<PermissionStatus> requestLocationPermission() {
    return Location().requestPermission();
  }
}