/*
 * @Author: your name
 * @Date: 2021-09-15 11:13:20
 * @LastEditTime: 2021-09-15 11:13:21
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/state_getBuilder/controller.dart
 */


import 'package:get/get.dart';

class CountController extends GetxController {
  final _count1 = 0.obs;
  set count(value) => _count1.value = value;
  get count => _count1.value;

  final _count2 = 0.obs;
  set count2(value) => _count2.value = value;
  get count2 => _count2.value;

  add() => _count1.value++;
  add2() => _count2.value++;
}
