import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/utils/theme.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      body: Center(
          child: Text(
        'Category Screen',
        style: TextStyle(color: Get.isDarkMode ? Colors.white : darkGrayClr),
      )),
    );
  }
}
