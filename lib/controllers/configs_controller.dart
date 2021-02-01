import 'package:get/get.dart';
import 'package:muslim_prayer_times/services/hive_database_service.dart';
import 'package:muslim_prayer_times/data/models/config_model.dart';

class ConfigsController extends GetxController {
  final List<Config> configsList = <Config>[].obs;

  Future<void> addConfig(Config config) async {
    configsList.add(config);
    await HiveDatabaseService.addConfig(config);
  }

  Future<void> editConfig({Config oldConfig, Config newConfig}) async {
    configsList[configsList.indexOf(oldConfig)] = newConfig;
    await HiveDatabaseService.deleteAllConfigs();
    await HiveDatabaseService.addAllConfigs(configsList);
  }

  Future<void> deleteConfig(Config config) async {
    configsList.remove(config);
    await HiveDatabaseService.deleteAllConfigs();
    await HiveDatabaseService.addAllConfigs(configsList);
  }

  Future<void> setConfigAsDefault(Config config) async {
    final List<Config> newList = [];

    for (final Config configElement in configsList){
      if (configElement.id == config.id) {
        newList.add(Config(
          id: configElement.id,
          location: configElement.location,
          method: configElement.method,
          school: configElement.school,
          name: configElement.name,
          isDefault: true
        ));
      } else {
        newList.add(Config(
          id: configElement.id,
          location: configElement.location,
          method: configElement.method,
          school: configElement.school,
          name: configElement.name,
          isDefault: false
        ));
      }
    }

    configsList.clear();
    configsList.addAll(newList);

    await HiveDatabaseService.deleteAllConfigs();
    await HiveDatabaseService.addAllConfigs(configsList);
  }

  bool checkIfNameExists(String name) => configsList.any((configElement) => configElement.name == name);

  @override
  void onInit() {
    final List<Config> storedConfigs = HiveDatabaseService.getAllConfigs() ?? [];
    configsList.addAll(storedConfigs);
    super.onInit();
  }
}