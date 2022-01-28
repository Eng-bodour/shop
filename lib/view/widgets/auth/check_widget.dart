import 'package:flutter/material.dart';
import 'package:shop/logic/controller/auth_controller.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/text_utilis.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  final controller = Get.find<AuthController>();

  CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AuthController>(builder: (controller) {
      return Row(
        children: [
          InkWell(
            onTap: () {
              controller.checkedBox();
            },
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10)),
              child: controller.isCheckedBox
                  ? Get.isDarkMode
                      ? Image.asset('assets/images/check.png')
                      : const Icon(Icons.done, color: pinkClr)
                  : Container(),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Row(
            children: [
              TextUtilis(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  textstring: 'I accept',
                  underline: TextDecoration.none),
              const SizedBox(
                width: 10,
              ),
              TextUtilis(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  textstring: 'terms & conditions',
                  underline: TextDecoration.underline),
            ],
          )
        ],
      );
    });
  }
}
