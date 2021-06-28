import 'package:flutter/material.dart';

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
        title: Text('基础widget - 多子布局组件 Flex, Row, Column'),
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
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        // 层叠顺序就是从底往前
        Image.asset('assets/images/mao.jpeg'),
        Container(
          width: 150,
          height: 150,
          color: Colors.red,
        ),
        Text('测试层叠', style: TextStyle(fontSize: 30),)
      ],
    );
  }
}

// 纵向
class ColumnDemo extends StatelessWidget {
  const ColumnDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start, // 这个就是flex布局里的justify-content
      crossAxisAlignment: CrossAxisAlignment.end, // flex布局里的 align-content
      mainAxisSize: MainAxisSize.max,
      verticalDirection: VerticalDirection.up,
      children: [
        Container(
          width: 80,
          height: 60,
          color: Colors.red,
        ),
        Container(
          width: 110,
          height: 70,
          color: Colors.blue,
        ),
        Container(
          width: 40,
          height: 80,
          color: Colors.green,
        ),
        Container(
          width: 80,
          height: 120,
          color: Colors.orange,
        ),
      ],
    );
  }
}

// 横向
class RowDemo extends StatelessWidget {
  const RowDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: Row(
        mainAxisAlignment:
            MainAxisAlignment.spaceEvenly, // 这个就是flex布局里的justify-content
        crossAxisAlignment: CrossAxisAlignment.center, // flex布局里的 align-content
        mainAxisSize: MainAxisSize.max,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              width: 180,
              height: 60,
              color: Colors.red,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 510,
              height: 70,
              color: Colors.blue,
            ),
          ),
          Container(
            width: 40,
            height: 80,
            color: Colors.green,
          ),
          Container(
            width: 80,
            height: 120,
            color: Colors.orange,
          ),
        ],
      ),
    );
  }
}
