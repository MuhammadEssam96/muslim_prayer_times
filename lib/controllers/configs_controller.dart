import 'package:get/get.dart';
import 'package:muslim_prayer_times/data/models/config_model.dart';

class ConfigsController extends GetxController {
  final configsList = <Config>[].obs;

  void addConfig(){

  }

  void editConfig(Config config, int id){

  }

  void deleteConfig(){

  }

  // @override
  // void onInit() {
  //   final storedConfigs = Hive.box("Configs").values as List<Config> ?? [];
  //   configsList.addAll(storedConfigs);
  //   super.onInit();
  // }
}