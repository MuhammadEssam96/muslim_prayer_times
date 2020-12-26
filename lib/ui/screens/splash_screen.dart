import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:muslim_prayer_times/ui/values/colors.dart';
import 'package:muslim_prayer_times/ui/values/styles.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(AppStyles.defaultSystemUiOverlayStyle);
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
                width: MediaQuery.of(context).size.width * 0.50,
              ),
            ),
            Text(
              "Muslim Prayer Times",
              style: TextStyle(
                fontFamily: "Pacifico",
                fontSize: 27,
                color: AppColors.primaryColorDark
              ),
            )
          ],
        ),
      ),
    );
  }
}
