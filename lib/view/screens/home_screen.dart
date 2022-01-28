import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/utils/theme.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
          child: Text(
        'Home Screen',
        style: TextStyle(color: Get.isDarkMode ? Colors.white : darkGrayClr),
      )),
    );
  }
}
