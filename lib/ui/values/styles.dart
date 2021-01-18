import 'package:flutter/services.dart';
import 'package:muslim_prayer_times/ui/values/colors.dart';

class AppStyles {
  static const SystemUiOverlayStyle defaultSystemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColorLight,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.primaryColorLight,
    systemNavigationBarIconBrightness: Brightness.light
  );
}