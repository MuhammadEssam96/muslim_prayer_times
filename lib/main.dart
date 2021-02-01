import 'package:flutter/material.dart';
import 'package:muslim_prayer_times/app/muslim_prayer_times_app.dart';
import 'package:muslim_prayer_times/data/models/config_model.dart';
import 'package:muslim_prayer_times/data/models/location_model.dart';
import 'package:muslim_prayer_times/services/hive_database_service.dart';

Future<void> main() async {
  await HiveDatabaseService.initFlutter();

  HiveDatabaseService.registerAdapter<Config>(ConfigAdapter());
  HiveDatabaseService.registerAdapter<Location>(LocationAdapter());
  HiveDatabaseService.registerAdapter<ConfigMethod>(ConfigMethodAdapter());
  HiveDatabaseService.registerAdapter<ConfigSchool>(ConfigSchoolAdapter());

  await HiveDatabaseService.openAppPreferencesBox();
  await HiveDatabaseService.openConfigsBox();

  runApp(MuslimPrayerTimesApp());
}