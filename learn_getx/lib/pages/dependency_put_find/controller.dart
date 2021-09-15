/*
 * @Author: your name
 * @Date: 2021-09-15 12:02:27
 * @LastEditTime: 2021-09-15 12:03:42
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/dependency_put_find/controller.dart
 */

import 'package:get/get.dart';

class CountController extends GetxController {
  final _count = 0.obs;
  set count(value) => _count.value = value;
  get count => _count.value;

  add() => _count.value++;

  @override
  void onInit() {
    super.onInit();
    print("onInit");
  }

  @override
  void onClose() {
    super.onClose();
    print("onClose");
  }
}
