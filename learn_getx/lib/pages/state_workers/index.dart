/*
 * @Author: your name
 * @Date: 2021-09-15 11:42:46
 * @LastEditTime: 2021-09-15 11:49:03
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/state_workers/index.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/pages/state_workers/controller.dart';

class StateWorderView extends StatelessWidget {
  StateWorderView({Key? key}) : super(key: key);

  final controller = CounterController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetBuilder'),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<CounterController>(
                init: controller,
                initState: (_) {},
                builder: (_) {
                  return Text('value -> ${_.count}');
                }),
            ElevatedButton(
              onPressed: () {
                controller.add();
              },
              child: Text('add'),
            ),
          ],
        ),
      ),
    );
  }
}
