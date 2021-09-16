/*
 * @Author: your name
 * @Date: 2021-09-13 21:57:57
 * @LastEditTime: 2021-09-16 10:16:02
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/list/index.dart
 */

import 'package:flutter/material.dart';

class ListIndexView extends StatelessWidget {
  const ListIndexView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表页"),
      ),
      body: Center(
        child: Container(
          child: Text("列表页"),
        ),
      ),
    );
  }
}
