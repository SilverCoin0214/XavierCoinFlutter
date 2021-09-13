// ignore_for_file: prefer_const_constructors

/*
 * @Author: your name
 * @Date: 2021-09-14 00:41:36
 * @LastEditTime: 2021-09-14 00:44:01
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/notfound/index.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/common/routes/app_pages.dart';

class NotfoundView extends StatelessWidget {
  const NotfoundView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由没有找到'),
      ),
      body: ListTile(
        title: Text('返回首页'),
        subtitle: Text('Get.offAllNamed(AppRoutes.Home)'),
        onTap: () => Get.offAllNamed(AppRoutes.Home),
      ),
    );
  }
}
