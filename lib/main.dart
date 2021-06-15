import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/routes/routes.dart';

import 'locales/locales.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      translations: AppLocales(),
      locale: Get.deviceLocale,
      fallbackLocale: Locale('en', 'US'),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: AppPages.initial,
      getPages: AppPages.routes,
    );
  }
}
