import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/configs_controller.dart';
import '../../models/config_model.dart';
import '../constants/colors.dart';
import '../screens/edit_config_screen.dart';

class ConfigurationListTileWidget extends StatelessWidget {
  final Config config;
  const ConfigurationListTileWidget(this.config);

  @override
  Widget build(BuildContext context) {
    final ConfigsController configsController = Get.find<ConfigsController>();
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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => Get.to(EditConfigScreen(config))
            ),
            IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                if (configsController.configsList.length == 1){
                  Get.snackbar(""
                    "Can't delete the only configuration saved",
                    "Add another configuration then you can delete this one",
                    duration: const Duration(seconds: 2)
                  );
                } else if (config.isDefault) {
                  Get.snackbar(""
                    "Can't delete the default configuration saved",
                    "Set another configuration as default then you can delete this one",
                    duration: const Duration(seconds: 2)
                  );
                } else {
                  configsController.deleteConfig(config);
                }
              }
            )
          ]
        ),
        tileColor: AppColors.primaryColor,
        selectedTileColor: AppColors.accentColorLight,
        selected: config.isDefault,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(4)
          )
        ),
        onTap: () => configsController.setConfigAsDefault(config)
      )
    );
  }
}