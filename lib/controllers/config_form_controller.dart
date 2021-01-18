import 'package:get/get.dart';
import 'package:muslim_prayer_times/data/models/location_model.dart';

class ConfigFormController extends GetxController {
  final Rx<Location> _location = Rx<Location>();
  Location get location => _location.value ?? Location.cityAndCountry(city: "", country: "");
  set location(Location location) => _location.value = location;

  final Rx<bool> _isLocationSet = Rx<bool>();
  bool get isLocationSet => _isLocationSet.value ?? false;
  set isLocationSet(bool isLocationSet) => _isLocationSet.value = isLocationSet;
}