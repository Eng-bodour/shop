import 'package:get/route_manager.dart';
import 'package:shop/utils/theme.dart';
import 'package:shop/language/en.dart';
import 'package:shop/language/ar.dart';
import 'package:shop/language/fr.dart';

class LocalizationApp extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        ara: ar,
        frf: fr,
        ene: en,
      };
}
