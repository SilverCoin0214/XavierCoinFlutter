/*
 * @Author: your name
 * @Date: 2022-03-03 11:15:13
 * @LastEditTime: 2022-03-03 11:20:11
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/flu_nav/lib/ex_02_named.dart
 */

import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const NavigatorApp());
}

class NavigatorApp extends StatelessWidget {
  const NavigatorApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => const ListPage(),
        '/details': (context) => const DetailPage(),
      },
    );
  }
}

class ListPage extends StatelessWidget {
  const ListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
            onPressed: () {
              Navigator.pushNamed(context, "/details");
            },
            child: const Text('navigator.pushNamed => detail2222')),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
           onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Navigator.pop -> Pop222')),
        ),
      );
  }
}
