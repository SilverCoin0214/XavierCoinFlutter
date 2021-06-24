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
      appBar: AppBar(title: Text('Counter Test计数器')),
      body: SceHomePageBody("测试父组件传递给子组件"),
    );
  }
}

// 定义到Widget中的数据都是不可变的, 必须定义为final.

// 为了解决 Widget中定义的数据不可变, StatefulWidget被设计成了两个类:
// 1. 一个类继承自 StatefulWidget, 作为 Widget树的一部分
// 2. 一个类继承自 State, 用于记录StatefulWidget会变化的状态, 并且根据状态的变化, 构建出新的Widget
class SceHomePageBody extends StatefulWidget {
  final message;

  SceHomePageBody(this.message);

  @override
  State<StatefulWidget> createState() {
    return _SceHomeContentState();
  }
}

class _SceHomeContentState extends State<SceHomePageBody> {
  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getButtons(),
          Text(
            '当前计数: $_counter',
            style: TextStyle(color: Colors.pink, fontSize: 25),
          ),
          Text('有状态的组件传递: ${widget.message}')
        ],
      ),
    );
  }

  Widget _getButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ElevatedButton(
          onPressed: () {
            setState(() {
              _counter++;
            });
          },
          child: Text('+', style: TextStyle(color: Colors.white, fontSize: 25)),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _counter--;
              });
            },
            child:
                Text('-', style: TextStyle(color: Colors.white, fontSize: 25)))
      ],
    );
  }
}
