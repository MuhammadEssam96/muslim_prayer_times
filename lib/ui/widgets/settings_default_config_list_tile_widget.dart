import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim_prayer_times/models/config_model.dart';
import 'package:muslim_prayer_times/ui/constants/colors.dart';
import 'package:muslim_prayer_times/ui/screens/configs_screen.dart';

class SettingsDefaultConfigListTileWidget extends StatelessWidget {
  final Config config;
  const SettingsDefaultConfigListTileWidget(this.config);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: ListTile(
        title: Text(
          config.name,
          style: const TextStyle(fontWeight: FontWeight.bold)
        ),
        subtitle: Text(
          "${config.location.city}, ${config.location.country}",
          style: const TextStyle(fontWeight: FontWeight.bold)
        ),
        tileColor: AppColors.accentColorLight,
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(4))),
        trailing: const Icon(Icons.arrow_forward_ios),
        onTap: () => Get.to(ConfigsScreen(), arguments: {"configsExist" : true})
      )
    );
  }
}