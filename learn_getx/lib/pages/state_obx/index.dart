/*
 * @Author: your name
 * @Date: 2021-09-14 16:26:09
 * @LastEditTime: 2021-09-14 16:29:13
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/state_obx/index.dart
 */
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StateObxView extends StatelessWidget {
  StateObxView({Key? key}) : super(key: key);

  final count = 0.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Obx(...)')),
      body: Center(
        child: Column(
          children: [
            Obx(() => Text("count1 ->" + count.toString())),
            Obx(() => Text("count1 ->" + count.toString())),
            Divider(),
            ElevatedButton(
                onPressed: () {
                  count.value++;
                },
                child: Text('add')),
          ],
        ),
      ),
    );
  }
}
