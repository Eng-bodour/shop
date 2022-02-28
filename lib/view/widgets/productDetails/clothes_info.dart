import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:readmore/readmore.dart';
import 'package:shop/logic/controller/product_controller.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/text_utilis.dart';
//import 'package:readmore/readmore.dart';

class ClothesInfo extends StatelessWidget {
  final String title;
  final int id;
  final double rate;
  final String description;

  ClothesInfo({
    required this.title,
    required this.id,
    required this.rate,
    required this.description,
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
                const SizedBox(
                  height: 8,
                ),
                RatingBarIndicator(
                  rating: rate,
                  itemBuilder: (context, index) => const Icon(
                    Icons.star,
                    color: Colors.orange,
                  ),
                  itemCount: 5,
                  itemPadding: const EdgeInsets.only(left: 4),
                  itemSize: 20.0,
                  direction: Axis.horizontal,
                ),
              ],
            ),

            const SizedBox(
              height: 20,
            ),
            ReadMoreText(
              description,
              trimLines: 3,
              textAlign: TextAlign.justify,
              trimCollapsedText: 'Show More',
              trimExpandedText: 'Show Less',
              style: TextStyle(
                  color: Get.isDarkMode ? Colors.white : Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  height: 2),
              lessStyle: TextStyle(
                color: Get.isDarkMode ? pinkClr : mainColor,
                fontWeight: FontWeight.bold,
              ),
              moreStyle: TextStyle(
                color: Get.isDarkMode ? pinkClr : mainColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            //this
          ],
        ));
  }
}
