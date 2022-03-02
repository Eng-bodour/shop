import 'package:http/http.dart' as http;

import 'package:shop/model/category_model.dart';
import 'package:shop/model/product_models.dart';

import 'package:shop/utils/my_string.dart';

class CategoryService {
  static Future<List<String>> getCategory() async {
    var response = await http.get(Uri.parse('$baseUrl/products/categories'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return categoryModelFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}

class AllCategoryServices {
  static Future<List<ProductModels>> getAllCategory(
      String categoreNames) async {
    var response =
        await http.get(Uri.parse('$baseUrl/products/category/$categoreNames'));
    if (response.statusCode == 200) {
      var jsonData = response.body;
      return productModelsFromJson(jsonData);
    } else {
      return throw Exception('Failed to load product');
    }
  }
}
