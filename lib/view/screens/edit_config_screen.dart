import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/config_form_controller.dart';
import '../../controllers/configs_controller.dart';
import '../../models/config_method_enum_model.dart';
import '../../models/config_model.dart';
import '../../models/config_school_enum_model.dart';
import '../constants/colors.dart';
import '../widgets/app_bar.dart';
import '../widgets/config_location_ready_widgets.dart';
import '../widgets/material_button.dart';
import 'get_location_screen.dart';

class EditConfigScreen extends StatelessWidget {
  final Config config;
  const EditConfigScreen(this.config);

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();
    final ConfigsController configsController = Get.find<ConfigsController>();
    return Scaffold(
      appBar: DefaultAppBar.appBar(title: "Add new configuration"),
      backgroundColor: AppColors.primaryColorLight,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0
              ),
              child: GetX<ConfigFormController>(
                init: ConfigFormController.editConfig(config),
                builder: (controller) {
                  return Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: const [
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 8.0),
                                child: Icon(
                                  Icons.location_pin,
                                  color: AppColors.primaryColorDark
                                )
                              ),
                              Text(
                                "Location: ",
                                style: TextStyle(
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.primaryColorDark
                                )
                              )
                            ]
                          ),
                          if (controller.isLocationSet) ConfigLocationReadyWidgets(controller.location!) else DefaultMaterialButton(text: "Get Location", onPressed: () => Get.to(GetLocationScreen()))
                        ]
                      ),
                      const SizedBox(height: 16.0),
                      const Divider(
                        color: AppColors.primaryColorDark,
                        thickness: 2
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.calculate,
                              color: AppColors.primaryColorDark
                            )
                          ),
                          const Text(
                            "Method: ",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColorDark
                            )
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: DropdownButtonFormField<ConfigMethod>(
                                isDense: false,
                                isExpanded: true,
                                value: controller.configMethod,
                                decoration: const InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder()
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: ConfigMethod.universityOfIslamicSciencesKarachi,
                                    child: Text("University of Islamic Sciences, Karachi")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.islamicSocietyOfNorthAmerica,
                                    child: Text("Islamic Society of North America")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.muslimWorldLeague,
                                    child: Text("Muslim World League")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.ummAlQuraUniversityMakkah,
                                    child: Text("Umm Al-Qura University, Makkah")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.egyptianGeneralAuthorityOfSurvey,
                                    child: Text("Egyptian General Authority of Survey")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.instituteOfGeophysicsUniversityOfTehran,
                                    child: Text("Institute of Geophysics, University of Tehran")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.gulfRegion,
                                    child: Text("Gulf Region")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.kuwait,
                                    child: Text("Kuwait")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.qatar,
                                    child: Text("Qatar")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.majlisUgamaIslamSingapuraSingapore,
                                    child: Text("Majlis Ugama Islam Singapura, Singapore")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.unionOrganizationIslamicDeFrance,
                                    child: Text("Union Organization Islamic de France")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.diyanetIsleriBaskanligiTurkey,
                                    child: Text("Diyanet İşleri Başkanlığı, Turkey")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigMethod.spiritualAdministrationOfMuslimsOfRussia,
                                    child: Text("Spiritual Administration of Muslims of Russia")
                                  )
                                ],
                                onChanged: (ConfigMethod? method) => controller.configMethod = method!
                              )
                            )
                          )
                        ]
                      ),
                      const SizedBox(height: 16.0),
                      const Divider(
                        color: AppColors.primaryColorDark,
                        thickness: 2
                      ),
                      const SizedBox(height: 16.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 8.0),
                            child: Icon(
                              Icons.school,
                              color: AppColors.primaryColorDark
                            ),
                          ),
                          const Text(
                            "School: ",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryColorDark
                            )
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16.0),
                              child: DropdownButtonFormField(
                                value: controller.configSchool,
                                isExpanded: true,
                                isDense: false,
                                decoration: const InputDecoration(
                                  filled: true,
                                  border: OutlineInputBorder()
                                ),
                                items: const [
                                  DropdownMenuItem(
                                    value: ConfigSchool.shafi,
                                    child: Text("Shafi (Default)")
                                  ),
                                  DropdownMenuItem(
                                    value: ConfigSchool.hanafi,
                                    child: Text("Hanafi")
                                  )
                                ],
                                onChanged: (ConfigSchool? school) => controller.configSchool = school!
                              )
                            )
                          )
                        ]
                      ),
                      const SizedBox(height: 16.0),
                      const Divider(
                        color: AppColors.primaryColorDark,
                        thickness: 2
                      ),
                      const SizedBox(height: 16.0),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Form(
                          key: formKey,
                          child: TextFormField(
                            style: const TextStyle(
                              fontSize: 18.0,
                              color: AppColors.black
                            ),
                            maxLength: 50,
                            decoration: const InputDecoration(
                              contentPadding: EdgeInsets.all(10.0),
                              counterStyle: TextStyle(fontWeight: FontWeight.bold),
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: AppColors.primaryColorDark
                                )
                              ),
                              hintText: "Configuration name",
                              focusColor: AppColors.primaryColorDark,
                              prefixIcon: Icon(
                                Icons.edit,
                                color: AppColors.primaryColorDark
                              ),
                              hintStyle:  TextStyle(
                                fontSize: 15.0,
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.bold
                              ),
                              errorStyle: TextStyle(fontWeight: FontWeight.bold)
                            ),
                            keyboardType: TextInputType.text,
                            initialValue: config.name,
                            validator: (String? value) => value!.isEmpty ? "Configuration name can't be empty!ً" : null,
                            onSaved: (String? value) => controller.configName = value!
                          )
                        )
                      ),
                      const SizedBox(height: 16.0),
                      DefaultMaterialButton(
                        text: "Save configuration",
                        onPressed: () async {
                          if (formKey.currentState!.validate() && controller.isLocationSet){
                            formKey.currentState?.save();

                            final Config newConfig = Config(
                              id: config.id,
                              location: controller.location!,
                              method: controller.configMethod,
                              school: controller.configSchool,
                              isDefault: config.isDefault,
                              name: controller.configName
                            );

                            await configsController.editConfig(oldConfig: config, newConfig: newConfig);

                            Get.back();
                          } else {
                            if (!controller.isLocationSet) {
                              Get.snackbar(
                                "Location is not set yet",
                                "Please set your location first",
                                duration: const Duration(seconds: 2)
                              );
                            }
                          }
                        }
                      )
                    ]
                  );
                }
              )
            )
          )
        )
      )
    );
  }
}