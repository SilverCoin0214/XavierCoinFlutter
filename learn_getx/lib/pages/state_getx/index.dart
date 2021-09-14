// ignore_for_file: prefer_const_constructors

/*
 * @Author: your name
 * @Date: 2021-09-14 16:47:08
 * @LastEditTime: 2021-09-14 17:31:22
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/state_getx/index.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learn_getx/pages/state_getx/controller.dart';

class StateGetxView extends StatelessWidget {
  StateGetxView({Key? key}) : super(key: key);

  final controller = CountController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GetX"),
      ),
      body: Center(
        child: Column(
          children: [
            GetX<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetX - 1");
                return Text('value 1 -> ${_.count}');
              },
            ),
            GetX<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetX - 2");
                return Text('value 2 -> ${_.count}');
              },
            ),
            Divider(),
            GetX<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print('GetX - 3');
                return Column(
                  children: [
                    Text('value 3 -> ${_.count}'),
                    ElevatedButton(
                        onPressed: () {
                          _.add();
                        },
                        child: Text('count1')),
                  ],
                );
              },
            ),
            Divider(),
            GetX<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print('GetX - 4');
                return Text('value 4 -> ${_.count2}');
              },
            ),
            Divider(),
            ElevatedButton(
                onPressed: () {
                  controller.add();
                },
                child: Text('count1')),
            ElevatedButton(
                onPressed: () {
                  controller.add2();
                },
                child: Text('count2')),
          ],
        ),
      ),
    );
  }
}
