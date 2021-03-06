import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shop/language/localization.dart';
import 'package:shop/logic/controller/theme_controller.dart';
import 'package:shop/routes/routes.dart';
import 'package:shop/utils/theme.dart';

void main() async {
  await GetStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'bodour shop',
      debugShowCheckedModeBanner: false,
      locale: Locale(GetStorage().read<String>("lang").toString()),
      translations: LocalizationApp(),
      //  fallbackLocale: Locale(ene), في حال كان في مشكلة لاللغة
      fallbackLocale: Locale(ene),
      theme: ThemesApp.light,
      darkTheme: ThemesApp.dark,
      themeMode: ThemeController().themeDataGet,
      //you have user(FirebaseAuth.instance.currentUser != null from firebase)||(gmail and facebook log in (GetStorage().read<bool>('auth') == true))
      initialRoute: FirebaseAuth.instance.currentUser != null ||
              GetStorage().read<bool>('auth') == true
          ? AppRoutes.main
          : AppRoutes.welcome,
      getPages: AppRoutes.routes,
    );
  }
}
