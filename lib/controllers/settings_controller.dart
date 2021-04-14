import 'package:get/get.dart';

import '../models/config_model.dart';
import '../models/notification_options_model.dart';
import '../models/settings_model.dart';
import '../services/hive_database_service.dart';

class SettingsController extends GetxController {
  final Rx<Settings> _settings = Rx<Settings>(Settings.defaultSettings);
  Settings get settings => _settings.value;
  set settings(Settings settings) => _settings.value = settings;

  final Rxn<int> _defaultConfigId = Rxn<int>();
  int get defaultConfigId => _defaultConfigId.value ?? settings.defaultConfigId;
  set defaultConfigId(int defaultConfigId) {
    _defaultConfigId.value = defaultConfigId;
    settings.defaultConfigId = defaultConfigId;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rxn<Config> _defaultConfig = Rxn<Config>();
  Config get defaultConfig {
    return _defaultConfig.value
        ?? _getDefaultConfigFromDatabase(defaultConfigId);
  }
  set defaultConfig(Config config) => _defaultConfig.value = config;

  final Rx<String> _languageSelected = Rx<String>(HiveDatabaseService.getSelectedLanguage());
  String get languageSelected => _languageSelected.value;
  set languageSelected(String languageSelected) {
    _languageSelected.value = languageSelected;
    settings.languageSelected = languageSelected;
    HiveDatabaseService.setSettingsValue(value: settings);
    HiveDatabaseService.setDefaultLanguageValue(value: languageSelected);
  }

  final Rxn<List<bool>> _languagesList = Rxn<List<bool>>();
  List<bool> get languagesList => _languagesList.value ?? _buildLanguagesList();
  void setLanguagesList(int index) {
    _languagesList.value = [
      if (index == 0) true else false,
      if (index == 1) true else false
    ];
    if (index == 0) languageSelected = "en";
    if (index == 1) languageSelected = "ar";
  }

  final Rxn<List<NotificationOptions>> _defaultNotificationsOptions = Rxn<List<NotificationOptions>>();
  List<NotificationOptions> get defaultNotificationsOptions {
    return _defaultNotificationsOptions.value ?? settings.notificationSaved;
  }
  set defaultNotificationsOptions(List<NotificationOptions> notificationsOptions) {
    _defaultNotificationsOptions.value = notificationsOptions;
    settings.notificationSaved = notificationsOptions;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rxn<bool> _showSunriseTimeOption = Rxn<bool>();
  bool get showSunriseTimeOption {
    return _showSunriseTimeOption.value ?? settings.showSunriseTime;
  }
  set showSunriseTimeOption(bool showSunriseTimeOption) {
    _showSunriseTimeOption.value = showSunriseTimeOption;
    settings.showSunriseTime = showSunriseTimeOption;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rxn<bool> _showImsakTimeOption = Rxn<bool>();
  bool get showImsakTimeOption {
    return _showImsakTimeOption.value ?? settings.showImsakTime;
  }
  set showImsakTimeOption(bool showImsakTimeOption) {
    _showImsakTimeOption.value = showImsakTimeOption;
    settings.showImsakTime = showImsakTimeOption;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rxn<bool> _showMidnightTimeOption = Rxn<bool>();
  bool get showMidnightTimeOption {
    return _showMidnightTimeOption.value ?? settings.showMidnightTime;
  }
  set showMidnightTimeOption(bool showMidnightTimeOption) {
    _showMidnightTimeOption.value = showMidnightTimeOption;
    settings.showMidnightTime = showMidnightTimeOption;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rxn<bool> _darkModeOption = Rxn<bool>();
  bool get darkModeOption => _darkModeOption.value ?? settings.darkMode;
  set darkModeOption(bool darkModeOption) {
    _darkModeOption.value = darkModeOption;
    settings.darkMode = darkModeOption;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  Config _getDefaultConfigFromDatabase(int id) {
    return HiveDatabaseService.getConfig(id)!;
  }

  List<bool> _buildLanguagesList() {
    return [languageSelected == "en", languageSelected == "ar"];
  }

  void changeDefaultNotificationOptionList({
    required int index,
    required bool value
  }) {
    final List<NotificationOptions> newList = [];
    for (final notificationOption in defaultNotificationsOptions) {
      if (index == defaultNotificationsOptions.indexOf(notificationOption)) {
        newList.add(
          NotificationOptions(
            prayer: notificationOption.prayer,
            timeDifference: notificationOption.timeDifference,
            isEnabled: value
          )
        );
      } else {
        newList.add(notificationOption);
      }
    }
    defaultNotificationsOptions = newList;
  }

  @override
  void onInit() {
    settings = HiveDatabaseService.getSettings();
    super.onInit();
  }
}