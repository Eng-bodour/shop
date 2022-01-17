import 'package:get/get.dart';
import 'package:shop/view/screens/welcome_screen.dart';

class AppRoutes {
  //initialroutes
  static final welcome = Routes.welcomeScreen;
  //getPages as list

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
  ];
}

class Routes {
  static String welcomeScreen = '/welcomescreen';
}
