import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:location_permissions/location_permissions.dart';
import 'package:muslim_prayer_times/controllers/location_controller.dart';
import 'package:muslim_prayer_times/ui/values/colors.dart';
import 'package:muslim_prayer_times/ui/widgets/app_bar.dart';
import 'package:muslim_prayer_times/ui/widgets/confirm_location_lat_lon_widgets.dart';
import 'package:muslim_prayer_times/ui/widgets/getting_location_loading_widgets.dart';
import 'package:muslim_prayer_times/ui/widgets/request_location_permission_widgets.dart';

class SetLocationAutomaticallyScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar.appBar("Get Location Automatically"),
      backgroundColor: AppColors.primaryColorLight,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: GetX<LocationController>(
            init: LocationController(),
            builder: (controller){
              switch (controller.permissionStatus){
                case PermissionStatus.denied:
                case PermissionStatus.unknown:
                case PermissionStatus.restricted:
                  return RequestLocationPermissionWidgets(controller.permissionStatus);
                  break;
                case PermissionStatus.granted:
                  if (controller.locationIsLoading){
                    return GettingLocationLoadingWidgets();
                  }
                  if (controller.locationData != null) {
                    return ConfirmLocationLatAndLonWidgets(controller.locationData);
                  } else {
                    controller.getLocation();
                  }
              }
              return GettingLocationLoadingWidgets();
            },
          ),
        ),
      ),
    );
  }
}