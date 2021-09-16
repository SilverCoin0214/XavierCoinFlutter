/*
 * @Author: your name
 * @Date: 2021-09-16 10:01:03
 * @LastEditTime: 2021-09-16 10:02:19
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/nested_navigation/binding.dart
 */

import 'package:get/get.dart';
import 'package:learn_getx/pages/nested_navigation/controller.dart';

class NestedBinding extends Bindings {

  @override
  dependencies() {
    Get.lazyPut(() => NestedController());
  }
}
