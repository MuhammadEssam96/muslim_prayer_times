import 'package:flutter/material.dart';
import 'package:muslim_prayer_times/ui/constants/colors.dart';
import 'package:muslim_prayer_times/ui/widgets/app_bar.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar.appBarWithSettingsIcon(title: "Muslim Prayer Times"),
      backgroundColor: AppColors.primaryColorLight,
    );
  }
}