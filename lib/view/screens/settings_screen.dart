import 'package:flag/flag.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/settings_controller.dart';
import '../../models/prayer_enum_model.dart' as prayer;
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/settings_default_config_list_tile_widget.dart';

//ignore_for_file: lines_longer_than_80_chars

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar.appBar(title: "Settings"),
      backgroundColor: AppColors.primaryColorLight,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0
            ),
            child: GetX<SettingsController>(
              init: SettingsController(),
              builder: (controller) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Configurations",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColorDark
                      )
                    ),
                    const SizedBox(height: 16.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Center(
                        child: Column(
                          children: [
                            const Text(
                              "Selected default configuration\n Tap below to manage all configurations.",
                              style: TextStyle(
                                fontSize: 16.0,
                                color: AppColors.primaryColorDark
                              ),
                              textAlign: TextAlign.center
                            ),
                            const SizedBox(height: 8.0),
                            SettingsDefaultConfigListTileWidget(controller.defaultConfig)
                          ]
                        )
                      )
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(
                      color: AppColors.primaryColorDark,
                      thickness: 2
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      "Language",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColorDark
                      )
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: ToggleButtons(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(15)
                        ),
                        fillColor: AppColors.primaryColorDark,
                        selectedColor: AppColors.accentColorLight,
                        selectedBorderColor: AppColors.primaryColorDark,
                        splashColor: AppColors.primaryColor,
                        borderColor: AppColors.primaryColor,
                        onPressed: (int index) => controller.setLanguagesList(index),
                        isSelected: controller.languagesList,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Flag(
                                  "GB",
                                  height: 100,
                                  width: 100
                                ),
                                const Text(
                                  "English",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ]
                            )
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Flag(
                                  "EG",
                                  height: 100,
                                  width: 100
                                ),
                                const Text(
                                  "Arabic",
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold
                                  )
                                )
                              ]
                            )
                          )
                        ]
                      )
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(
                      color: AppColors.primaryColorDark,
                      thickness: 2
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      "Notifications",
                      style: TextStyle(
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primaryColorDark
                      )
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child:  Text(
                        "- Default Notifications",
                        style: TextStyle(
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold,
                          color: AppColors.primaryColorDark
                        )
                      )
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Column(
                        children: controller.defaultNotificationsOptions.map((notificationOption) {
                          return SwitchListTile(
                            title: Text(
                              prayer.names[notificationOption.prayer],
                              style: const TextStyle(
                                color: AppColors.primaryColorDark,
                                fontSize: 16
                              )
                            ),
                            value: notificationOption.isEnabled,
                            inactiveThumbColor: AppColors.primaryColorDark,
                            dense: true,
                            onChanged: (value) {
                              controller.changeDefaultNotificationOptionList(
                                index: controller.defaultNotificationsOptions.indexOf(notificationOption),
                                value: value
                              );
                            }
                          );
                        }).toList()
                      )
                    ),
                    const SizedBox(height: 16.0),
                    const Divider(
                      color: AppColors.primaryColorDark,
                      thickness: 2
                    ),
                    const SizedBox(height: 16.0),
                    const Text(
                      "General",
                      style: TextStyle(
                         fontSize: 18.0,
                         fontWeight: FontWeight.bold,
                         color: AppColors.primaryColorDark
                      )
                    ),
                    const SizedBox(height: 16.0),
                    SwitchListTile(
                      title: const Text(
                        "Show Sunrise time",
                        style: TextStyle(
                          color: AppColors.primaryColorDark,
                          fontSize: 16.0
                        )
                      ),
                      dense: true,
                      value: controller.showSunriseTimeOption,
                      inactiveThumbColor: AppColors.primaryColorDark,
                      onChanged: (bool value) => controller.showSunriseTimeOption = value
                    ),
                    SwitchListTile(
                      title: const Text(
                        "Show Imsak time",
                        style: TextStyle(
                          color: AppColors.primaryColorDark,
                          fontSize: 16.0
                        )
                      ),
                      dense: true,
                      value: controller.showImsakTimeOption,
                      inactiveThumbColor: AppColors.primaryColorDark,
                      onChanged: (bool value) => controller.showImsakTimeOption = value
                    ),
                    SwitchListTile(
                      title: const Text(
                        "Show Midnight time",
                        style: TextStyle(
                          color: AppColors.primaryColorDark,
                          fontSize: 16.0
                        )
                      ),
                      dense: true,
                      value: controller.showMidnightTimeOption,
                      inactiveThumbColor: AppColors.primaryColorDark,
                      onChanged: (bool value) => controller.showMidnightTimeOption = value
                    ),
                    SwitchListTile(
                      title: const Text(
                        "Dark mode",
                        style: TextStyle(
                          color: AppColors.primaryColorDark,
                          fontSize: 16.0
                        )
                      ),
                      dense: true,
                      value: controller.darkModeOption,
                      inactiveThumbColor: AppColors.primaryColorDark,
                      onChanged: (bool value) => controller.darkModeOption = value
                    )
                  ]
                );
              }
            )
          )
        )
      )
    );
  }
}