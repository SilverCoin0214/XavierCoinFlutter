/*
 * @Author: spike
 * @Date: 2021-09-06 22:54:34
 * @LastEditTime: 2021-09-10 22:15:31
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/douban_demo/lib/main.dart
 */
import 'package:douban_demo/widgets/star_rating.dart';
import 'package:flutter/material.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blueAccent),
      home: SceHomePage(),
    );
  }
}

class SceHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('首页')),
      body: SceHomePageBody("测试父组件传递给子组件"),
    );
  }
}

class SceHomePageBody extends StatefulWidget {
  final message;

  SceHomePageBody(this.message);

  @override
  State<StatefulWidget> createState() {
    return _SceHomeContentState();
  }
}

class _SceHomeContentState extends State<SceHomePageBody> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SceStartRating(rating: 8),
    );
  }
}
