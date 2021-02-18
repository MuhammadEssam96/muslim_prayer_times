import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import '../view/constants/themes.dart' as app_themes;
import '../view/screens/home_screen.dart';
import '../view/screens/intro_screen.dart';
import '../view/screens/splash_screen.dart';

class MuslimPrayerTimesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => GetMaterialApp(
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