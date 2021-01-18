import 'package:location_permissions/location_permissions.dart';

class LocationPermissionService {
  static Future<PermissionStatus> checkPermissionStatus() => LocationPermissions().checkPermissionStatus();
  static Future<PermissionStatus> requestLocationPermission() => LocationPermissions().requestPermissions();
}