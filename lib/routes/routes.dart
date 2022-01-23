import 'package:get/get.dart';
import 'package:shop/logic/bindings/auth_binding.dart';
import 'package:shop/view/screens/auth/forgot_screen.dart';

import 'package:shop/view/screens/auth/login_screen.dart';
import 'package:shop/view/screens/auth/signup_screen.dart';
import 'package:shop/view/screens/welcome_screen.dart';

class AppRoutes {
  //initialroutes
  static final welcome = Routes.welcomeScreen;
  static final login = Routes.loginScreen;
  static final signup = Routes.signUpScreen;
  static final forgot = Routes.forgotPassword;
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
  ];
}

class Routes {
  static String welcomeScreen = '/welcomeScreen';
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/signupScreen';
  static String forgotPassword = '/forgotPassword';
}
