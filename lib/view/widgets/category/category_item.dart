import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/cart_controller.dart';
import 'package:shop/logic/controller/category_controller.dart';
import 'package:shop/logic/controller/product_controller.dart';
import 'package:shop/model/product_models.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/screens/product_details_screen.dart';
import 'package:shop/view/widgets/text_utilis.dart';

class CategoryItems extends StatelessWidget {
  String categoryTitle;
  CategoryItems({
    required this.categoryTitle,
    Key? key,
  }) : super(key: key);
  final controller = Get.find<ProductController>();
  final cartController = Get.find<CartController>();
  final categoryController = Get.find<CategoryController>();

  @override
  Widget build(BuildContext context) {
    // final scrollController = ScrollController(initialScrollOffset: 0);
    return Scaffold(
      backgroundColor: context.theme.backgroundColor,
      appBar: AppBar(
        title: Text(categoryTitle),
        centerTitle: true,
        backgroundColor: Get.isDarkMode ? darkGrayClr : mainColor,
      ),
      body: Obx(() {
        if (categoryController.isAllCategory.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return GridView.builder(
              itemCount: categoryController.categoreListItems.length,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                childAspectRatio: 0.9,
                mainAxisExtent: 250,
                crossAxisSpacing: 10.0,
                mainAxisSpacing: 10.0,
                maxCrossAxisExtent: 250,
              ),
              itemBuilder: (context, index) {
                return buildCardItems(
                    image: categoryController.categoreListItems[index].image,
                    price: categoryController.categoreListItems[index].price,
                    rate:
                        categoryController.categoreListItems[index].rating.rate,
                    productId: categoryController.categoreListItems[index].id,
                    productModels: categoryController.categoreListItems[index],
                    onTap: () {
                      Get.to(() => ProductDetailsScreen(
                            productModels:
                                categoryController.categoreListItems[index],
                          ));
                    });
              });
        }
      }),
    );
  }

  Widget buildCardItems({
    required String image,
    required double price,
    required double rate,
    required int productId,
    required ProductModels productModels,
    required Function() onTap,
  }) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: InkWell(
        onTap: onTap,
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
              Obx(() {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {
                        controller.manageFavorites(productId);
                      },
                      icon: controller.isFavorites(productId)
                          ? const Icon(
                              Icons.favorite,
                              color: Colors.red,
                            )
                          : Icon(Icons.favorite_border_outlined,
                              color:
                                  Get.isDarkMode ? Colors.black : Colors.black),
                    ),
                    IconButton(
                        onPressed: () {
                          cartController.addProductToCart(productModels);
                        },
                        icon: Icon(Icons.shopping_cart,
                            color:
                                Get.isDarkMode ? Colors.black : Colors.black))
                  ],
                );
              }),
              const SizedBox(
                height: 5,
              ),
              Container(
                child: Image.network(image, fit: BoxFit.fitHeight),
                width: double.infinity,
                height: 120,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15)),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextUtilis(
                        color: Get.isDarkMode ? Colors.black : Colors.black,
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
      ),
    );
  }
}
