import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location/location.dart' show PermissionStatus;

import '../../controllers/location_controller.dart';
import '../../models/location_model.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/confirm_location_widgets.dart';
import '../widgets/getting_location_loading_widgets.dart';
import '../widgets/request_location_permission_widgets.dart';

class GetLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar.appBar(title: "Get Location"),
      backgroundColor: AppColors.primaryColorLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Center(
          child: GetX<LocationController>(
            init: LocationController(),
            builder: (controller) {
              switch (controller.permissionStatus) {
                case PermissionStatus.deniedForever:
                case PermissionStatus.denied:
                  return RequestLocationPermissionWidgets(controller.permissionStatus);
                case PermissionStatus.grantedLimited:
                case PermissionStatus.granted:
                  if (controller.locationIsLoading) return const GettingLocationLoadingWidgets();
                  if (controller.locationData != null) {
                    final Location location = controller.location!;
                    if (location.isLocationEmpty(location)) {
                      return const GettingLocationLoadingWidgets();
                    } else {
                      return ConfirmLocationWidgets(location);
                    }
                  } else {
                    controller.getLocation();
                  }
              }
              return const GettingLocationLoadingWidgets();
            }
          )
        )
      )
    );
  }
}