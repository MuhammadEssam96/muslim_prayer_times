import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../services/hive_database_service.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import 'configs_screen.dart';
import 'home_screen.dart';
import 'intro_screen.dart';

//ignore_for_file: lines_longer_than_80_chars

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