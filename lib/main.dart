import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:muslim_prayer_times/app/muslim_prayer_times_app.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("AppPreferences");
  runApp(MuslimPrayerTimesApp());
}