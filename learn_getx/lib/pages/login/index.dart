// ignore_for_file: prefer_const_constructors

/*
 * @Author: your name
 * @Date: 2021-09-14 00:54:36
 * @LastEditTime: 2021-09-14 00:56:25
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/login/index.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/common/routes/app_pages.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: ListTile(
        title: Text('返回首页'),
        subtitle: Text('Get.offAllNamed(AppRoutes.Home)'),
        onTap: () => Get.offAllNamed(AppRoutes.Home),
      ),
    );
  }
}
