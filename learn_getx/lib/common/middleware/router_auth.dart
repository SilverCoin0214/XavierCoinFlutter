// ignore_for_file: prefer_const_constructors

/*
 * @Author: your name
 * @Date: 2021-09-14 00:59:48
 * @LastEditTime: 2021-09-14 01:03:08
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/common/middleware/router_auth.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/common/routes/app_pages.dart';

class RouteAuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    Future.delayed(Duration(seconds: 1), () => Get.snackbar("提示", "请先登录APP"));
    return RouteSettings(name: AppRoutes.Login);
  }
}
