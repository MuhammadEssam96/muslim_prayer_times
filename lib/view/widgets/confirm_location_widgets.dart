import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../controllers/config_form_controller.dart';
import '../../controllers/location_controller.dart';
import '../../models/location_model.dart';
import 'material_button.dart';

class ConfirmLocationWidgets extends StatelessWidget {
  final Location location;
  final Completer<GoogleMapController> _controller = Completer();

  ConfirmLocationWidgets(this.location);

  @override
  Widget build(BuildContext context) {
    final configFormController = Get.find<ConfigFormController>();
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          Image.asset(
            "assets/images/location-pin2.png",
            width: Get.size.width * 0.33
          ),
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
          SizedBox(
            width: Get.size.width,
            height: Get.size.width * 0.66,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(32),
              child: GoogleMap(
                padding: const EdgeInsets.all(16.0),
                myLocationEnabled: true,
                initialCameraPosition: CameraPosition(
                  target: LatLng(
                    double.parse(location.latitude),
                    double.parse(location.longitude)
                  ),
                  zoom: 15
                ),
                onMapCreated: (GoogleMapController controller) => _controller.complete(controller)
              )
            )
          ),
          const SizedBox(height: 16.0),
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
            text: "Save",
            onPressed: () {
              configFormController.location = location;
              configFormController.isLocationSet = true;
              Get.back();
            }
          ),
          const SizedBox(height: 8.0),
          TextButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(Size(Get.size.width * 0.50, 48)),
              shape: MaterialStateProperty.all<OutlinedBorder?>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(48)
                )
              )
            ),
            onPressed: () async => Get.find<LocationController>().getLocation(),
            child: const Text("Refresh")
          )
        ]
      )
    );
  }
}