import 'package:flutter/services.dart';

import 'colors.dart';

class AppStyles {
  // ignore: lines_longer_than_80_chars
  static const SystemUiOverlayStyle defaultSystemUiOverlayStyle = SystemUiOverlayStyle(
    statusBarColor: AppColors.primaryColorLight,
    statusBarIconBrightness: Brightness.dark,
    systemNavigationBarColor: AppColors.primaryColorLight,
    systemNavigationBarIconBrightness: Brightness.light
  );
}