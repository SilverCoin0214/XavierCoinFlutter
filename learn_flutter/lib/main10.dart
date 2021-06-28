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
        title: Text('基础widget - 单子布局组件'),
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
    return ContainerDemo();
  }
}

// 单布局组件, container相当于div, 各种组件的大杂烩
class ContainerDemo extends StatelessWidget {
  const ContainerDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.red,
      width: 200,
      height: 200,
      // alignment: Alignment(0, 0),
      padding: EdgeInsets.only(top: 10),
      margin: EdgeInsets.all(10),
      child: Icon(Icons.pets, size:50, color: Colors.white,),
      // transform: Matrix4.rotationZ(50),

      // decoration主要用于装饰
      decoration: BoxDecoration(
        color: Colors.red,
        border: Border.all(
          width: 5,
          color: Colors.purple
        ),
        borderRadius: BorderRadius.circular(100)
      ),
    );
  }
}

// 单布局组件Padding, 用来增加组件内边距的
class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(
            bottom: 10,
          ),
          child: Text('你好',
              style: TextStyle(fontSize: 30, backgroundColor: Colors.blue)),
        ),
        Text('不好',
            style: TextStyle(fontSize: 30, backgroundColor: Colors.blue)),
        SizedBox(
          height: 20,
        ),
        Text('很好',
            style: TextStyle(fontSize: 30, backgroundColor: Colors.blue)),
      ],
    );
  }
}

// 单布局组件, Align和Center相当, Center就是Align
class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: Align(
        alignment: Alignment(1, -1),
        child: Icon(Icons.pets, size: 50),
      ),
    );
  }
}
