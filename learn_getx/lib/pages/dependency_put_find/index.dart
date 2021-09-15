/*
 * @Author: your name
 * @Date: 2021-09-15 12:03:48
 * @LastEditTime: 2021-09-15 12:09:06
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/dependency_put_find/index.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/dependency_put_find/controller.dart';
import 'package:learn_getx/pages/dependency_put_find/next_page.dart';

class StateDependencyPutFindView extends StatelessWidget {
  StateDependencyPutFindView({Key? key}) : super(key: key);

  final controller = Get.put<CountController>(CountController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dependency'),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                return Text('value - ${_.count}');
              },
            ),
            Divider(),

            // 按钮
            ElevatedButton(
              onPressed: () {
                controller.add();
              },
              child: Text('add'),
            ),

            // 跳转
            ElevatedButton(
              onPressed: () {
                Get.to(NextPageView());
              },
              child: Text('next page'),
            ),
          ],
        ),
      ),
    );
  }
}
