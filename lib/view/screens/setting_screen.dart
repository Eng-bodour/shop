import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/auth_controller.dart';
import 'package:shop/logic/controller/theme_controller.dart';
import 'package:shop/utils/theme.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: TextButton(
                onPressed: () {
                  ThemeController().cangesTheme();
                },
                child: Text(
                  'Dark Mode',
                  style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : darkGrayClr),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            GetBuilder<AuthController>(
              builder: (controller) => Center(
                child: TextButton(
                  onPressed: () {
                    Get.defaultDialog(
                      backgroundColor:
                          Get.isDarkMode ? darkGrayClr : Colors.white,
                      radius: 10,
                      title: 'logout from APP',
                      titleStyle: TextStyle(
                          fontSize: 18,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold),
                      middleText: 'Are you Sure you  need to logout',
                      middleTextStyle: TextStyle(
                          fontSize: 18,
                          color: Get.isDarkMode ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold),
                      textCancel: 'No',
                      cancelTextColor:
                          Get.isDarkMode ? Colors.white : Colors.black,
                      onCancel: () {
                        Get.back();
                      },
                      textConfirm: 'Yes',
                      confirmTextColor:
                          Get.isDarkMode ? Colors.white : Colors.black,
                      onConfirm: () {
                        controller.signOutFromApp();
                      },
                      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
                    );
                    //
                  },
                  child: Text(
                    'Log Out',
                    style: TextStyle(
                        color: Get.isDarkMode ? Colors.white : darkGrayClr),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
