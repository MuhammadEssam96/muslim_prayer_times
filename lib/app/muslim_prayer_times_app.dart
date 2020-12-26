import 'package:flutter/material.dart';
import 'package:muslim_prayer_times/ui/screens/home_screen.dart';
import 'package:muslim_prayer_times/ui/screens/splash_screen.dart';
import 'package:muslim_prayer_times/ui/values/themes.dart';

class MuslimPrayerTimesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Muslim Prayer Times",
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightThemeData,
      home: SplashScreen(),
      routes: {
        "/Home" : (context) => HomeScreen()
      },
    );
  }
}
