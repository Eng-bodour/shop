import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/product_controller.dart';

class SearchFormText extends StatelessWidget {
  SearchFormText({Key? key}) : super(key: key);

// for arrive to TextEditingControoler,
  final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) => TextField(
        controller: controller.searchEditController,
        cursorColor: Colors.black,
        keyboardType: TextInputType.text,
        onChanged: (searchName) {
          controller.addSearchToList(searchName);
        },
        decoration: InputDecoration(
          fillColor: Colors.white,
          focusColor: Colors.red,
          filled: true,
          hintText: 'Search with name and price',
          hintStyle: const TextStyle(
            color: Colors.black45,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          suffixIcon: controller.searchEditController.text.isEmpty
              ? null
              : IconButton(
                  onPressed: () {
                    controller.clearSearch();
                  },
                  icon: const Icon(
                    Icons.close,
                    color: Colors.black,
                  ),
                ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.white)),
        ),
      ),
    );
  }
}
