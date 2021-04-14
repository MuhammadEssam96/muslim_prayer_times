import 'package:geocode/geocode.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' show LocationData, PermissionStatus;

import '../models/location_model.dart';
import '../services/geocode_service.dart';
import '../services/location_permission_service.dart';
import '../services/location_service.dart';

class LocationController extends GetxController {
  final Rx<PermissionStatus> _permissionStatus = Rx<PermissionStatus>(PermissionStatus.denied);
  PermissionStatus get permissionStatus => _permissionStatus.value;
  set permissionStatus(PermissionStatus permissionStatus) {
    _permissionStatus.value = permissionStatus;
  }

  final Rxn<LocationData> _locationData = Rxn<LocationData>();
  LocationData? get locationData => _locationData.value;
  set locationData(LocationData? locationData) {
    _locationData.value = locationData;
  }

  final Rxn<Location> _location = Rxn<Location>();
  Location? get location => _location.value;
  set location(Location? location) => _location.value = location;

  final Rx<bool> _locationIsLoading = Rx<bool>(false);
  bool get locationIsLoading => _locationIsLoading.value;
  set locationIsLoading(bool locationIsLoading) {
    _locationIsLoading.value = locationIsLoading;
  }

  final Rx<bool> _locationIsLoaded = Rx<bool>(false);
  bool get locationIsLoaded => _locationIsLoaded.value;
  set locationIsLoaded(bool locationIsLoaded) {
    _locationIsLoaded.value = locationIsLoaded;
  }

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
        final Address address = await GeoCodeService.reverseGeocoding(
          latitude: locationData!.latitude!,
          longitude: locationData!.longitude!
        );

        location = Location(
          city: address.city!,
          country: address.countryName!,
          latitude: locationData!.latitude.toString(),
          longitude: locationData!.longitude.toString()
        );
      }
    );
    locationIsLoading = false;
    locationIsLoaded = true;
  }
}