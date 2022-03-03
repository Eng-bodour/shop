import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/setting_controller.dart';
import 'package:shop/view/widgets/text_utilis.dart';

class ProfileImage extends StatelessWidget {
  ProfileImage({Key? key}) : super(key: key);
  final controller = Get.find<SettingController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            buildPhoto(),
            const SizedBox(
              width: 15,
            ),
            buildInfo(),
          ],
        )
      ],
    );
  }

  Widget buildPhoto() {
    return Container(
      height: 100,
      width: 100,
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage('assets/images/user.png'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget buildInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextUtilis(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 22,
          fontWeight: FontWeight.bold,
          textstring: controller.capitalize('Bodour majadmi'),
          underline: TextDecoration.none,
        ),
        TextUtilis(
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontSize: 14,
          fontWeight: FontWeight.bold,
          textstring: 'Bodour@gmail.com',
          underline: TextDecoration.none,
        ),
      ],
    );
  }
}
