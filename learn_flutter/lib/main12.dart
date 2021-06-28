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
        title: Text('基础widget - 滚动widget'),
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
    return ListView.separated(
        itemBuilder: (BuildContext ctx, int index) {
          return Text(
            'hellow wolrld $index',
            style: TextStyle(fontSize: 20),
          );
        },
        separatorBuilder: (BuildContext ctx, int index) {
          return Divider(
            color: Colors.red,
            thickness: 10, // 线的粗度
            indent: 30, // 缩进
            height: 30, // 线占据的高度
          );
        },
        itemCount: 100);
  }
}

class ListViewDemo2 extends StatelessWidget {
  const ListViewDemo2({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      // ListView.builder相当于是懒加载
      itemCount: 100,
      itemBuilder: (BuildContext ctx, int index) {
        return Text(
          'hellow wolrld $index',
          style: TextStyle(fontSize: 20),
        );
      },
    );
  }
}

class ListViewDemo1 extends StatelessWidget {
  const ListViewDemo1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView(
      // scrollDirection: Axis.vertical,
      // itemExtent: 100, // 给每个item设置固定高度
      children: List.generate(100, (index) {
        return ListTile(
          leading: Icon(Icons.people),
          trailing: Icon(Icons.delete),
          title: Text('联系人${index + 1}'),
          subtitle: Text('联系人电话号码: 1238945y'),
        );
      }),
    );
  }
}
