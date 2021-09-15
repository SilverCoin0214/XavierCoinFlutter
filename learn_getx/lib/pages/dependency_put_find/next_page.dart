/*
 * @Author: your name
 * @Date: 2021-09-15 12:09:19
 * @LastEditTime: 2021-09-15 12:12:24
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/dependency_put_find/next_page.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/dependency_put_find/controller.dart';

class NextPageView extends StatelessWidget {
  NextPageView({Key? key}) : super(key: key);

  final controller = Get.find<CountController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('nextPage'),
      ),
      body: Center(
        child: Column(children: [GetX<CountController>(
          init: controller,
          initState: (_) {},
          builder: (_) {
            return Text('value => ${_.count} ');
          },
        ), Divider(),]),
      ),
    );
  }
}
