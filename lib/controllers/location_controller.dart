import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' show LocationData;
import 'package:location_permissions/location_permissions.dart';
import 'package:muslim_prayer_times/data/models/location_model.dart';
import 'package:muslim_prayer_times/services/geocode_service.dart';
import 'package:muslim_prayer_times/services/location_permission_service.dart';
import 'package:muslim_prayer_times/services/location_service.dart';

class LocationController extends GetxController {
  final Rx<PermissionStatus> _permissionStatus = Rx<PermissionStatus>();
  PermissionStatus get permissionStatus => _permissionStatus.value ?? PermissionStatus.unknown;
  set permissionStatus(PermissionStatus permissionStatus) => _permissionStatus.value = permissionStatus;

  final Rx<LocationData> _locationData = Rx<LocationData>();
  LocationData get locationData => _locationData.value;
  set locationData(LocationData locationData) => _locationData.value = locationData;

  final Rx<Location> _location = Rx<Location>();
  Location get location => _location.value ?? Location(city: "", country: "", latitude: "", longitude: "");
  set location(Location location) => _location.value = location;

  final Rx<bool> _locationIsLoading = Rx<bool>();
  bool get locationIsLoading => _locationIsLoading.value ?? false;
  set locationIsLoading(bool locationIsLoading) => _locationIsLoading.value = locationIsLoading;

  final Rx<bool> _locationIsLoaded = Rx<bool>();
  bool get locationIsLoaded => _locationIsLoaded.value ?? false;
  set locationIsLoaded(bool locationIsLoaded) => _locationIsLoaded.value = locationIsLoaded;

  @override
  Future<void> onInit() async {
    await checkLocationPermissionStatus();
    super.onInit();
  }

  Future<void> checkLocationPermissionStatus() async {
    permissionStatus = await LocationPermissionService.checkPermissionStatus();
  }

  Future<void> requestLocationPermission() async {
    permissionStatus = await LocationPermissionService.requestLocationPermission();
  }

  Future<void> getLocation() async {
    locationIsLoading = true;
    await Future.delayed(
      const Duration(seconds: 3),
      () async {
        locationData = await LocationService.getLocation();
        final Address address = await GeoCodeService.reverseGeocoding(latitude: locationData.latitude, longitude: locationData.longitude);
        location = Location(city: address.city, country: address.countryName, latitude: locationData.latitude.toString(), longitude: locationData.longitude.toString());
      }
    );
    locationIsLoading = false;
    locationIsLoaded = true;
  }
}