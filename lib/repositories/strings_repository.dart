import 'package:muslim_prayer_times/models/config_model.dart';

class StringsRepository {
  static const String appPreferencesBoxName = "AppPreferences";
  static const String configsBoxName = "Configs";

  static const String firstOpenKey = "firstOpen";
  static const String configsExistKey = "configsExist";
  static const String defaultConfigIDKey = "defaultConfigIDKey";
  static const String selectedLanguageKey = "selectedLanguageKey";
  static const String settingsKey = "settingsKey";

  static const Map<dynamic, String> boxNames = {
    Config : configsBoxName
  };
}