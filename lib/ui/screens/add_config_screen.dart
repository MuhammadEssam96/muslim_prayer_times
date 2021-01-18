import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_getx_widget.dart';
import 'package:muslim_prayer_times/controllers/config_form_controller.dart';
import 'package:muslim_prayer_times/controllers/configs_controller.dart';
import 'package:muslim_prayer_times/ui/screens/set_location_automatically_screen.dart';
import 'package:muslim_prayer_times/ui/values/colors.dart';
import 'package:muslim_prayer_times/ui/widgets/app_bar.dart';
import 'package:muslim_prayer_times/ui/widgets/ask_for_location_widgets.dart';
import 'package:muslim_prayer_times/ui/widgets/config_location_ready_lat_lon_widgets.dart';
import 'package:muslim_prayer_times/ui/widgets/material_button.dart';

class AddConfigScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar.appBar("Add new configuration"),
      backgroundColor: AppColors.primaryColorLight,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: GetX<ConfigFormController>(
                init: ConfigFormController(),
                builder: (controller) {
                  return Column(
                    children: [
                      const Text(
                        "Location: ",
                        style: TextStyle(
                          fontSize: 18
                        )
                      ),
                      const SizedBox(height: 16.0,),
                      if (controller.isLocationSet) ConfigLocationReadyLatLonWidgets(controller.location) else AskUserForLocationWidgets(),
                      const SizedBox(height: 16.0),
                      const Divider(
                        color: AppColors.primaryColorDark,
                        thickness: 2,
                      )
                    ],
                  );
                }
              ),
            ),
          ),
        ),
      )
    );
  }
}