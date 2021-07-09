import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/rendering.dart';

main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: SceHomePage());
  }
}

class SceHomePage extends StatelessWidget {
  const SceHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('基础widget - '),
      ),
      body: SceHomeContent(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => print('FloatingActionButton Click'),
      ),
    );
  }
}

class SceHomeContent extends StatefulWidget {
  const SceHomeContent({Key? key}) : super(key: key);

  @override
  _SceHomeContentState createState() => _SceHomeContentState();
}

class _SceHomeContentState extends State<SceHomeContent> {
  bool _onOff = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: CupertinoTextField(
         decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 8.0),
              ),
              // 监听键盘点击
              onChanged: (value) {
                print(value);
              },
              // 监听提交
              onSubmitted: (value) {
                print('onSubmitted: $value');
              },
      ),
    );
  }
}
