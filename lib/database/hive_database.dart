import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';

class HiveDatabase {
  static Future<void> initFlutter() => Hive.initFlutter();

  static void registerAdapter<T>(TypeAdapter<T> adapter) {
    Hive.registerAdapter<T>(adapter);
  }

  //Open box functions
  static Future<void> openBox(String boxName) => Hive.openBox(boxName);
  static Future<void> openBoxWithType<T>(String boxName) {
    return Hive.openBox<T>(boxName);
  }

  //Get box functions
  static Box _getBox(String boxName) => Hive.box(boxName);
  static Box<T> _getBoxWithType<T>(String boxName) => Hive.box<T>(boxName);

  //Get value functions
  static dynamic? getValueFromBox({
    required String boxName,
    required String key,
    dynamic defaultValue
  }) {
    return _getBox(boxName).get(key, defaultValue: defaultValue);
  }

  static T getTypedValueFromBox<T>({
    required String boxName,
    required String key,
    required T defaultValue
  }) {
    return _getBox(boxName).get(key, defaultValue: defaultValue) as T;
  }

  static T? getTypedValueFromTypedBox<T>({
    required String boxName,
    required String key,
    required T defaultValue
  }) {
    return _getBoxWithType<T>(boxName).get(key, defaultValue: defaultValue);
  }

  static T? getTypedValueFromTypedBoxWithIntKey<T>({
    required String boxName,
    required int key,
    required T? defaultValue
  }) {
    return _getBoxWithType<T>(boxName).get(key, defaultValue: defaultValue);
  }

  //Get All values functions
  static List getAllValuesFromBox(String boxName) {
    return _getBox(boxName).values.toList();
  }

  static List<T> getAllObjectsFromTypedBox<T>(String boxName) {
    return _getBoxWithType<T>(boxName).values.toList();
  }

  //Add value functions
  static Future<void> addObjectToBox<T>({
    required String boxName,
    required T value
  }) {
    return _getBoxWithType<T>(boxName).add(value);
  }

  static Future<void> addValueToBox({
    required String boxName,
    dynamic value
  }) {
    return _getBox(boxName).add(value);
  }

  static Future<void> addValueWithKeyToBox({
    required String boxName,
    required String key,
    dynamic value
  }) {
    return _getBox(boxName).put(key, value);
  }

  static Future<void> addObjectWithKeyToBox<T>({
    required String boxName,
    required String key,
    required T value
  }) {
    return _getBox(boxName).put(key, value);
  }

  //Add all values functions
  static Future<void> addAllObjectsToBox<T>({
    required String boxName,
    required List<T> values
  }) {
    return _getBoxWithType<T>(boxName).addAll(values);
  }

  static Future<void> addAllObjectsWithKeysToBox<T>({
    required String boxName,
    required Map<int, T> values
  }) {
    return _getBoxWithType<T>(boxName).putAll(values);
  }

  static Future<void> addAllValuesToBox({
    required String boxName,
    required List<dynamic> values
  }) {
    return _getBox(boxName).addAll(values);
  }

  //Delete value functions
  static Future<void> deleteValueFromBox({
    required String boxName,
    required String key
  }) {
    return _getBox(boxName).delete(key);
  }

  //Delete all values functions
  static Future<void> deleteAllObjectsFromBox<T>(String boxName) {
    return _getBoxWithType<T>(boxName).clear();
  }

  static Future<void> deleteAllValuesFromBox(String boxName) {
    return _getBox(boxName).clear();
  }

  //Check if keys exists
  static bool checkIfKeyExistsInBox({
    required String boxName,
    required String key
  }) {
    return _getBox(boxName).containsKey(key);
  }

  static bool checkIfKeyExistsInTypedBox<T>({
    required String boxName,
    required int key
  }) {
    return _getBoxWithType<T>(boxName).containsKey(key);
  }
}