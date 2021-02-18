import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_permissions/location_permissions.dart';

import '../../controllers/location_controller.dart';
import '../../models/location_model.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/confirm_location_widgets.dart';
import '../widgets/getting_location_loading_widgets.dart';
import '../widgets/request_location_permission_widgets.dart';

//ignore_for_file: lines_longer_than_80_chars

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
                case PermissionStatus.denied:
                case PermissionStatus.unknown:
                case PermissionStatus.restricted:
                  return RequestLocationPermissionWidgets(controller.permissionStatus);
                case PermissionStatus.granted:
                  if (controller.locationIsLoading) return const GettingLocationLoadingWidgets();
                  if (controller.locationData != null) {
                    final Location location = controller.location;
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