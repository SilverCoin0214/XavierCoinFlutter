/*
 * @Author: sce
 * @Date: 2021-09-13 19:00:48
 * @LastEditTime: 2021-09-14 00:45:59
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/main.dart
 */

import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:learn_getx/common/routes/app_pages.dart';

Future<void> main() async {
  return runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      unknownRoute: AppPages.unkonwnRoute,
    );
  }
}
