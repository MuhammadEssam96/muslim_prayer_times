import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:muslim_prayer_times/ui/screens/home_screen.dart';
import 'package:muslim_prayer_times/ui/screens/intro_screen.dart';
import 'package:muslim_prayer_times/ui/screens/splash_screen.dart';
import 'package:muslim_prayer_times/ui/values/themes.dart';

class MuslimPrayerTimesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Muslim Prayer Times",
      debugShowCheckedModeBanner: false,
      theme: AppThemes.lightThemeData,
      home: SplashScreen(),
      routes: {
        "/Home" : (context) => HomeScreen(),
        "/Introduction" : (context) => IntroScreen()
      },
    );
  }
}
