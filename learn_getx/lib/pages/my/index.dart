// ignore_for_file: prefer_const_constructors

/*
 * @Author: sce
 * @Date: 2021-09-14 00:56:52
 * @LastEditTime: 2021-09-14 00:58:44
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/my/index.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/common/routes/app_pages.dart';

class MyView extends StatelessWidget {
  const MyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('我的'),
      ),
      body: ListTile(
        title: Text('返回首页'),
        subtitle: Text('Get.offAllNamed(AppRoutes.Home)'),
        onTap: () => Get.offAllNamed(AppRoutes.Home),
      )
    );
  }
}
