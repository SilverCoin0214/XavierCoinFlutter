/*
 * @Author: your name
 * @Date: 2021-09-16 10:03:11
 * @LastEditTime: 2021-09-16 10:10:30
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/nested_navigation/index.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/nested_navigation/controller.dart';

class NestedNavView extends GetView<NestedController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('嵌套路由')
      ),
      body: Container(
        color: Colors.amber,
        child: Column(
          children: [
            Container(
              child: Text('占位条'),
              height: 100,
            ),
            SizedBox(
              height: 300,
              child: Navigator(
                key: Get.nestedKey(1),
                initialRoute: '/list',
                onGenerateRoute: controller.onGenerateRoute,
              ),
            ),
          ],
        )
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '列表',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.details),
              label: '详情',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.login),
              label: '登录',
            ),
          ],
          currentIndex: controller.currentIndex.value,
          selectedItemColor: Colors.pink,
          onTap: controller.changePage,
        ),
      ),
    );
  }
}
