import 'dart:io' show Platform;
import 'package:flutter/material.dart';
import 'package:muslim_prayer_times/ui/constants/colors.dart';

class DefaultAppBar {
  static AppBar appBar({String title}){
    return AppBar(
      backgroundColor: AppColors.primaryColorLight,
      elevation: 0.0,
      brightness: Brightness.light,
      title: Text(
        title,
        style: const TextStyle(color: AppColors.primaryColorDark),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.primaryColorDark)
    );
  }

  static AppBar appBarWithBackButton({String title, Function onBackButtonPressed}){
    return AppBar(
      backgroundColor: AppColors.primaryColorLight,
      elevation: 0.0,
      brightness: Brightness.light,
      title: Text(
        title,
        style: const TextStyle(color: AppColors.primaryColorDark),
      ),
      centerTitle: true,
      iconTheme: const IconThemeData(color: AppColors.primaryColorDark),
      leading: IconButton(
        icon: Icon(Platform.isIOS ? Icons.arrow_back_ios : Icons.arrow_back),
        onPressed: () => onBackButtonPressed(),
      ),
    );
  }
}