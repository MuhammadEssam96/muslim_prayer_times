import 'package:get/get.dart';

import '../models/config_model.dart';
import '../models/notification_options_model.dart';
import '../models/settings_model.dart';
import '../services/hive_database_service.dart';

class SettingsController extends GetxController {
  final Rx<Settings> _settings = Rx<Settings>();
  Settings get settings => _settings.value ?? Settings.defaultSettings;
  set settings(Settings settings) => _settings.value = settings;

  final Rx<int> _defaultConfigId = Rx<int>();
  int get defaultConfigId => _defaultConfigId.value ?? settings.defaultConfigId;
  set defaultConfigId(int defaultConfigId) {
    _defaultConfigId.value = defaultConfigId;
    settings.defaultConfigId = defaultConfigId;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rx<Config> _defaultConfig = Rx<Config>();
  Config get defaultConfig {
    return _defaultConfig.value
        ?? _getDefaultConfigFromDatabase(defaultConfigId);
  }
  set defaultConfig(Config config) => _defaultConfig.value = config;

  final Rx<String> _languageSelected = Rx<String>();
  String get languageSelected {
    return _languageSelected.value ?? HiveDatabaseService.getSelectedLanguage();
  }
  set languageSelected(String languageSelected) {
    _languageSelected.value = languageSelected;
    settings.languageSelected = languageSelected;
    HiveDatabaseService.setSettingsValue(value: settings);
    HiveDatabaseService.setDefaultLanguageValue(value: languageSelected);
  }

  final Rx<List<bool>> _languagesList = Rx<List<bool>>();
  List<bool> get languagesList => _languagesList.value ?? _buildLanguagesList();
  void setLanguagesList(int index) {
    _languagesList.value = [
      if (index == 0) true else false,
      if (index == 1) true else false
    ];
    if (index == 0) languageSelected = "en";
    if (index == 1) languageSelected = "ar";
  }

  // ignore: lines_longer_than_80_chars
  final Rx<List<NotificationOptions>> _defaultNotificationsOptions = Rx<List<NotificationOptions>>();
  List<NotificationOptions> get defaultNotificationsOptions {
    return _defaultNotificationsOptions.value ?? settings.notificationSaved;
  }
  // ignore: lines_longer_than_80_chars
  set defaultNotificationsOptions(List<NotificationOptions> notificationsOptions) {
    _defaultNotificationsOptions.value = notificationsOptions;
    settings.notificationSaved = notificationsOptions;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rx<bool> _showSunriseTimeOption = Rx<bool>();
  bool get showSunriseTimeOption {
    return _showSunriseTimeOption.value ?? settings.showSunriseTime;
  }
  set showSunriseTimeOption(bool showSunriseTimeOption) {
    _showSunriseTimeOption.value = showSunriseTimeOption;
    settings.showSunriseTime = showSunriseTimeOption;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rx<bool> _showImsakTimeOption = Rx<bool>();
  bool get showImsakTimeOption {
    return _showImsakTimeOption.value ?? settings.showImsakTime;
  }
  set showImsakTimeOption(bool showImsakTimeOption) {
    _showImsakTimeOption.value = showImsakTimeOption;
    settings.showImsakTime = showImsakTimeOption;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rx<bool> _showMidnightTimeOption = Rx<bool>();
  bool get showMidnightTimeOption {
    return _showMidnightTimeOption.value ?? settings.showMidnightTime;
  }
  set showMidnightTimeOption(bool showMidnightTimeOption) {
    _showMidnightTimeOption.value = showMidnightTimeOption;
    settings.showMidnightTime = showMidnightTimeOption;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rx<bool> _darkModeOption = Rx<bool>();
  bool get darkModeOption => _darkModeOption.value ?? settings.darkMode;
  set darkModeOption(bool darkModeOption) {
    _darkModeOption.value = darkModeOption;
    settings.darkMode = darkModeOption;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  Config _getDefaultConfigFromDatabase(int id) {
    return HiveDatabaseService.getConfig(id);
  }

  List<bool> _buildLanguagesList() {
    return [languageSelected == "en", languageSelected == "ar"];
  }

  void changeDefaultNotificationOptionList({int index, bool value}) {
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