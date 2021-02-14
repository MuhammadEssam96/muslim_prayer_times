import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_prayer_times/view/constants/colors.dart';
import 'package:muslim_prayer_times/view/screens/settings_screen.dart';

class DefaultAppBar {
  static AppBar appBar({String title}){
    return AppBar(
      backgroundColor: AppColors.primaryColorLight,
      elevation: 0.0,
      brightness: Brightness.light,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primaryColorDark,
          fontFamily: "Pacifico"
        )
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.primaryColorDark)
    );
  }

  static AppBar appBarWithBackButton({String title, VoidCallback onBackButtonPressed}){
    return AppBar(
      backgroundColor: AppColors.primaryColorLight,
      elevation: 0.0,
      brightness: Brightness.light,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primaryColorDark,
          fontFamily: "Pacifico"
        )
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.primaryColorDark),
      leading: IconButton(
        icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
        onPressed: onBackButtonPressed
      )
    );
  }

  static AppBar appBarWithSettingsIcon({String title}){
    return AppBar(
      backgroundColor: AppColors.primaryColorLight,
      elevation: 0.0,
      brightness: Brightness.light,
      title: Text(
        title,
        style: const TextStyle(
          color: AppColors.primaryColorDark,
          fontFamily: "Pacifico"
        )
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.primaryColorDark),
      actions: [
        IconButton(
          icon: const Icon(Icons.settings),
          onPressed: () => Get.to(SettingsScreen())
        )
      ]
    );
  }
}