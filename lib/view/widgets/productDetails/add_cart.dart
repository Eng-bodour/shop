import 'package:flutter/material.dart';
import 'package:shop/logic/controller/cart_controller.dart';
import 'package:shop/model/product_models.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/text_utilis.dart';
import 'package:get/get.dart';

class AddCart extends StatelessWidget {
  final double price;
  final ProductModels productModels;
  AddCart({
    required this.price,
    required this.productModels,
    Key? key,
  }) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(25),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextUtilis(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.bold,
              textstring: 'Price',
              underline: TextDecoration.none,
            ),
            Text(
              '\$ $price',
              style: TextStyle(
                color: Get.isDarkMode ? Colors.white : Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                height: 1.5,
              ),
            )
          ],
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: SizedBox(
            height: 60,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  elevation: 0,
                  primary: Get.isDarkMode ? pinkClr : mainColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  )),
              onPressed: () {
                controller.addProductToCart(productModels);
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Text(
                    'Add to Cart',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.shopping_cart_outlined,
                  ),
                ],
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
