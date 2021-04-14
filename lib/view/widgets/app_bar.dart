import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';
import '../screens/settings_screen.dart';

class DefaultAppBar {
  static AppBar appBar({required String title}){
    return AppBar(
      backgroundColor: AppColors.primaryColorLight,

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

  static AppBar appBarWithBackButton({
    required String title,
    required VoidCallback onBackButtonPressed
  }){
    return AppBar(
      backgroundColor: AppColors.primaryColorLight,

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

  static AppBar homeScreenAppBar({required String title}){
    return AppBar(
      backgroundColor: AppColors.primaryColorLight,

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