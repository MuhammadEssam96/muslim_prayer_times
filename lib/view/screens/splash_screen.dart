import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:muslim_prayer_times/services/hive_database_service.dart';
import 'package:muslim_prayer_times/view/screens/configs_screen.dart';
import 'package:muslim_prayer_times/view/screens/home_screen.dart';
import 'package:muslim_prayer_times/view/screens/intro_screen.dart';
import 'package:muslim_prayer_times/view/constants/colors.dart';
import 'package:muslim_prayer_times/view/constants/styles.dart';

class SplashScreen extends StatelessWidget {
  void checkIfFirstOpen(){
    Future.delayed(
      const Duration(seconds: 3),
      () {
        final bool firstOpen = HiveDatabaseService.getFirstOpenValue();
        if (firstOpen) {
          Get.off(IntroScreen());
        } else {
          final bool configsExist = HiveDatabaseService.getConfigsExist();
          if (configsExist) {
            Get.offAll(HomeScreen());
          } else {
            Get.offAll(ConfigsScreen(), arguments: {"configsExist" : configsExist});
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