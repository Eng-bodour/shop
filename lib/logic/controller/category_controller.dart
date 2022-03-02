import 'package:get/get.dart';
import 'package:shop/services/category_service.dart';

class CategoryController extends GetxController {
  var categoryNameList = <String>[].obs;
  var isCategoryLoading = false.obs;
  List<String> imageCategory = [
    "https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg",
    "https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_ML3_.jpg",
    "https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg",
    "https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg",
  ];
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getCategorys();
  }

  void getCategorys() async {
    var categoryName = await CategoryService.getCategory();
    try {
      isCategoryLoading(true);
      if (categoryName.isNotEmpty) {
        categoryNameList.addAll(categoryName);
      }
    } finally {
      isCategoryLoading(false);
    }
  }
}
