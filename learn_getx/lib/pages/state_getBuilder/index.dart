// ignore_for_file: prefer_const_constructors, avoid_print

/*
 * @Author: your name
 * @Date: 2021-09-15 11:13:34
 * @LastEditTime: 2021-09-15 11:25:01
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/learn_getx/lib/pages/state_getBuilder/index.dart
 */

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:learn_getx/pages/state_getx/controller.dart';

class StateGetBuilderView extends StatelessWidget {
  StateGetBuilderView({Key? key}) : super(key: key);

  final controller = CountController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GetBuilder'),
      ),
      body: Center(
        child: Column(
          children: [
            GetBuilder<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print('GetBuilder - 1');
                return Text('value - ${_.count}');
              },
            ),
            GetBuilder<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetBuilder - 2");
                return Text('value -> ${_.count}');
              },
            ),
            Divider(),
            GetBuilder<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetBuilder - 3");
                return Column(
                  children: [
                    Text('value - ${_.count}'),
                    ElevatedButton(
                        onPressed: () {
                          _.add();
                        },
                        child: Text('GetBuilder -> add'),
                    )
                  ],
                );
              },
            ),
            Divider(),
            // count2
            GetBuilder<CountController>(
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetBuilder - 4");
                return Text('value count2 -> ${_.count2}');
              },
            ),
            Divider(),

            // id2
            GetBuilder<CountController>(
              id: "id2",
              init: controller,
              initState: (_) {},
              builder: (_) {
                print("GetBuilder - 4");
                return Text('id2 -> value count2 -> ${_.count2}');
              },
            ),
            Divider(),

            // 按钮
            ElevatedButton(
              onPressed: () {
                controller.add();
              },
              child: Text('add'),
            ),

            ElevatedButton(
              onPressed: () {
                controller.add2();
              },
              child: Text('add2'),
            ),

            ElevatedButton(
              onPressed: () {
                controller.update();
              },
              child: Text('controller.update()'),
            ),

            ElevatedButton(
              onPressed: () {
                controller.update(["id2"]);
              },
              child: Text('controller.update(id2)'),
            ),


          ],
        ),
      ),
    );
  }
}
