import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:shop/view/screens/category_screen.dart';
import 'package:shop/view/screens/favorite_screen.dart';
import 'package:shop/view/screens/home_screen.dart';
import 'package:shop/view/screens/setting_screen.dart';

class MainController extends GetxController {
  RxInt currentIndex = 0.obs;

  final tabs = [
    HomeScreen(),
    CategoryScreen(),
    FavoriteScreen(),
    SettingScreen(),
  ].obs;

  final title = ['Bodour shop', 'Categories', 'Favorites', 'Settings'].obs;
}
