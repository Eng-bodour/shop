import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/home/card_item.dart';
import 'package:shop/view/widgets/home/search_form_text.dart';
import 'package:shop/view/widgets/text_utilis.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Column(
        children: [
          Container(
            width: double.infinity,
            height: 150,
            decoration: BoxDecoration(
                color: Get.isDarkMode ? darkGrayClr : mainColor,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  TextUtilis(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      textstring: 'Find Your',
                      underline: TextDecoration.none),
                  const SizedBox(
                    height: 5,
                  ),
                  TextUtilis(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      textstring: 'INSPIRATION',
                      underline: TextDecoration.none),
                  const SizedBox(
                    height: 20,
                  ),
                  const SearchFormText(),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25, right: 25),
            child: Align(
              alignment: Alignment.topLeft,
              child: TextUtilis(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 35,
                  fontWeight: FontWeight.w500,
                  textstring: 'Categories',
                  underline: TextDecoration.none),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          CardItem(),
        ],
      ),
    ));
  }
}
