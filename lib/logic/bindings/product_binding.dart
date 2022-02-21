import 'package:get/get.dart';
import 'package:shop/logic/controller/cart_controller.dart';
import 'package:shop/logic/controller/product_controller.dart';

class ProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ProductController());
    //no run direcory if click run then
    Get.lazyPut(() => CartController());
  }
}
