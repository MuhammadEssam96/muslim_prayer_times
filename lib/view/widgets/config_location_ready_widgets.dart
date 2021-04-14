import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/config_form_controller.dart';
import '../../models/location_model.dart';
import '../screens/get_location_screen.dart';
import 'material_button.dart';

class ConfigLocationReadyWidgets extends StatelessWidget {
  final Location location;
  const ConfigLocationReadyWidgets(this.location);

  @override
  Widget build(BuildContext context) {
    final configFormController = Get.find<ConfigFormController>();
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
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
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                const Text(
                  "Latitude: ",
                  style: TextStyle(fontSize: 16.0)
                ),
                Text(
                  location.latitude,
                  style: const TextStyle(fontSize: 16.0)
                )
              ]
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.baseline,
              children: [
                const Text(
                  "Longitude: ",
                  style: TextStyle(fontSize: 16.0),
                ),
                Text(
                  location.longitude,
                  style: const TextStyle(fontSize: 16.0),
                )
              ]
            ),
            const SizedBox(height: 8.0),
            DefaultMaterialButton(
              text: "Pick another location",
              onPressed: () {
                configFormController.location = Location(
                  city: "",
                  country: "",
                  longitude: "",
                  latitude: ""
                );

                configFormController.isLocationSet = false;
                Get.to(GetLocationScreen());
              }
            )
          ]
        ),
      )
    );
  }
}