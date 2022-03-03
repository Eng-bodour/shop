import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/utils/theme.dart';

class SettingController extends GetxController {
  final switchValue = false.obs;
  var storage = GetStorage();
  var langLocal = ene;

  //language
  @override
  void onInit() async {
    // TODO: implement onInit
    super.onInit();
    langLocal = await getLanguage;
  }

  void saveLanguage(String typeLang) async {
    await storage.write("lang", typeLang);
  }

  Future<String> get getLanguage async {
    return await storage.read("lang");
  }

  void changeLanguage(String typeLang) {
    saveLanguage(typeLang);
    if (langLocal == typeLang) {
      return;
    }
    if (typeLang == frf) {
      langLocal = frf;
      saveLanguage(frf);
    } else if (typeLang == ara) {
      langLocal = ara;
      saveLanguage(ara);
    } else {
      langLocal = ene;
      saveLanguage(ene);
    }
    update();
  }
}
