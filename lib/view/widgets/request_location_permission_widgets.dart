import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' show PermissionStatus;

import '../../controllers/location_controller.dart';
import 'material_button.dart';

class RequestLocationPermissionWidgets extends StatelessWidget {
  final PermissionStatus permissionStatus;
  const RequestLocationPermissionWidgets(this.permissionStatus);

  List<Widget> getTextWidget(PermissionStatus permissionStatus){
    if(permissionStatus == PermissionStatus.deniedForever) {
      return const [
        Text(
          "Location permission status is unknown..",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold
          )
        ),
        Text(
          "We need your location permission only once to access your location information and it will be saved locally on your device.",
          style: TextStyle(
            fontSize: 18.0
          ),
          textAlign: TextAlign.center,
        )
      ];
    } else if (permissionStatus == PermissionStatus.denied) {
      return const [
        Text(
          "Location permission status is denied..",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold
          )
        ),
        Text(
          "We need your location permission only once to access your location information and it will be saved locally on your device.",
          style: TextStyle(
            fontSize: 18.0
          ),
          textAlign: TextAlign.center,
        )
      ];
    } else {
      return const [
        Text(
          "Location permission status is restricted..",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 22.0,
            fontWeight: FontWeight.bold
          )
        ),
        Text(
          "We need your location permission only once to access your location information and it will be saved locally on your device.",
          style: TextStyle(
            fontSize: 18.0
          ),
          textAlign: TextAlign.center,
        )
      ];
    }
  }

  @override
  Widget build(BuildContext context) {
    final locationController = Get.find<LocationController>();
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Image.asset('assets/images/map.png')
        ),
        Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(children: getTextWidget(permissionStatus))
        ),
        const SizedBox(height: 16.0),
        DefaultMaterialButton(
          text: "Allow location permission",
          onPressed: () async => locationController.requestLocationPermission()
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
          onPressed: () => Get.back(),
          child: const Text("Cancel")
        )
      ]
    );
  }
}