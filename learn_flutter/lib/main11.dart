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
    return StackDemo2();
  }
}

class StackDemo2 extends StatefulWidget {
  const StackDemo2({
    Key? key,
  }) : super(key: key);

  @override
  _StackDemo2State createState() => _StackDemo2State();
}

class _StackDemo2State extends State<StackDemo2> {
  bool _isFavor = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset('assets/images/mao.jpeg'),
        Positioned(
          right: 0,
          left: 0,
          bottom: 0,
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            color: Color.fromARGB(150, 0, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('猫咪啦啦啦啦',
                    style: TextStyle(fontSize: 30, color: Colors.white)),
                // Icon(Icons.favorite, color: Colors.white),
                IconButton(
                    onPressed: () {
                      setState(() {
                        _isFavor = !_isFavor;
                      });
                    },
                    icon: Icon(Icons.favorite,
                        color: _isFavor ? Colors.red : Colors.white))
              ],
            ),
          ),
        )
      ],
    );
  }
}

class StackDemo extends StatelessWidget {
  const StackDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /**
     * Stack
     * - alignment 从什么位置开始排布所有的子widget
     * - fit: expand 将子元素拉伸到尽可能大
     * - overflow: 超出部分的处理
     */
    return Stack(
      alignment: AlignmentDirectional.center,
      // fit: StackFit.expand,
      // clipBehavior: Clip.antiAlias,
      children: [
        // 层叠顺序就是从底往前
        Image.asset('assets/images/mao.jpeg'),
        Positioned(
          right: 10,
          child: Container(
            width: 150,
            height: 150,
            color: Colors.red,
          ),
        ),
        Positioned(
            right: 10,
            child: Text(
              '测试层叠',
              style: TextStyle(fontSize: 30),
            ))
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
