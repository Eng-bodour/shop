import 'package:flutter/material.dart';
import 'package:flutter_simple_rating_bar/flutter_simple_rating_bar.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/product_controller.dart';
import 'package:shop/view/widgets/text_utilis.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int id;
  final double rate;
  ClothesInfo({
    required this.title,
    required this.id,
    required this.rate,
    Key? key,
  }) : super(key: key);

  final controller = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //this Row for => the first line in info
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Get.isDarkMode ? Colors.white : Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Obx(() {
                  return Container(
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Get.isDarkMode
                              ? Colors.white.withOpacity(0.9)
                              : Colors.grey.withOpacity(0.4)),
                      child: InkWell(
                        onTap: () {
                          controller.manageFavorites(id);
                        },
                        child: controller.isFavorites(id)
                            ? const Icon(Icons.favorite,
                                color: Colors.red, size: 20)
                            : const Icon(Icons.favorite_border_outlined,
                                color: Colors.black, size: 20),
                      ));
                })
              ],
            ),
            //this Row for the second line for rate
            Row(
              children: [
                TextUtilis(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  textstring: '$rate',
                  underline: TextDecoration.none,
                ),
                const SizedBox(
                  width: 8,
                ),
                RatingBar(
                  rating: rate,
                  icon: const Icon(
                    Icons.star,
                    size: 20,
                    color: Colors.grey,
                  ),
                  starCount: 5,
                  size: 20,
                  spacing: 1,
                  isIndicator: false,
                  allowHalfRating: true,
                  onRatingCallback: (value, isIndicator) => isIndicator.value,
                  color: Colors.orange,
                ),
              ],
            )
          ],
        ));
  }
}
