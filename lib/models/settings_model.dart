import 'package:hive/hive.dart';

import '../services/hive_database_service.dart';
import 'notification_options_model.dart';

part 'generated/settings_model.g.dart';

@HiveType(typeId: 4)
class Settings {
  @HiveField(0)
  int defaultConfigId;

  @HiveField(1)
  String languageSelected;

  @HiveField(2)
  List<NotificationOptions> notificationSaved;

  @HiveField(3)
  bool showSunriseTime;

  @HiveField(4)
  bool showImsakTime;

  @HiveField(5)
  bool showMidnightTime;

  @HiveField(6)
  bool darkMode;

  Settings({
    this.defaultConfigId,
    this.languageSelected,
    this.notificationSaved,
    this.showSunriseTime,
    this.showImsakTime,
    this.showMidnightTime,
    this.darkMode
  });

  static Settings defaultSettings = Settings(
    defaultConfigId: HiveDatabaseService.getDefaultConfigID(),
    languageSelected: HiveDatabaseService.getSelectedLanguage(),
    notificationSaved: NotificationOptions.defaultNotificationOptions,
    showSunriseTime: true,
    showImsakTime: true,
    showMidnightTime: true,
    darkMode: false
  );
}