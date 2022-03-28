/*
 * @Author: your name
 * @Date: 2022-03-03 14:36:42
 * @LastEditTime: 2022-03-03 16:56:07
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/flu_nav/lib/pages/list.dart
 */

import 'package:flu_nav/route/router_delegate.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeG'),
      ),
      body: Material(
        color: Colors.brown,
        child: Center(
          child: MaterialButton(
            onPressed: () {
              MyRouteDelegate.of(context).toName("/list");
            },
            child: const Text('HomeG'),
        ),
        ),
      ),
    );
  }
}
