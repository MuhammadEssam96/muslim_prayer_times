import 'package:location_permissions/location_permissions.dart';

class LocationPermissionService {
  static Future<PermissionStatus> checkPermissionStatus() {
    return LocationPermissions().checkPermissionStatus();
  }

  static Future<PermissionStatus> requestLocationPermission() {
    return LocationPermissions().requestPermissions();
  }
}