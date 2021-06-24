import 'package:flutter/material.dart';

main() => {runApp(MyApp())};

/**
 * Widget:
 *  1. 有状态的widget:   StatefulWidget
 *  2. 无状态的widget    StatelessWidget
 */

class MyApp extends StatelessWidget {
  //
  @override
  Widget build(BuildContext context) {
    // material是一个设计风格
    return MaterialApp(home: SceHomePage());
  }
}

class SceHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // scaffold是脚手架, 可以直接帮忙搭建界面
    return Scaffold(
        appBar: AppBar(
          title: Text("first flutter App 02"),
        ),
        body: SceContentBody());
  }
}

// Stateful不能定义状态 -> 创建一个单独的类, 这个类负责维护状态
class SceContentBody extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return SceContentBodyState();
  }
}

class SceContentBodyState extends State<SceContentBody> {
  bool? flag = true;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
            value: flag,
            onChanged: (value) {
              setState(() {
                flag = value;
              });
            }),
        Text(
          "同意协议",
          style: TextStyle(fontSize: 20),
        )
      ],
    ));
  }
}
