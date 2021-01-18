import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_prayer_times/ui/values/colors.dart';

class DefaultMaterialButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  const DefaultMaterialButton({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48,
      minWidth: Get.width * 0.50,
      color: AppColors.accentColorLight,
      onPressed: () => onPressed(),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColorDark
        ),
      ),
    );
  }
}