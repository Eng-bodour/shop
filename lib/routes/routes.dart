import 'package:get/get.dart';
import 'package:shop/logic/bindings/auth_binding.dart';
import 'package:shop/logic/bindings/main_binding.dart';
import 'package:shop/logic/bindings/product_binding.dart';
import 'package:shop/view/screens/auth/forgot_screen.dart';

import 'package:shop/view/screens/auth/login_screen.dart';
import 'package:shop/view/screens/auth/signup_screen.dart';
import 'package:shop/view/screens/cart_screen.dart';
import 'package:shop/view/screens/main_screen.dart';
import 'package:shop/view/screens/welcome_screen.dart';

class AppRoutes {
  //initialroutes
  static final welcome = Routes.welcomeScreen;
  static final main = Routes.mainScreen;

  //getPages as list

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => LoginScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignupScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
      name: Routes.forgotPassword,
      page: () => ForgotPasswordScreen(),
      binding: AuthBinding(),
    ),
    GetPage(
        name: Routes.mainScreen,
        page: () => MainScreen(),
        bindings: [AuthBinding(), MainBinding(), ProductBinding()]),
    GetPage(
      name: Routes.cartScreen,
      page: () => CartScreen(),
      bindings: [AuthBinding(), ProductBinding()],
    ),
  ];
}

class Routes {
  static String welcomeScreen = '/welcomeScreen';
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/signupScreen';
  static String forgotPassword = '/forgotPassword';
  static String mainScreen = '/mainScreen';
  static String cartScreen = '/cartScreen';
}
