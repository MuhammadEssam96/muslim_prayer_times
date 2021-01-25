import 'package:get/get.dart';
import 'package:muslim_prayer_times/data/models/config_model.dart';
import 'package:muslim_prayer_times/data/models/location_model.dart';

class ConfigFormController extends GetxController {
  final Rx<Location> _location = Rx<Location>();
  Location get location => _location.value ?? Location.cityAndCountry(city: "", country: "");
  set location(Location location) => _location.value = location;

  final Rx<bool> _isLocationSet = Rx<bool>();
  bool get isLocationSet => _isLocationSet.value ?? false;
  set isLocationSet(bool isLocationSet) => _isLocationSet.value = isLocationSet;

  final Rx<ConfigMethod> _configMethod = Rx<ConfigMethod>();
  ConfigMethod get configMethod => _configMethod.value ?? ConfigMethod.egyptianGeneralAuthorityOfSurvey;
  set configMethod(ConfigMethod configMethod) => _configMethod.value = configMethod;

  final Rx<ConfigSchool> _configSchool = Rx<ConfigSchool>();
  ConfigSchool get configSchool => _configSchool.value ?? ConfigSchool.shafi;
  set configSchool(ConfigSchool configSchool) => _configSchool.value = configSchool;

  final Rx<String> _configName = Rx<String>();
  String get configName => _configName.value ?? "";
  set configName(String configName) => _configName.value = configName;

  final Rx<bool> _configDefaultSelected = Rx<bool>();
  bool get configDefaultSelected => _configDefaultSelected.value ?? true;
  set configDefaultSelected(bool configDefaultSelected) => _configDefaultSelected.value = configDefaultSelected;
}