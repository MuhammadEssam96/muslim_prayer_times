import 'package:get/get.dart';
import 'package:muslim_prayer_times/data/models/config_model.dart';
import 'package:muslim_prayer_times/data/models/notification_options_model.dart';
import 'package:muslim_prayer_times/data/models/settings_model.dart';
import 'package:muslim_prayer_times/services/hive_database_service.dart';

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
  Config get defaultConfig => _defaultConfig.value ?? _getDefaultConfigFromDatabase(defaultConfigId);
  set defaultConfig(Config config) => _defaultConfig.value = config;

  final Rx<String> _languageSelected = Rx<String>();
  String get languageSelected => _languageSelected.value ?? HiveDatabaseService.getSelectedLanguage();
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

  final Rx<List<NotificationOptions>> _defaultNotificationsOptions = Rx<List<NotificationOptions>>();
  List<NotificationOptions> get defaultNotificationsOptions => _defaultNotificationsOptions.value ?? settings.notificationSaved;
  set defaultNotificationsOptions(List<NotificationOptions> notificationsOptions) {
    _defaultNotificationsOptions.value = notificationsOptions;
    settings.notificationSaved = notificationsOptions;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rx<bool> _showSunriseTimeOption = Rx<bool>();
  bool get showSunriseTimeOption => _showSunriseTimeOption.value ?? settings.showSunriseTime;
  set showSunriseTimeOption(bool showSunriseTimeOption) {
    _showSunriseTimeOption.value = showSunriseTimeOption;
    settings.showSunriseTime = showSunriseTimeOption;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rx<bool> _showImsakTimeOption = Rx<bool>();
  bool get showImsakTimeOption => _showImsakTimeOption.value ?? settings.showImsakTime;
  set showImsakTimeOption(bool showImsakTimeOption) {
    _showImsakTimeOption.value = showImsakTimeOption;
    settings.showImsakTime = showImsakTimeOption;
    HiveDatabaseService.setSettingsValue(value: settings);
  }

  final Rx<bool> _showMidnightTimeOption = Rx<bool>();
  bool get showMidnightTimeOption => _showMidnightTimeOption.value ?? settings.showMidnightTime;
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

  Config _getDefaultConfigFromDatabase(int id) => HiveDatabaseService.getConfig(id);
  List<bool> _buildLanguagesList() => [languageSelected == "en", languageSelected == "ar"];

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