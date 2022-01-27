import 'package:get/get.dart';
import 'package:shop/logic/controller/main_controller.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MainController());
  }
}
