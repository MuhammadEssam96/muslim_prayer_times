import 'package:hive/hive.dart' show TypeAdapter;

import '../database/hive_database.dart';
import '../models/config_model.dart';
import '../models/settings_model.dart';
import '../repositories/strings_repository.dart';

class HiveDatabaseService {
  //Get box name based on Object type
  static String getBoxName(dynamic object) {
    return StringsRepository.boxNames[object];
  }

  static Future<void> initFlutter() => HiveDatabase.initFlutter();
  static void registerAdapter<T>(TypeAdapter<T> adapter) {
    HiveDatabase.registerAdapter<T>(adapter);
  }

  //Open box functions
  static Future<void> openAppPreferencesBox() {
    return HiveDatabase.openBox(StringsRepository.appPreferencesBoxName);
  }

  static Future<void> openConfigsBox() {
    return HiveDatabase.openBoxWithType<Config>(getBoxName(Config));
  }

  //Configs functions
    //Gets all configs from Hive database
  static List<Config> getAllConfigs() {
    return HiveDatabase.getAllObjectsFromTypedBox<Config>(getBoxName(Config));
  }

    //Gets a specific Config based on id
  static Config getConfig(int id) {
    return HiveDatabase.getTypedValueFromTypedBoxWithIntKey(
      boxName: getBoxName(Config),
      key: id
    );
  }

    //Add new config to Hive database
  static Future<void> addConfig(Config config) {
    return HiveDatabase.addObjectToBox<Config>(
      boxName: getBoxName(Config),
      value: config
    );
  }

    //Add a list of Configs to Hive database
  static Future<void> addAllConfigs(List<Config> configs) {
    return HiveDatabase.addAllObjectsToBox<Config>(
      boxName: getBoxName(Config),
      values: configs
    );
  }

    //Add a map of Configs with keys in Hive database
  static Future<void> addAllConfigsWithKeys(Map<int, Config> configs) {
    return HiveDatabase.addAllObjectsWithKeysToBox<Config>(
      boxName: getBoxName(Config),
      values: configs
    );
  }

    //Deletes all configs from Hive database
  static Future<void> deleteAllConfigs() {
    return HiveDatabase.deleteAllObjectsFromBox<Config>(getBoxName(Config));
  }

    //Check if key exists in Hive database
  static bool checkIfKeyExistsInConfigs(int key) {
    return HiveDatabase.checkIfKeyExistsInTypedBox<Config>(
      boxName: getBoxName(Config),
      key: key
    );
  }

  //App preferences functions
    //Getters
  static bool getFirstOpenValue() {
    return HiveDatabase.getTypedValueFromBox<bool>(
      boxName: StringsRepository.appPreferencesBoxName,
      key: StringsRepository.firstOpenKey,
      defaultValue: true
    );
  }

  static bool getConfigsExist() {
    return HiveDatabase.getTypedValueFromBox<bool>(
      boxName: StringsRepository.appPreferencesBoxName,
      key: StringsRepository.configsExistKey,
      defaultValue: false
    );
  }

  static int getDefaultConfigID() {
    return HiveDatabase.getTypedValueFromBox<int>(
      boxName: StringsRepository.appPreferencesBoxName,
      key: StringsRepository.defaultConfigIDKey,
      defaultValue: 100
    );
  }

  static String getSelectedLanguage() {
    if (HiveDatabase.checkIfKeyExistsInBox(
        boxName: StringsRepository.appPreferencesBoxName,
        key: StringsRepository.selectedLanguageKey)
    ) {
      return HiveDatabase.getTypedValueFromBox<String>(
        boxName: StringsRepository.appPreferencesBoxName,
        key: StringsRepository.selectedLanguageKey
      );
    }

    return getDefaultLanguageSelected();
  }

  static Settings getSettings() {
    if (HiveDatabase.checkIfKeyExistsInBox(
        boxName: StringsRepository.appPreferencesBoxName,
        key: StringsRepository.settingsKey)
    ) {
      return HiveDatabase.getTypedValueFromBox<Settings>(
        boxName: StringsRepository.appPreferencesBoxName,
        key: StringsRepository.settingsKey
      );
    }

    return getDefaultSettings();
  }

    //Setters
  static Future<void> setFirstOpenValue({bool value}) {
    return HiveDatabase.addValueWithKeyToBox(
      boxName: StringsRepository.appPreferencesBoxName,
      key: StringsRepository.firstOpenKey,
      value: value
    );
  }

  static Future<void> setConfigsExistValue({bool value}) {
    return HiveDatabase.addValueWithKeyToBox(
      boxName: StringsRepository.appPreferencesBoxName,
      key: StringsRepository.configsExistKey,
      value: value
    );
  }

  static Future<void> setDefaultConfigIDValue({int value}) {
    return HiveDatabase.addValueWithKeyToBox(
      boxName: StringsRepository.appPreferencesBoxName,
      key: StringsRepository.defaultConfigIDKey,
      value: value
    );
  }

  static Future<void> setDefaultLanguageValue({String value}) {
    return HiveDatabase.addValueWithKeyToBox(
      boxName: StringsRepository.appPreferencesBoxName,
      key: StringsRepository.selectedLanguageKey,
      value: value
    );
  }

  static Future<void> setSettingsValue({Settings value}) {
    return HiveDatabase.addObjectWithKeyToBox<Settings>(
      boxName: StringsRepository.appPreferencesBoxName,
      key: StringsRepository.settingsKey,
      value: value
    );
  }

    //Construct default Settings object and store it if no Settings found stored
  static Settings getDefaultSettings() {
    final Settings defaultSettings = Settings.defaultSettings;
    setSettingsValue(value: defaultSettings);
    return defaultSettings;
  }

    //sets default language as English and returns it as a default value
  static String getDefaultLanguageSelected() {
    const String languageSelected = "en";
    setDefaultLanguageValue(value: languageSelected);
    return languageSelected;
  }
}