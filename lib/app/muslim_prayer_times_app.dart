import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:muslim_prayer_times/view/screens/home_screen.dart';
import 'package:muslim_prayer_times/view/screens/intro_screen.dart';
import 'package:muslim_prayer_times/view/screens/splash_screen.dart';
import 'package:muslim_prayer_times/view/constants/themes.dart' as app_themes;

class MuslimPrayerTimesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Muslim Prayer Times",
      debugShowCheckedModeBanner: false,
      theme: app_themes.lightThemeData,
      home: SplashScreen(),
      routes: {
        "/Home" : (context) => HomeScreen(),
        "/Introduction" : (context) => IntroScreen()
      }
    );
  }
}