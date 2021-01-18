import 'package:flutter/material.dart';
import 'package:muslim_prayer_times/ui/values/colors.dart';

class DefaultAppBar {
  static AppBar appBar(String title){
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
}