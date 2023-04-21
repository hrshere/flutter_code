import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_learning/locales/translations.dart';

void main()=> runApp(const SystemLocaleApp());

class SystemLocaleApp extends StatelessWidget {
  const SystemLocaleApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var locale = Locale('de','DE');
    Get.updateLocale(locale);
    return GetMaterialApp(
      translationsKeys: MyClass.translationsKeys,
      // locale: Get.deviceLocale,
        // Locale locale = new Locale('de-DE');
    home:  Text('hello'.tr),

    );
  }
}
