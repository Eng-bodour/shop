import 'package:flutter/material.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/text_utilis.dart';
import 'package:get/get.dart';

class CheckWidget extends StatelessWidget {
  const CheckWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: () {},
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                color: Colors.grey.shade200,
                borderRadius: BorderRadius.circular(10)),
            child: Get.isDarkMode
                ? Image.asset('assets/images/check.png')
                : const Icon(Icons.done, color: pinkClr),
          ),
        ),
        const SizedBox(
          width: 10,
        ),
        Row(
          children: [
            TextUtilis(
                color: Get.isDarkMode ? Colors.black : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                textstring: 'I accept',
                underline: TextDecoration.none),
            const SizedBox(
              width: 10,
            ),
            TextUtilis(
                color: Get.isDarkMode ? Colors.black : Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal,
                textstring: 'terms & conditions',
                underline: TextDecoration.underline),
          ],
        )
      ],
    );
  }
}