import 'package:hive/hive.dart' show TypeAdapter;
import 'package:muslim_prayer_times/data/database/hive_database.dart';
import 'package:muslim_prayer_times/data/models/config_model.dart';
import 'package:muslim_prayer_times/ui/constants/strings.dart';

class HiveDatabaseService {
  //Get box name based on Object type
  static String getBoxName(dynamic object) => Strings.boxNames[object];

  static Future<void> initFlutter() => HiveDatabase.initFlutter();
  static void registerAdapter<T>(TypeAdapter<T> adapter) => HiveDatabase.registerAdapter<T>(adapter);

  //Open box functions
  static Future<void> openAppPreferencesBox() => HiveDatabase.openBox(Strings.appPreferencesBoxName);
  static Future<void> openConfigsBox() => HiveDatabase.openBoxWithType<Config>(getBoxName(Config));

  //Configs functions
    //Gets all configs from Hive database
  static List<Config> getAllConfigs() => HiveDatabase.getAllValuesFromTypedBox<Config>(getBoxName(Config));

    //Add new config to Hive database
  static Future<void> addConfig(Config config) => HiveDatabase.addObjectToBox<Config>(boxName: getBoxName(Config), value: config);

    //Add a list of Configs to Hive database
  static Future<void> addAllConfigs(List<Config> configs) => HiveDatabase.addAllObjectsToBox<Config>(boxName: getBoxName(Config), values: configs);

    //Add a map of Configs with keys in Hive database
  static Future<void> addAllConfigsWithKeys(Map<int, Config> configs) => HiveDatabase.addAllObjectsWithKeysToBox<Config>(boxName: getBoxName(Config), values: configs);

    //Deletes all configs from Hive database
  static Future<void> deleteAllConfigs() => HiveDatabase.deleteAllObjectsFromBox<Config>(getBoxName(Config));

    //Check if key exists in Hive database
  static bool checkIfKeyExistsInConfigs(int key) => HiveDatabase.checkIfKeyExistsInTypedBox<Config>(boxName: getBoxName(Config), key: key);

  //App preferences functions
    //Getters
  static bool getFirstOpenValue() => HiveDatabase.getTypedValueFromBox<bool>(boxName: Strings.appPreferencesBoxName, key: Strings.firstOpenKey, defaultValue: true);
  static bool getConfigsExist() => HiveDatabase.getTypedValueFromBox<bool>(boxName: Strings.appPreferencesBoxName, key: Strings.configsExistKey, defaultValue: false);
  static int getDefaultConfigID() => HiveDatabase.getTypedValueFromBox<int>(boxName: Strings.appPreferencesBoxName, key: Strings.defaultConfigIDKey, defaultValue: 100);

    //Setters
  static Future<void> setFirstOpenValue({bool value}) => HiveDatabase.addValueWithKeyToBox(boxName: Strings.appPreferencesBoxName, key: Strings.firstOpenKey, value: value);
  static Future<void> setConfigsExistValue({bool value}) => HiveDatabase.addValueWithKeyToBox(boxName: Strings.appPreferencesBoxName, key: Strings.configsExistKey, value: value);
  static Future<void> setDefaultConfigIDValue({int value}) => HiveDatabase.addValueWithKeyToBox(boxName: Strings.appPreferencesBoxName, key: Strings.defaultConfigIDKey, value: value);
}