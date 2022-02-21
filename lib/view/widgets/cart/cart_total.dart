import 'package:flutter/material.dart';
import 'package:shop/logic/controller/cart_controller.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/text_utilis.dart';
import 'package:get/get.dart';

class CartTotal extends StatelessWidget {
  CartTotal({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(25),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextUtilis(
                    color: Colors.grey,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    textstring: 'Total',
                    underline: TextDecoration.none),
                const SizedBox(
                  height: 20,
                ),
                Text('\$${controller.total} ',
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      height: 1.5,
                    ))
              ],
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: SizedBox(
                height: 60,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 0,
                      primary: Get.isDarkMode ? pinkClr : mainColor),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Check out',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(Icons.shopping_cart),
                    ],
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
