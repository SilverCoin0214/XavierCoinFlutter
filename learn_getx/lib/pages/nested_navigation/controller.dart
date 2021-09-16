/*
 * @Author: your name
 * @Date: 2021-09-16 09:52:52
 * @LastEditTime: 2021-09-16 13:46:26
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/nested_navigation/controller.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/login/index.dart';
import 'package:learn_getx/pages/list/index.dart';
import 'package:learn_getx/pages/list_detail/index.dart';

class NestedController extends GetxController {
  static NestedController get to => Get.find();

  var currentIndex = 0.obs;

  final pages = <String>['/list', '/detail', '/login'];

  void changePage(int index) {
    currentIndex.value = index;
    Get.toNamed(pages[index], id: 1, arguments: {'ceshi': 'why'});
  }

  Route? onGenerateRoute(RouteSettings settings) {
    if (settings.name == '/login') {
      return GetPageRoute(
        settings: settings,
        page: () => LoginView(),
        transition: Transition.topLevel,
      );
    } else if (settings.name == '/list') {
      return GetPageRoute(
        settings: settings,
        page: () => ListView(),
        transition: Transition.rightToLeftWithFade,
      );
    } else if (settings.name == '/detail') {
      return GetPageRoute(
        settings: settings,
        page: () => DetailView(),
        transition: Transition.fadeIn,
      );
    }

    return null;
  }
}
