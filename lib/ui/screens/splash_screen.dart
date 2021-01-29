import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:muslim_prayer_times/ui/screens/configs_screen.dart';
import 'package:muslim_prayer_times/ui/screens/home_screen.dart';
import 'package:muslim_prayer_times/ui/screens/intro_screen.dart';
import 'package:muslim_prayer_times/ui/constants/colors.dart';
import 'package:muslim_prayer_times/ui/constants/styles.dart';

class SplashScreen extends StatelessWidget {
  void checkIfFirstOpen(){
    Future.delayed(
      const Duration(seconds: 3),
      () async {
        final bool firstOpen = await Hive.box("AppPreferences").get("firstOpen", defaultValue: true) as bool;
        if (firstOpen) {
          Get.off(IntroScreen());
        } else {
          final bool configsExist = await Hive.box("AppPreferences").get("configsExist", defaultValue: false) as bool;
          if (configsExist) {
            Get.off(HomeScreen());
          } else {
           Get.off(ConfigsScreen());
          }
        }
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppStyles.defaultSystemUiOverlayStyle);
    checkIfFirstOpen();
    return Scaffold(
      backgroundColor: AppColors.primaryColorLight,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Image.asset(
                "assets/images/kaaba_logo_brown.png",
                width: Get.size.width * 0.50
              )
            ),
            const Text(
              "Muslim Prayer Times",
              style: TextStyle(
                fontFamily: "Pacifico",
                fontSize: 27.0,
                color: AppColors.primaryColorDark
              )
            )
          ]
        )
      )
    );
  }
}