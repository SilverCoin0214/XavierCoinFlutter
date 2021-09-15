// ignore_for_file: avoid_print

/*
 * @Author: your name
 * @Date: 2021-09-15 11:38:02
 * @LastEditTime: 2021-09-15 11:48:13
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/state_workers/controller.dart
 */

import 'package:get/get.dart';

class CounterController extends GetxController {
  final _count = 0.obs;
  set count(value) => _count.value = value;
  get count => _count.value;

  add() => _count.value++;

  @override
  void onInit() {
    super.onInit();

    // 每次
    ever(_count, (value) {
      print('ever -> ' + value.toString());
    });

    // 仅第一次
    once(_count, (value) {
      print('once -> ' + value.toString());
    });

    // 防抖
    debounce(_count, (value) {
      print('debounce ->' + value.toString());
    }, time: Duration(seconds: 2));

    // 定时器1秒
    interval(_count, (value) {
      print('interval -> ' + value.toString());
    }, time: Duration(seconds: 1));
  }
}
