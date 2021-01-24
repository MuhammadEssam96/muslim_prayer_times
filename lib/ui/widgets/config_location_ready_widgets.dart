import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_prayer_times/controllers/config_form_controller.dart';
import 'package:muslim_prayer_times/data/models/location_model.dart';
import 'package:muslim_prayer_times/ui/screens/get_location_screen.dart';
import 'package:muslim_prayer_times/ui/widgets/material_button.dart';

class ConfigLocationReadyWidgets extends StatelessWidget {
  final Location location;

  const ConfigLocationReadyWidgets(this.location);

  @override
  Widget build(BuildContext context) {
    final configFormController = Get.find<ConfigFormController>();
    return Column(
      children: [
        Text(
          location.city,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          )
        ),
        Text(
          location.country,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold
          )
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Latitude:",
              style: TextStyle(fontSize: 20.0)
            ),
            Text(
              location.latitude,
              style: const TextStyle(fontSize: 20.0)
            )
          ]
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Longitude:",
              style: TextStyle(fontSize: 20.0)
            ),
            Text(
              location.longitude,
              style: const TextStyle(fontSize: 20.0)
            )
          ]
        ),
        const SizedBox(height: 16.0),
        DefaultMaterialButton(
          text: "Pick another location",
          onPressed: () {
            configFormController.location = Location(city: "", country: "", longitude: "", latitude: "");
            configFormController.isLocationSet = false;
            Get.to(GetLocationScreen());
          }
        )
      ]
    );
  }
}