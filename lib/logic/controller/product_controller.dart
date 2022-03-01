import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/model/product_models.dart';
import 'package:shop/services/product_services.dart';

class ProductController extends GetxController {
  //.obs because data from internet ,,we need update
  var productList = <ProductModels>[].obs;
  var isLoading = true.obs;
  var storage = GetStorage();
  //var isFavorites = false.obs;
  var favoritesList = <ProductModels>[].obs;

  //search
  var searchList = <ProductModels>[].obs;
  TextEditingController searchEditController = TextEditingController();

// we have call to show image
  @override
  void onInit() {
    super.onInit();
    List? storageFavoritesList = storage.read<List>('isFavoritesList');

    //from internet to save when hut restart
    if (storageFavoritesList != null) {
      favoritesList = storageFavoritesList
          .map((e) => ProductModels.fromJson(e))
          .toList()
          .obs;
    }
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

//logic for favorite Screen
  // void addFavorites() {
  //   isFavorites.value = !isFavorites.value;
  // }

  void manageFavorites(int productId) {
    var excitingIndex =
        favoritesList.indexWhere((element) => element.id == productId);
    if (excitingIndex >= 0) {
      favoritesList.removeAt(excitingIndex);
      storage.remove('isFavoritesList');
    } else {
// make search where id click == id from productlist
      favoritesList
          .add(productList.firstWhere((element) => element.id == productId));
      //to save favoritesList when refrech app  dont clear
      storage.write('isFavoritesList', favoritesList);
    }
  }

  bool isFavorites(int productId) {
    return favoritesList.any((element) => element.id == productId);
  }

  //search bar logic
  void addSearchToList(String searchName) {
    searchName = searchName.toLowerCase();
    searchList.value = productList.where((searchProductModels) {
      var searchTitle = searchProductModels.title.toLowerCase();
      var searchPrice = searchProductModels.price.toString().toLowerCase();
      return searchTitle.contains(searchName) ||
          searchPrice.toString().contains(searchName);
    }).toList();

    update();
  }

  void clearSearch() {
    searchEditController.clear();
    addSearchToList('');
  }
}
