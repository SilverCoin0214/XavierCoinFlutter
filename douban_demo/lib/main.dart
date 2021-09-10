/*
 * @Author: spike
 * @Date: 2021-09-06 22:54:34
 * @LastEditTime: 2021-09-06 23:16:48
 * @LastEditors: Please set LastEditors
 * @Description: In User Settings Edit
 * @FilePath: /XavierCoinFlutter/douban_demo/lib/main.dart
 */
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
      child: SceStartRating(),
    );
  }
}

class SceStartRating extends StatefulWidget {
  const SceStartRating({Key? key}) : super(key: key);

  @override
  _SceStartRatingState createState() => _SceStartRatingState();
}

class _SceStartRatingState extends State<SceStartRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star_border, color: Colors.red, size: 30),
            Icon(Icons.star_border, color: Colors.red, size: 30),
            Icon(Icons.star_border, color: Colors.red, size: 30),
            Icon(Icons.star_border, color: Colors.red, size: 30),
            Icon(Icons.star_border, color: Colors.red, size: 30),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.star, color: Colors.red, size: 30),
            Icon(Icons.star, color: Colors.red, size: 30),
            Icon(Icons.star, color: Colors.red, size: 30),
          ],
        ),
      ],
    );
  }
}
