/*
 * @Author: your name
 * @Date: 2022-03-03 15:43:32
 * @LastEditTime: 2022-03-03 16:52:37
 * @LastEditors: your name
 * @Description: 打开koroFileHeader查看配置 进行设置: https://github.com/OBKoro1/koro1FileHeader/wiki/%E9%85%8D%E7%BD%AE
 * @FilePath: /XavierCoinFlutter/flu_nav/lib/ex_05_delegate.dart
 */
import 'package:flu_nav/pages/home.dart';
import 'package:flu_nav/route/route_parser.dart';
import 'package:flu_nav/route/router_delegate.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final delegate = MyRouteDelegate(
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute(
        settings: settings,
        builder: (BuildContext context) {
          return const HomePage();
        },
      );
    },
  );

  @override
  Widget build(BuildContext context) {
    // Navigator 2.0 之后，Flutter 也提供了 MaterialApp 的新构造函数 router 来帮助我们直接在应用顶层构造出全局的 Router 组件
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routeInformationParser: MyRouteParser(), // 路由信息解析
      routerDelegate: delegate, // 路由代理
    );
  }
}
