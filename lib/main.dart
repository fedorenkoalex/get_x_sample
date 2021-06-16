import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:test_getx/data/models/local/post_model.dart';
import 'package:test_getx/routes/routes.dart';

import 'locales/locales.dart';

void main() async {
  await Hive.initFlutter();
  registerHiveAdapters();
  runApp(MyApp());
}

void registerHiveAdapters() {
  Hive.registerAdapter(PostModelAdapter());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter GetX Demo',
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
