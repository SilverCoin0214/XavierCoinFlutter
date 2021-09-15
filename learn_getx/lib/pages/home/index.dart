// ignore_for_file: prefer_const_constructors

/*
 * @Author: sce
 * @Date: 2021-09-13 21:40:08
 * @LastEditTime: 2021-09-15 12:16:42
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/home/index.dart
 * https://ducafecat.tech/2021/04/05/flutter-getx/flutter-getx-01-router-middleware
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/common/routes/app_pages.dart';
import 'package:learn_getx/pages/list_detail/index.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('首页'),
      ),
      body: ListView(
        children: [
          // 导航
          ListTile(
            title: Text("导航-命名路由 home > list"),
            subtitle: Text('Get.toNamed("/home/list")'),
            onTap: () => Get.toNamed("/home/list"),
          ),
          ListTile(
            title: Text("导航-命名路由 home > list > detail"),
            subtitle: Text('Get.toNamed("/home/list/detail")'),
            onTap: () => Get.toNamed("/home/list/detail"),
          ),
          ListTile(
            title: Text("导航-类对象"),
            subtitle: Text("Get.to(DetailView())"),
            onTap: () => Get.to(DetailView()),
          ),
          Divider(),


          ListTile(
            title: Text('导航 - 清除上一个路由'),
            subtitle: Text('Get.off(DetailView())'),
            onTap: () => Get.off(DetailView()),
          ),
          ListTile(
            title: Text('导航 - 清除所有路由'),
            subtitle: Text('Get.offAll(DetailView())'),
            onTap: () => Get.offAll(DetailView()),
          ),
          Divider(),


          ListTile(
            title: Text('导航 - arguments传值 + 返回值'),
            subtitle: Text(
                'Get.toNamed("/home/list/detail", arguments: {"id": 999})'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail",
                  arguments: {"id": 999});
              Get.snackbar("返回值", "success -> " + result["success"].toString());
            },
          ),

          ListTile(
            title: Text('导航 - parameters传值 + 返回值'),
            subtitle: Text(
                'Get.toNamed("/home/list/detail?id=666", arguments: {"ls": 333})'),
            onTap: () async {
              var result = await Get.toNamed("/home/list/detail?id=666",
                  arguments: {"ls": 333});
              Get.snackbar("返回值", "success -> " + result["success"].toString());
            },
          ),

          ListTile(
              title: Text('导航 - 参数传值 + 返回值'),
              subtitle: Text('Get.toNamed("/home/list/detail/777")'),
              onTap: () async {
                var result = await Get.toNamed("/home/list/detail/777");
                Get.snackbar("返回值", "success -> " + result["success"].toString());
              }),
          Divider(),


          ListTile(
            title:  Text('导航 - Not found'),
            subtitle: Text('Get.toNamed("/aaa/bbb/ccc");'),
            onTap: () => Get.toNamed("aaa/bbb/ccc"),
          ),

          ListTile(
            title: Text('导航 - 中间件 - 认证Auth'),
            subtitle: Text('Get.toNamed(AppRoutes.My)'),
            onTap: () => Get.toNamed(AppRoutes.My),
          ),
          Divider(),

          ListTile(
            title: Text('Obx()使用'),
            subtitle: Text('Get.toNamed(AppRoutes.Obx)'),
            onTap: () => Get.toNamed(AppRoutes.Obx),
          ),

          ListTile(
            title: Text('GetX()使用'),
            subtitle: Text('Get.toNamed(AppRoutes.Getx)'),
            onTap: () => Get.toNamed(AppRoutes.Getx),
          ),

          ListTile(
            title: Text('Getbuilder()使用'),
            subtitle: Text('Get.toNamed(AppRoutes.Getbuilder)'),
            onTap: () => Get.toNamed(AppRoutes.Getbuilder),
          ),

          ListTile(
            title: Text('Worker()使用'),
            subtitle: Text('Get.toNamed(AppRoutes.Worker)'),
            onTap: () => Get.toNamed(AppRoutes.Worker),
          ),
          Divider(),

          // 依赖注入
          ListTile(
            title: Text("Dependency-Put-Find"),
            subtitle: Text('Get.toNamed(AppRoutes.DependencyPutFind)'),
            onTap: () =>
                Get.toNamed(AppRoutes.Dependency + AppRoutes.DependencyPutFind),
          ),

        ],
      ),
    );
  }
}
