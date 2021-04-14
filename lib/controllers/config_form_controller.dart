import 'package:get/get.dart';

import '../models/config_method_enum_model.dart';
import '../models/config_model.dart';
import '../models/config_school_enum_model.dart';
import '../models/location_model.dart';

class ConfigFormController extends GetxController {
  final Rxn<Location> _location = Rxn<Location>();
  Location? get location => _location.value;
  set location(Location? location) => _location.value = location;

  final Rx<bool> _isLocationSet = Rx<bool>(false);
  bool get isLocationSet => _isLocationSet.value;
  set isLocationSet(bool isLocationSet) => _isLocationSet.value = isLocationSet;

  final Rxn<ConfigMethod> _configMethod = Rxn<ConfigMethod>();
  ConfigMethod get configMethod => _configMethod.value ?? _getDefaultConfigMethod();
  set configMethod(ConfigMethod configMethod) =>_configMethod.value = configMethod;

  final Rx<ConfigSchool> _configSchool = Rx<ConfigSchool>(ConfigSchool.shafi);
  ConfigSchool get configSchool => _configSchool.value;
  set configSchool(ConfigSchool configSchool) => _configSchool.value = configSchool;

  final Rx<String> _configName = Rx<String>("");
  String get configName => _configName.value;
  set configName(String configName) => _configName.value = configName;

  ConfigFormController();

  ConfigFormController.editConfig(Config config) {
    location = config.location;
    configMethod = config.method;
    configSchool = config.school;
    configName = config.name;
    isLocationSet = true;
  }

  ConfigMethod _getDefaultConfigMethod() {
    if (isLocationSet) {
      final String country = location!.country.toLowerCase().trim();

      if (country.contains("pakistan")) {
        return ConfigMethod.universityOfIslamicSciencesKarachi;
      } else if (country.contains("america")
        || country.contains("states")
        || country.contains("mexico")
        || country.contains("canada")
        || country.contains("guatemala")
        || country.contains("cuba")
        || country.contains("haiti")
        || country.contains("dominican republic")
        || country.contains("honduras")
        || country.contains("nicaragua")
        || country.contains("el salvador")
        || country.contains("costa rica")
        || country.contains("panama")
        || country.contains("jamaica")
        || country.contains("trinidad and tobago")
        || country.contains("belize")
        || country.contains("bahamas")
        || country.contains("barbados")
        || country.contains("saint lucia")
        || country.contains("grenada")
        || country.contains("saint vincent and the grenadines")
        || country.contains("antigua and barbuda")
        || country.contains("dominica")
        || country.contains("saint kitts and nevis")
      ) {
        return ConfigMethod.islamicSocietyOfNorthAmerica;
      } else if (country.contains("saudi")
        || country.contains("saudi arabia")
        || country.contains("ksa")
      ) {
        return ConfigMethod.ummAlQuraUniversityMakkah;
      } else if (country.contains("egypt")) {
        return ConfigMethod.egyptianGeneralAuthorityOfSurvey;
      } else if (country.contains("iran")) {
        return ConfigMethod.instituteOfGeophysicsUniversityOfTehran;
      } else if (country.contains("iraq")
        || country.contains("oman")
        || country.contains("uae")
        || country.contains("emirates")
        || country.contains("united arab of emirates")
        || country.contains("bahrain")
      ) {
        return ConfigMethod.gulfRegion;
      } else if (country.contains("kuwait")) {
        return ConfigMethod.kuwait;
      } else if (country.contains("qatar")) {
        return ConfigMethod.qatar;
      } else if (country.contains("singapore")) {
        return ConfigMethod.majlisUgamaIslamSingapuraSingapore;
      } else if (country.contains("france")) {
        return ConfigMethod.unionOrganizationIslamicDeFrance;
      } else if (country.contains("turkey")) {
        return ConfigMethod.diyanetIsleriBaskanligiTurkey;
      } else if (country.contains("russia")) {
        return ConfigMethod.spiritualAdministrationOfMuslimsOfRussia;
      } else {
        return ConfigMethod.muslimWorldLeague;
      }
    } else {
      return ConfigMethod.egyptianGeneralAuthorityOfSurvey;
    }
  }
}