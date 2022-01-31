import 'package:get/get.dart';
import 'package:shop/model/product_models.dart';
import 'package:shop/services/product_services.dart';

class ProductController extends GetxController {
  //.obs because data from internet ,,we need update
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
// we have call to show image
  @override
  void onInit() {
    super.onInit();
    getProducts();
  }

  void getProducts() async {
    var producs = await ProductService.getProduct();
    try {
      isLoading.value = true; // or isLoading(true)
      if (producs.isNotEmpty) {
        productList.addAll(producs);
      }
    } finally {
      isLoading(false);
    }
  }
}
