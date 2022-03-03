import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/auth_controller.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/text_utilis.dart';

class LogOutWidget extends StatelessWidget {
  LogOutWidget({Key? key}) : super(key: key);

  final controller = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(
      builder: (controller) {
        return Material(
          color: Colors.transparent,
          child: InkWell(
            splashColor: Get.isDarkMode
                ? pinkClr.withOpacity(0.6)
                : mainColor.withOpacity(0.6),
            borderRadius: BorderRadius.circular(15),
            customBorder: StadiumBorder(),
            onTap: () {
              Get.defaultDialog(
                backgroundColor: Get.isDarkMode ? darkGrayClr : Colors.white,
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
                cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
                onCancel: () {
                  Get.back();
                },
                textConfirm: 'Yes',
                confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
                onConfirm: () {
                  controller.signOutFromApp();
                },
                buttonColor: Get.isDarkMode ? pinkClr : mainColor,
              );
            },
            child: Row(children: [
              Container(
                padding: const EdgeInsets.all(6),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: logOutSettings,
                ),
                child: const Icon(
                  Icons.logout,
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
                textstring: 'Logout'.tr,
                underline: TextDecoration.none,
              )
            ]),
          ),
        );
      },
    );
  }
}
