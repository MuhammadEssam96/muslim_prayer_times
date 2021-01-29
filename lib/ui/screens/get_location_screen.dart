import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:muslim_prayer_times/controllers/location_controller.dart';
import 'package:muslim_prayer_times/data/models/location_model.dart';
import 'package:muslim_prayer_times/ui/constants/colors.dart';
import 'package:muslim_prayer_times/ui/widgets/app_bar.dart';
import 'package:muslim_prayer_times/ui/widgets/confirm_location_widgets.dart';
import 'package:muslim_prayer_times/ui/widgets/getting_location_loading_widgets.dart';
import 'package:muslim_prayer_times/ui/widgets/request_location_permission_widgets.dart';

class GetLocationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar.appBar("Get Location"),
      backgroundColor: AppColors.primaryColorLight,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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