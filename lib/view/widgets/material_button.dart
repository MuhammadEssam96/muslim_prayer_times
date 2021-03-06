import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/colors.dart';

class DefaultMaterialButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const DefaultMaterialButton({required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: 48.0,
      minWidth: Get.width * 0.50,
      color: AppColors.accentColorLight,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48.0)),
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.bold,
          color: AppColors.primaryColorDark
        )
      )
    );
  }
}