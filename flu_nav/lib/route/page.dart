/*
 * @Author: your name
 * @Date: 2022-03-03 14:47:26
 * @LastEditTime: 2022-03-03 14:50:15
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/flu_nav/lib/route/page.dart
 */

import 'package:flutter/material.dart';

class MyPage<T> extends Page<T> {
  const MyPage({
    required LocalKey key,
    required String name,
    required this.builder,
  }) : super(key: key, name: name);

  final WidgetBuilder builder;

  @override
  Route<T> createRoute(BuildContext context) {
    return MaterialPageRoute(
      builder: builder,
      settings: this,
    );
  }

  @override
  String toString() => "$name";
}
