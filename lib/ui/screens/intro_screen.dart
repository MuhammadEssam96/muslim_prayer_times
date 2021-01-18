import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:muslim_prayer_times/ui/screens/configs_screen.dart';
import 'package:muslim_prayer_times/ui/values/colors.dart';

class IntroScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const pageDecoration = PageDecoration(
      titleTextStyle: TextStyle(
        fontSize: 28.0,
        fontWeight: FontWeight.w700
      ),
      bodyTextStyle: TextStyle(fontSize: 19.0),
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0),
      pageColor: AppColors.primaryColorLight,
      imagePadding: EdgeInsets.only(top: 24),
    );

    return IntroductionScreen(
      globalBackgroundColor: AppColors.primaryColorLight,
      pages: [
        PageViewModel(
          title: "Prayer Times",
          body: "Get updated and detailed prayer times based on your current or custom location!",
          image: Image.asset(
            "assets/images/clock.png",
            width: MediaQuery.of(context).size.width * 0.50,
          ),
          decoration: pageDecoration
        ),
        PageViewModel(
          title: "Qibla Direction",
          body: "Get exact Qibla direction based on your current or custom location!",
          image: Image.asset(
            "assets/images/compass.png",
            width: MediaQuery.of(context).size.width * 0.50,
          ),
          decoration: pageDecoration
        ),
        PageViewModel(
          title: "Custom Configurations",
          body: "You can also set custom configurations and add multiple locations, calculation methods...etc",
          image: Image.asset(
            "assets/images/loading.png",
            width: MediaQuery.of(context).size.width * 0.50,
          ),
          decoration: pageDecoration
        )
      ],
      done: const Text("Done"),
      next: const Icon(Icons.arrow_forward),
      skip: const Text("Skip"),
      showSkipButton: true,
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Color(0xFFBDBDBD),
        activeColor: AppColors.primaryColorDark,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      onDone: () async {
        await Hive.box("AppPreferences").put("firstOpen", false);
        Get.off(ConfigsScreen());
      },
    );
  }
}