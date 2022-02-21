import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/cart/empty_cart.dart';
import 'package:shop/view/widgets/cart/cart_product_card.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.backspace)),
        ],
        backgroundColor: Get.isDarkMode ? darkGrayClr : mainColor,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Cart Screen',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: 600,
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      return CartProductCard();
                    },
                    separatorBuilder: (context, index) {
                      return const SizedBox(
                        height: 20,
                      );
                    },
                    itemCount: 1))
          ],
        ),
      ),
    ));
  }
}
