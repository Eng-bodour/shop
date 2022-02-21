import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/cart_controller.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/cart/cart_total.dart';
import 'package:shop/view/widgets/cart/cart_product_card.dart';
import 'package:shop/view/widgets/cart/empty_cart.dart';

class CartScreen extends StatelessWidget {
  CartScreen({Key? key}) : super(key: key);

  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                controller.clearAllProducts();
              },
              icon: const Icon(Icons.backspace)),
        ],
        backgroundColor: Get.isDarkMode ? darkGrayClr : mainColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Cart Screen',
        ),
      ),
      body: Obx(() {
        if (controller.productMap.isEmpty) {
          return EmptyCart();
        } else {
          return SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                    height: 600,
                    child: ListView.separated(
                        itemBuilder: (context, index) {
                          return CartProductCard(
                            quantity:
                                controller.productMap.values.toList()[index],
                            index: index,
                            productModels:
                                controller.productMap.keys.toList()[index],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        itemCount: controller.productMap.length)),
                Padding(
                  padding: EdgeInsets.only(bottom: 30),
                  child: CartTotal(),
                )
              ],
            ),
          );
        }
      }),
    ));
  }
}
