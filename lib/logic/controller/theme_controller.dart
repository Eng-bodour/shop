import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ThemeController {
  final GetStorage boxStorage = GetStorage();
  final String key = 'isDarkModes';

  saveThemeDataInBox(bool isDark) {
    boxStorage.write(key, isDark);
  }

  bool getThemeDataFromBox() {
    // if can null make defaults false (?? false)
    return boxStorage.read<bool>(key) ?? false;
  }

  ThemeMode get themeDataGet =>
      getThemeDataFromBox() ? ThemeMode.dark : ThemeMode.light;

  void cangesTheme() {
    Get.changeThemeMode(
        getThemeDataFromBox() ? ThemeMode.light : ThemeMode.dark);
    // ! put ,because value save reflect put value
    saveThemeDataInBox(!getThemeDataFromBox());
  }
}
