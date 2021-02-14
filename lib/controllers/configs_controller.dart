import 'dart:math';
import 'package:get/get.dart';
import 'package:muslim_prayer_times/controllers/settings_controller.dart';
import 'package:muslim_prayer_times/services/hive_database_service.dart';
import 'package:muslim_prayer_times/data/models/config_model.dart';

class ConfigsController extends GetxController {
  final List<Config> configsList = <Config>[].obs;

  Future<void> addConfig(Config config) async {
    configsList.add(config);

    final Map<int, Config> configs = {};

    for (final Config config in configsList){
      configs[config.id] = config;
    }

    await HiveDatabaseService.deleteAllConfigs();
    await HiveDatabaseService.addAllConfigsWithKeys(configs);
    if (config.isDefault) await HiveDatabaseService.setDefaultConfigIDValue(value: config.id);
    if (configsList.length == 1) await HiveDatabaseService.setConfigsExistValue(value: true);
  }

  Future<void> editConfig({Config oldConfig, Config newConfig}) async {
    configsList[configsList.indexOf(oldConfig)] = newConfig;

    final Map<int, Config> configs = {};

    for (final Config config in configsList){
      configs[config.id] = config;
    }

    await HiveDatabaseService.deleteAllConfigs();
    await HiveDatabaseService.addAllConfigsWithKeys(configs);
    if (newConfig.isDefault) Get.put(SettingsController()).defaultConfig = newConfig;
  }

  Future<void> deleteConfig(Config config) async {
    configsList.remove(config);

    final Map<int, Config> configs = {};

    for (final Config config in configsList){
      configs[config.id] = config;
    }
    
    await HiveDatabaseService.deleteAllConfigs();
    await HiveDatabaseService.addAllConfigsWithKeys(configs);
  }

  Future<void> setConfigAsDefault(Config config) async {
    final List<Config> newList = [];

    for (final Config configElement in configsList){
      newList.add(Config(
        id: configElement.id,
        location: configElement.location,
        method: configElement.method,
        school: configElement.school,
        name: configElement.name,
        isDefault: configElement.id == config.id
      ));
      final Config currentConfig = newList[configsList.indexOf(configElement)];
      if (currentConfig.isDefault) {
        await HiveDatabaseService.setDefaultConfigIDValue(value: currentConfig.id);
        Get.put(SettingsController()).defaultConfigId = currentConfig.id;
      }
    }

    configsList.clear();
    configsList.addAll(newList);

    final Map<int, Config> configs = {};

    for (final Config config in configsList){
      configs[config.id] = config;
    }

    await HiveDatabaseService.deleteAllConfigs();
    await HiveDatabaseService.addAllConfigsWithKeys(configs);
  }

  bool checkIfNameExists(String name) => configsList.any((configElement) => configElement.name == name);

  int getValidUniqueID() {
    int randomNumber = Random().nextInt(99);

    while (HiveDatabaseService.checkIfKeyExistsInConfigs(randomNumber)) {
      randomNumber = Random().nextInt(99);
    }

    return randomNumber;
  }

  @override
  void onInit() {
    final List<Config> storedConfigs = HiveDatabaseService.getAllConfigs() ?? [];
    configsList.addAll(storedConfigs);
    super.onInit();
  }
}