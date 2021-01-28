import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:muslim_prayer_times/data/models/config_model.dart';

class ConfigsController extends GetxController {
  final List<Config> configsList = <Config>[].obs;

  Future<void> addConfig(Config config) async {
    configsList.add(config);
    await Hive.box<Config>("Configs").add(config);
  }

  Future<void> editConfig({Config oldConfig, Config newConfig}) async {
    configsList[configsList.indexOf(oldConfig)] = newConfig;
    await Hive.box<Config>("Configs").clear();
    await Hive.box<Config>("Configs").addAll(configsList);
  }

  Future<void> deleteConfig(Config config) async {
    configsList.remove(config);
    await Hive.box<Config>("Configs").clear();
    await Hive.box<Config>("Configs").addAll(configsList);
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

    await Hive.box<Config>("Configs").clear();
    await Hive.box<Config>("Configs").addAll(configsList);
  }

  bool checkIfNameExists(String name) => configsList.any((configElement) => configElement.name == name);

  @override
  void onInit() {
    final List<Config> storedConfigs = Hive.box<Config>("Configs").values.toList() ?? [];
    configsList.addAll(storedConfigs);
    super.onInit();
  }
}