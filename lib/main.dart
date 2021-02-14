import 'package:flutter/material.dart';
import 'package:muslim_prayer_times/app/muslim_prayer_times_app.dart';
import 'package:muslim_prayer_times/models/config_model.dart';
import 'package:muslim_prayer_times/models/location_model.dart';
import 'package:muslim_prayer_times/models/notification_options_model.dart';
import 'package:muslim_prayer_times/models/settings_model.dart';
import 'package:muslim_prayer_times/models/prayer_enum_model.dart';
import 'package:muslim_prayer_times/services/hive_database_service.dart';

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