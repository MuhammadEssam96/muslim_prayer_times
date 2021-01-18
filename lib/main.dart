import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_prayer_times/app/muslim_prayer_times_app.dart';
import 'package:muslim_prayer_times/data/models/config_model.dart';
import 'package:muslim_prayer_times/data/models/location_model.dart';

Future<void> main() async {
  await Hive.initFlutter();
  await Hive.openBox("AppPreferences");
  await Hive.openBox("Configs");

  Hive.registerAdapter(ConfigAdapter());
  Hive.registerAdapter(LocationAdapter());

  runApp(MuslimPrayerTimesApp());
}