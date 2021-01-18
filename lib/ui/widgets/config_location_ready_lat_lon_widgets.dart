import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_prayer_times/controllers/config_form_controller.dart';
import 'package:muslim_prayer_times/controllers/location_controller.dart';
import 'package:muslim_prayer_times/data/models/location_model.dart';
import 'package:muslim_prayer_times/ui/widgets/material_button.dart';

class ConfigLocationReadyLatLonWidgets extends StatelessWidget {
  final Location location;

  const ConfigLocationReadyLatLonWidgets(this.location);

  @override
  Widget build(BuildContext context) {
    final configFormController = Get.find<ConfigFormController>();

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Latitude:",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              location.latitude.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              "Longitude:",
              style: TextStyle(
                fontSize: 20,
              ),
            ),
            Text(
              location.longitude.toString(),
              style: const TextStyle(
                fontSize: 20,
              ),
            ),
          ],
        ),
        const SizedBox(height: 16.0,),
        DefaultMaterialButton(
          text: "Pick another location",
          onPressed: () {
            configFormController.location = Location(city: "", country: "");
            configFormController.isLocationSet = false;

          },
        )
      ],
    );
  }
}