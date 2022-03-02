import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/category_controller.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/view/widgets/category/category_item.dart';

class CategoryWidget extends StatelessWidget {
  CategoryWidget({Key? key}) : super(key: key);
  final controller = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        if (controller.isCategoryLoading.value) {
          return Center(
            child: CircularProgressIndicator(
              color: Get.isDarkMode ? pinkClr : mainColor,
            ),
          );
        } else {
          return Expanded(
            child: ListView.separated(
                controller: ScrollController(),
                itemBuilder: (context, index) {
                  return InkWell(
                      onTap: () {
                        controller.getCategoryIndex(index);
                        Get.to(() => CategoryItems(
                              categoryTitle: controller.categoryNameList[index],
                            ));
                      },
                      child: Container(
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image:
                                  NetworkImage(controller.imageCategory[index]),
                              fit: BoxFit.cover,
                            )),
                        child: Padding(
                          padding: EdgeInsets.only(left: 20, bottom: 15),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Text(
                              controller.categoryNameList[index],
                              //  'mens',
                              style: const TextStyle(
                                backgroundColor: Colors.black38,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ));
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 20,
                    ),
                itemCount: controller.categoryNameList.length),
          );
        }
      },
    );
  }
}
