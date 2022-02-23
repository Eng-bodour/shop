import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/model/product_models.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/utils/theme.dart';

class CartController extends GetxController {
  var productMap = {}.obs;

  void addProductToCart(ProductModels productModels) {
    if (productMap.containsKey(productModels)) {
      productMap[productModels] += 1;
    } else {
      productMap[productModels] = 1;
      // print(productMap.entries.map((e) => e.key.price * e.value).toList());

    }
  }

  void removeProductsFromCart(ProductModels productModels) {
    if (productMap.containsKey(productModels) &&
        productMap[productModels] == 1) {
      productMap.removeWhere((key, value) => key == productModels);
    } else {
      productMap[productModels] -= 1;
    }
  }

  void removeOneProduct(ProductModels productModels) {
    productMap.removeWhere((key, value) => key == productModels);
  }

  void clearAllProducts() {
    Get.defaultDialog(
      backgroundColor: Get.isDarkMode ? darkGrayClr : Colors.white,
      radius: 10,
      title: 'clear product',
      titleStyle: TextStyle(
          fontSize: 18,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold),
      middleText: 'Are you Sure you  need to clear product',
      middleTextStyle: TextStyle(
          fontSize: 18,
          color: Get.isDarkMode ? Colors.white : Colors.black,
          fontWeight: FontWeight.bold),
      textCancel: 'No',
      cancelTextColor: Get.isDarkMode ? Colors.white : Colors.black,
      onCancel: () {
        Get.toNamed(Routes.cartScreen);
      },
      textConfirm: 'Yes',
      confirmTextColor: Get.isDarkMode ? Colors.white : Colors.black,
      onConfirm: () {
        productMap.clear();
        Get.back();
      },
      buttonColor: Get.isDarkMode ? pinkClr : mainColor,
    );
  }

  get productSubTotal =>
      productMap.entries.map((e) => e.key.price * e.value).toList();
  get total => productMap.entries
      .map((e) => e.key.price * e.value)
      .toList()
      .reduce((value, element) => value + element)
      .toStringAsFixed(2);

  int quantity() {
    if (productMap.isEmpty) {
      return 0;
    }
    return productMap.entries
        .map((e) => e.value)
        .toList()
        .reduce((value, element) => value + element);
  }
}
