import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' show LocationData;
import 'package:muslim_prayer_times/controllers/location_controller.dart';
import 'package:muslim_prayer_times/data/models/location_model.dart';
import 'package:muslim_prayer_times/controllers/config_form_controller.dart';
import 'package:muslim_prayer_times/ui/widgets/material_button.dart';

class ConfirmLocationLatAndLonWidgets extends StatelessWidget {
  final LocationData locationData;

  const ConfirmLocationLatAndLonWidgets(this.locationData);

  @override
  Widget build(BuildContext context) {
    final configFormController = Get.find<ConfigFormController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset("assets/images/location-pin2.png"),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            "Confirm location:",
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold
            )
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
              locationData.latitude.toString(),
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
              locationData.longitude.toString(),
              style: const TextStyle(fontSize: 20.0)
            )
          ]
        ),
        const SizedBox(height: 36.0),
        DefaultMaterialButton(
          text: "Save",
          onPressed: () {
            final Location location = Location.latAndLong(latitude: locationData.latitude.toString(), longitude: locationData.longitude.toString());
            configFormController.location = location;
            configFormController.isLocationSet = true;
            Get.back();
          }
        ),
        const SizedBox(height: 8.0),
        FlatButton(
          height: 48,
          minWidth: Get.width * 0.50,
          onPressed: () async => Get.find<LocationController>().getLocation(),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(48)),
          child: const Text("Refresh"),
        )
      ]
    );
  }
}