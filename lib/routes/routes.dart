import 'package:get/get.dart';
import 'package:shop/view/screens/auth/login_screen.dart';
import 'package:shop/view/screens/auth/signup_screen.dart';
import 'package:shop/view/screens/welcome_screen.dart';

class AppRoutes {
  //initialroutes
  static final welcome = Routes.welcomeScreen;
  static final login = Routes.loginScreen;
  static final signup = Routes.signUpScreen;
  //getPages as list

  static final routes = [
    GetPage(
      name: Routes.welcomeScreen,
      page: () => const WelcomeScreen(),
    ),
    GetPage(
      name: Routes.loginScreen,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.signUpScreen,
      page: () => SignupScreen(),
    ),
  ];
}

class Routes {
  static String welcomeScreen = '/welcomeScreen';
  static String loginScreen = '/loginScreen';
  static String signUpScreen = '/signupScreen';
}
