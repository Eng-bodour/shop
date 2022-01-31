import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/product_controller.dart';
import 'package:shop/model/product_models.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/text_utilis.dart';

class CardItem extends StatelessWidget {
  CardItem({Key? key}) : super(key: key);
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(
            color: Get.isDarkMode ? pinkClr : mainColor,
          ),
        );
      } else {
        return Expanded(
          child: GridView.builder(
              itemCount: controller.productList.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.9,
                mainAxisExtent: 250,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                maxCrossAxisExtent: 250,
              ),
              itemBuilder: (context, index) {
                return buildCardItems(
                  image: controller.productList[index].image,
                  price: controller.productList[index].price,
                  rate: controller.productList[index].rating.rate,
                );
              }),
        );
      }
    });
  }
}

Widget buildCardItems({
  required String image,
  required double price,
  required double rate,
}) {
  return Padding(
    padding: const EdgeInsets.all(20),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.2),
                spreadRadius: 3.0,
                blurRadius: 5.0)
          ]),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {},
                icon: Icon(Icons.favorite_border_outlined,
                    color: Get.isDarkMode ? Colors.white : Colors.black),
              ),
              IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.add,
                      color: Get.isDarkMode ? Colors.white : Colors.black))
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          Container(
            child: Image.network(image, fit: BoxFit.fitHeight),
            width: double.infinity,
            height: 120,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(15)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextUtilis(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                    textstring: '\$$price',
                    underline: TextDecoration.none),
                Container(
                  height: 20,
                  width: 30,
                  decoration: BoxDecoration(
                    color: Get.isDarkMode ? pinkClr : mainColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextUtilis(
                          color: Colors.white,
                          fontSize: 8,
                          fontWeight: FontWeight.bold,
                          textstring: '$rate',
                          underline: TextDecoration.none),
                      const Icon(
                        Icons.star,
                        color: Colors.white,
                        size: 8,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ),
  );
}
