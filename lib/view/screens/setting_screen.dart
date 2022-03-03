import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/setting/dark_mode_widget.dart';
import 'package:shop/view/widgets/setting/language_widget.dart';
import 'package:shop/view/widgets/setting/logout_widget.dart';
import 'package:shop/view/widgets/setting/profile_image_widget.dart';
import 'package:shop/view/widgets/text_utilis.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: ListView(
        padding: const EdgeInsets.all(24),
        children: [
          ProfileImage(),
          const SizedBox(
            height: 10,
          ),
          Divider(color: Get.isDarkMode ? Colors.white : Colors.grey),
          const SizedBox(
            height: 20,
          ),
          TextUtilis(
            color: Get.isDarkMode ? pinkClr : mainColor,
            fontSize: 18,
            fontWeight: FontWeight.bold,
            textstring: 'GENERAL'.tr,
            underline: TextDecoration.none,
          ),
          const SizedBox(
            height: 20,
          ),
          DarkModeWidget(),
          const SizedBox(
            height: 20,
          ),
          LanguageWidget(),
          const SizedBox(
            height: 20,
          ),
          LogOutWidget(),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
