import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_prayer_times/controllers/configs_controller.dart';
import 'package:muslim_prayer_times/data/models/config_model.dart';
import 'package:muslim_prayer_times/ui/screens/add_config_screen.dart';
import 'package:muslim_prayer_times/ui/constants/colors.dart';
import 'package:muslim_prayer_times/ui/screens/home_screen.dart';
import 'package:muslim_prayer_times/ui/widgets/app_bar.dart';
import 'package:muslim_prayer_times/ui/widgets/config_list_tile_widget.dart';
import 'package:muslim_prayer_times/ui/widgets/material_button.dart';

class ConfigsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> arguments = Get.arguments as Map<String, dynamic>;
    final bool configsExist = arguments["configsExist"] as bool;
    return GetX<ConfigsController>(
      init: ConfigsController(),
      builder: (configsController) {
        return Scaffold(
          appBar: !configsExist && configsController.configsList.isNotEmpty ?
          DefaultAppBar.appBarWithBackButton(title: ""
            "Configurations",
            onBackButtonPressed: () {
              Get.off(
                HomeScreen(),
                transition: Transition.leftToRightWithFade
              );
            }
          ) :
          DefaultAppBar.appBar(title: "Configurations"),
          backgroundColor: AppColors.primaryColorLight,
          body: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 16.0,
                horizontal: 16.0
              ),
              child: configsController.configsList.isEmpty ?
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.asset(
                      "assets/images/ui-element-150.png",
                      width: Get.size.width * 0.66
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "No configurations are saved yet..",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22.0,
                        fontWeight: FontWeight.bold
                      )
                    )
                  ),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "You can add new configurations to store your preferred location, prayer times calculation methods and other options!",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 18.0)
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: DefaultMaterialButton(
                      text: "Add new configuration",
                      onPressed: () => Get.to(AddConfigScreen())
                    )
                  )
                ]
              ) :
              Column(
                children: [
                  const Text(
                    "Select your default configuration.\n You can also edit and delete any configuration.",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)
                  ),
                  const SizedBox(height: 16.0),
                  const Text(
                    "Press back button when you're done setting up your configuration(s).",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0)
                  ),
                  const SizedBox(height: 16.0),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: configsController.configsList.length,
                      itemBuilder: (BuildContext context, int index){
                        final Config config = configsController.configsList[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: ConfigurationListTileWidget(config)
                        );
                      }
                    )
                  )
                ]
              )
            )
          ),
          floatingActionButton: configsController.configsList.isNotEmpty ?
          FloatingActionButton.extended(
            onPressed: () => Get.to(AddConfigScreen()),
            label: const Text("Add new configuration"),
            icon: const Icon(Icons.add)
          ) :
          Container()
        );
      }
    );
  }
}