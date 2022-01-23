import 'package:get/get.dart';

class AuthController extends GetxController {
  late bool isVisibility = false;
  late bool isCheckedBox = false;
  void visibility() {
    isVisibility = !isVisibility;
    update();
  }

  void checkedBox() {
    isCheckedBox = !isCheckedBox;
    update();
  }
}
