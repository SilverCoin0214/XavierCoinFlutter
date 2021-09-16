// ignore_for_file: prefer_const_constructors

/*
 * @Author: sce
 * @Date: 2021-09-13 21:45:21
 * @LastEditTime: 2021-09-16 10:16:09
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/common/app_pages.dart
 */

import 'package:get/get.dart';
import 'package:learn_getx/common/middleware/router_auth.dart';
import 'package:learn_getx/pages/dependency_put_find/index.dart';
import 'package:learn_getx/pages/home/index.dart';
import 'package:learn_getx/pages/list/index.dart';
import 'package:learn_getx/pages/list_detail/index.dart';
import 'package:learn_getx/pages/login/index.dart';
import 'package:learn_getx/pages/my/index.dart';
import 'package:learn_getx/pages/nested_navigation/binding.dart';
import 'package:learn_getx/pages/nested_navigation/index.dart';
import 'package:learn_getx/pages/notfound/index.dart';
import 'package:learn_getx/pages/state_getBuilder/index.dart';
import 'package:learn_getx/pages/state_getx/index.dart';
import 'package:learn_getx/pages/state_obx/index.dart';
import 'package:learn_getx/pages/state_workers/index.dart';

part 'app_routes.dart';

class AppPages {
  static const INITIAL = AppRoutes.Home;

  static final routes = [
    GetPage(
      name: AppRoutes.Login,
      page: () => LoginView(),
    ),

    GetPage(
      name: AppRoutes.My,
      page: () => MyView(),
      middlewares: [
        RouteAuthMiddleware(),
      ]
    ),

    GetPage(name: AppRoutes.Obx, page: () => StateObxView()),
    GetPage(name: AppRoutes.Getx, page: () => StateGetxView()),
    GetPage(name: AppRoutes.Getbuilder, page: () => StateGetBuilderView()),
    GetPage(name: AppRoutes.Worker, page: () => StateWorderView()),


    // 控制器依赖注入
    GetPage(
      name: AppRoutes.Dependency,
      page: () => StateDependencyPutFindView(),
      children: [
        GetPage(
              name: AppRoutes.DependencyPutFind,
              page: () => StateDependencyPutFindView()),
      ]
    ),

    // 嵌套导航
    GetPage(
      name: AppRoutes.NestedNavigator,
      page: () => NestedNavView(),
      binding: NestedBinding(),
    ),

    GetPage(name: AppRoutes.Home, page: () => HomeView(), children: [
      GetPage(name: AppRoutes.List, page: () => ListIndexView(), children: [
        GetPage(
          name: AppRoutes.Detail,
          page: () => DetailView(),
        ),
        GetPage(
          name: AppRoutes.Detail_ID,
          page: () => DetailView(),
        )
      ]),
    ]),
  ];

  static final unkonwnRoute = GetPage(
    name: AppRoutes.NotFound,
    page: () => NotfoundView(),
  );
}
