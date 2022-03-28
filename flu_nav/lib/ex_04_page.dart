/*
 * @Author: your name
 * @Date: 2022-03-03 14:28:22
 * @LastEditTime: 2022-03-03 15:07:02
 * @LastEditors: Please set LastEditors
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/flu_nav/lib/ex_04_page.dart
 */

import 'package:flu_nav/pages/home.dart';
import 'package:flu_nav/pages/list.dart';
import 'package:flu_nav/route/page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _navigatorKey = GlobalKey<NavigatorState>();
  final pages = [
    MyPage(
      key: const ValueKey('/'),
      name: '/home',
      builder: (context) => const HomePage(),
    ),
    MyPage(
      key: const ValueKey('/list'),
      name: '/list',
      builder: (context) => ListPage(),
    )
  ];

  bool _onPopPage(Route<dynamic> route, dynamic result) {
    setState(() => pages.remove(route.settings));
    return route.didPop(result);
  }

  @override
 Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Navigator(
          key: _navigatorKey,
          onPopPage: _onPopPage,
          pages: List.of(pages),
        ),
      ),
    );
  }
}
