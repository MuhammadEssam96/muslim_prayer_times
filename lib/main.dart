import 'package:flutter/material.dart';

import 'app/muslim_prayer_times_app.dart';
import 'models/config_model.dart';
import 'models/location_model.dart';
import 'models/notification_options_model.dart';
import 'models/prayer_enum_model.dart';
import 'models/settings_model.dart';
import 'services/hive_database_service.dart';

//ignore_for_file: lines_longer_than_80_chars

Future<void> main() async {
  await HiveDatabaseService.initFlutter();

  HiveDatabaseService.registerAdapter<Config>(ConfigAdapter());
  HiveDatabaseService.registerAdapter<Location>(LocationAdapter());
  HiveDatabaseService.registerAdapter<ConfigSchool>(ConfigSchoolAdapter());
  HiveDatabaseService.registerAdapter<ConfigMethod>(ConfigMethodAdapter());
  HiveDatabaseService.registerAdapter<Settings>(SettingsAdapter());
  HiveDatabaseService.registerAdapter<NotificationOptions>(NotificationOptionsAdapter());
  HiveDatabaseService.registerAdapter<Prayer>(PrayerAdapter());

  await HiveDatabaseService.openAppPreferencesBox();
  await HiveDatabaseService.openConfigsBox();

  runApp(MuslimPrayerTimesApp());
}