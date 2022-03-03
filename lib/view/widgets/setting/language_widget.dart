import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/text_utilis.dart';

class LanguageWidget extends StatelessWidget {
  const LanguageWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        buildLanguageWidget(),
        buildDropdownButton(),
      ],
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
          textstring: 'Language',
          underline: TextDecoration.none,
        )
      ]),
    );
  }

  Widget buildDropdownButton() {
    return Material(
      child: Container(
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
                    english,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
              DropdownMenuItem(
                  value: ara,
                  child: Text(
                    arabic,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
              DropdownMenuItem(
                  value: frf,
                  child: Text(
                    france,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  )),
            ],
            // for default value
            value: ene,
            iconSize: 25,
            icon: Icon(
              Icons.arrow_drop_down,
              color: Get.isDarkMode ? Colors.white : Colors.black,
            ),
            onChanged: (value) {
              ene = value!;
            },
          ),
        ),
      ),
    );
  }
}
