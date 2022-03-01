import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shop/logic/controller/product_controller.dart';
import 'package:shop/model/product_models.dart';
import 'package:shop/view/widgets/productDetails/clothes_info.dart';
import 'package:shop/view/widgets/productDetails/image_sliders.dart';
import 'package:shop/view/widgets/productDetails/add_cart.dart';

import '../widgets/productDetails/size_list.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModels productModels;
  const ProductDetailsScreen({
    required this.productModels,
    Key? key,
  }) : super(key: key);
  // final controller = Get.find<ProductController>();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: context.theme.backgroundColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ImageSlider(
                imageUrl: productModels.image,
              ),
              ClothesInfo(
                title: productModels.title,
                id: productModels.id,
                rate: productModels.rating.rate,
                description: productModels.description,
              ),
              SizeList(),
              AddCart(
                price: productModels.price,
                productModels: productModels,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
