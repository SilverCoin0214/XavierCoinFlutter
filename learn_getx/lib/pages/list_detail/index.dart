// ignore_for_file: prefer_const_constructors

/*
 * @Author: sce
 * @Date: 2021-09-13 22:00:45
 * @LastEditTime: 2021-09-14 00:37:39
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/list_detail/index.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailView extends StatelessWidget {
  const DetailView({Key? key}) : super(key: key);

  _bulidBackListTileRow(Map? val) {
    return val == null
        ? Container()
        : ListTile(
            title: Text('传值 id = ' + val["id"].toString()),
            subtitle: Text('Get.back(result: {"success": true})'),
            onTap: () => Get.back(result: {"success": true}),
          );
  }

  @override
  Widget build(BuildContext context) {
    // final details = Get.arguments as Map;
    final parameters = Get.parameters;

    return Scaffold(
      appBar: AppBar(
        title: Text('详情页'),
      ),
      body: ListView(
        children: [
          ListTile(
            title: Text('导航-返回'),
            subtitle: Text('Get.back()'),
            onTap: () => Get.back(),
          ),
          // _bulidBackListTileRow(details),
          _bulidBackListTileRow(parameters),
        ],
      ),
    );
  }
}
