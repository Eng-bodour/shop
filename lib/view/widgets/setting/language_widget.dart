import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/setting_controller.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/text_utilis.dart';

class LanguageWidget extends StatelessWidget {
  LanguageWidget({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SettingController>(
      builder: (controller) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            buildLanguageWidget(),
            buildDropdownButton(),
          ],
        );
      },
    );
  }

  Widget buildLanguageWidget() {
    return Material(
      color: Colors.transparent,
      child: Row(children: [
        Container(
          padding: const EdgeInsets.all(6),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: languageSettings,
          ),
          child: const Icon(
            Icons.language,
            color: Colors.white,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        TextUtilis(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          textstring: 'Language'.tr,
          underline: TextDecoration.none,
        )
      ]),
    );
  }

  Widget buildDropdownButton() {
    return Container(
      width: 120,
      padding: const EdgeInsets.symmetric(
        horizontal: 6,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(13),
        border: Border.all(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          width: 2,
        ),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          items: [
            DropdownMenuItem(
                value: ene,
                child: Text(
                  english.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
            DropdownMenuItem(
                value: ara,
                child: Text(
                  arabic.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
            DropdownMenuItem(
                value: frf,
                child: Text(
                  france.tr,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                )),
          ],
          // for default value
          value: controller.langLocal,
          iconSize: 25,
          icon: Icon(
            Icons.arrow_drop_down,
            color: Get.isDarkMode ? Colors.white : Colors.black,
          ),
          onChanged: (value) {
            controller.changeLanguage(value!);
            Get.updateLocale(Locale(value));
          },
        ),
      ),
    );
  }
}
