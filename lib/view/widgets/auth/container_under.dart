import 'package:flutter/material.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/text_utilis.dart';
import 'package:get/get.dart';

class ContainerUnder extends StatelessWidget {
  final String text;
  final String textType;
  final Function() onPressed;
  const ContainerUnder(
      {required this.text,
      required this.textType,
      required this.onPressed,
      Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 100,
      decoration: BoxDecoration(
        color: Get.isDarkMode ? pinkClr : mainColor,
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextUtilis(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              textstring: text,
              underline: TextDecoration.none),
          TextButton(
            onPressed: onPressed,
            child: TextUtilis(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                textstring: textType,
                underline: TextDecoration.underline),
          )
        ],
      ),
    );
  }
}
