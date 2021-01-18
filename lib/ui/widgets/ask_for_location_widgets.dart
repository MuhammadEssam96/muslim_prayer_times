import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_prayer_times/ui/screens/set_location_automatically_screen.dart';
import 'package:muslim_prayer_times/ui/widgets/material_button.dart';

class AskUserForLocationWidgets extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DefaultMaterialButton(
          text: "Get Location Automatically",
          onPressed: () => Get.to(SetLocationAutomaticallyScreen())
        ),
        const SizedBox(height: 16.0),
        const Text(
          "Or",
          style: TextStyle(fontSize: 20.0)
        ),
        const SizedBox(height: 16.0),
        DefaultMaterialButton(
          text: "Enter Location Manually",
          onPressed: () {

          }
        )
      ]
    );
  }
}