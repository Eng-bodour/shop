import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/main_controller.dart';
import 'package:shop/utils/theme.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);
  final controller = Get.find<MainController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Obx(() {
      return Scaffold(
        backgroundColor: context.theme.backgroundColor,
        appBar: AppBar(
          // leading: Container() this line , no back the last page
          leading: Container(),
          title: Text(controller.title[controller.currentIndex.value]),
          centerTitle: true,
          //elevation: 0, to remove line betwine appbar and body
          elevation: 0,
          actions: [
            IconButton(
                onPressed: () {}, icon: Image.asset('assets/images/shop.png'))
          ],
          backgroundColor: Get.isDarkMode ? darkGrayClr : mainColor,
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: controller.currentIndex.value,
          backgroundColor: Get.isDarkMode ? darkGrayClr : Colors.white,
          type: BottomNavigationBarType.fixed,
          onTap: (index) {
            controller.currentIndex.value = index;
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              activeIcon: Icon(
                Icons.home,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.category,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              activeIcon: Icon(
                Icons.category,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              activeIcon: Icon(
                Icons.favorite,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? Colors.white : Colors.black,
              ),
              activeIcon: Icon(
                Icons.settings,
                color: Get.isDarkMode ? pinkClr : mainColor,
              ),
              label: '',
            )
          ],
        ),
        body: IndexedStack(
          index: controller.currentIndex.value,
          // ignore: invalid_use_of_protected_member
          children: controller.tabs.value,
        ),
      );
    }));
  }
}
